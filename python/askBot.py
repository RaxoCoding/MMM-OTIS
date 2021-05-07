import random
import json
import torch
from model import NeuralNetwork
from nltk_utils import bag_of_words, tokenize, stem
import sys
import os

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

with open(os.getcwd() + '/modules/MMM-OTIS/python/intents.json', 'r') as f:
    intents = json.load(f)

FILE = os.getcwd() + "/modules/MMM-OTIS/python/data.pth"
data = torch.load(FILE)

input_size = data["input_size"]
hidden_size = data["hidden_size"]
output_size = data["output_size"]
all_words = data["all_words"]
tags = data["tags"]
model_state = data["model_state"]

model = NeuralNetwork(input_size, hidden_size, output_size).to(device)
model.load_state_dict(model_state)
model.eval()

def getAnswer():
    sentence = sys.argv[1]

    sentence = tokenize(sentence)
    X = bag_of_words(sentence, all_words)
    X = X.reshape(1, X.shape[0])
    X = torch.from_numpy(X)

    output = model(X)

    _, predicted = torch.max(output, dim=1)
    tag = tags[predicted.item()]

    probs = torch.softmax(output, dim=1)
    prob = probs[0][predicted.item()]


    if prob.item() > 0.75:
        for intent in intents["intents"]:
            if tag == intent["tag"]:
                if (tag == "wikisearch"):
                    newSentence = [stem(w) for w in sentence]
                    searchWord = ""
                    for w in newSentence:
                        match = False
                        for word in intent["patterns"]:
                            if w in word:
                                match = True
                        if (match == False):
                            searchWord = w
                            index = newSentence.index(searchWord)
                            searchWord = sentence[index]
                            break

                    print(random.choice(intent["responses"]))
                    print(searchWord)
                    sys.stdout.flush()    
                else:
                    print(random.choice(intent["responses"]))
                    sys.stdout.flush()
    else:
        print('Did not catch that, sorry')
        sys.stdout.flush()

getAnswer()

