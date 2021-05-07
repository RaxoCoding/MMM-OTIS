const NodeHelper = require('node_helper');
const pyScriptPath = __dirname + "/python";
let { PythonShell } = require('python-shell')
var oneLinerJoke = require('one-liner-joke');
var wd = require("word-definition");

module.exports = NodeHelper.create({
    answer: "none",
    doneWithPython: "false",
    customCommands: ["joke", 'wikipedia', 'time', 'date'],

    start() {
        console.log(`Starting node helper for: ${this.name}`);
    },

    capitalize: function(word) {
        const lower = word.toLowerCase();
        return word.charAt(0).toUpperCase() + lower.slice(1);
    },

    getTime: function() {

        var today = new Date();

        if (today.getMinutes() < 10) {
            var time = today.getHours() + ":0" + (today.getMinutes());
        } else {
            var time = today.getHours() + ":" + (today.getMinutes());
        }
        var weekday = today.getDay();
        switch (weekday) {
            case 0:
                weekday = "Sunday";
                break;
            case 1:
                weekday = "Monday";
                break;
            case 2:
                weekday = "Tuesday";
                break;
            case 3:
                weekday = "Wednesday";
                break;
            case 4:
                weekday = "Thursday";
                break;
            case 5:
                weekday = "Friday";
                break;
            case 6:
                weekday = "Saturday";
                break;

        }


        var finalDate = time + " on a " + weekday;
        return finalDate;
    },

    getDate: function() {
        var date;
        //Get User Time

        var today = new Date();
        if (today.getMonth() + 1 < 10 && today.getDate() < 10) {
            date = today.getFullYear() + '-0' + (today.getMonth() + 1) + '-0' + today.getDate();
        } else if (today.getMonth() + 1 < 10) {
            date = today.getFullYear() + '-0' + (today.getMonth() + 1) + '-' + today.getDate();
        } else if (today.getDate() < 10) {
            date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-0' + today.getDate();
        } else {
            date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        }

        finalDate = date;

        return finalDate;
    },

    runPython: async function(payload, self) {
        var options = {
            mode: 'text',
            pythonPath: __dirname + "/python/miniconda3/bin/python",
            pythonOptions: ['-u'],
            scriptPath: pyScriptPath,
            args: [payload]
        };

        await PythonShell.run('askBot.py', options, function(err, results) {
            if (err) throw err;
            self.answer = results[0];
            if (self.customCommands.includes(self.answer)) {
                if (self.answer == "joke") {
                    var joke = oneLinerJoke.getRandomJoke();
                    self.sendSocketNotification('ANSWER', joke.body);
                } else if (self.answer == "wikipedia") {
                    wd.getDef(results[1], "en", null, function(definition) {
                        if (definition.err) {
                            self.sendSocketNotification('ANSWER', 'Could not find that word sorry.');
                        } else {
                            var word = self.capitalize(results[1]);
                            self.sendSocketNotification('ANSWER', word + ": " + definition.definition);
                        }
                    });
                } else if (self.answer == "time") {
                    var time = self.getTime();
                    self.sendSocketNotification('ANSWER', time);
                } else if (self.answer == "date") {
                    var date = self.getDate();
                    self.sendSocketNotification('ANSWER', date);
                }
            } else {
                self.sendSocketNotification('ANSWER', self.answer);
            }
        });
    },

    socketNotificationReceived(notification, payload) {
        if (notification === 'CONFIG') {
            this.config = payload;
        } else if (notification === 'GET_ANSWER') {
            var self = this;
            this.runPython(payload, self);
        }
    }
});