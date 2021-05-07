# MMM-OTIS
Magic mirror module that takes text as input and responds with machine learning accuracy

This an extension for the [MagicMirror](https://github.com/MichMich/MagicMirror) to recieve text input and send text answers.

This is a Work In Progress and only has a few commands for now but will get bigger overtime

This module was also made to work with MMM-Hello-Mirror as text inpurt and MMM-TTS as output

## Installation
1. Navigate into your MagicMirror's `modules` folder
2. clone this git repository
3. `npm install` is needed in cd /MMM-OTIS
4. (Re)start magic mirror (e.g. with `pm2 restart mm`)

# Using the module
To use this module, add it to the modules array in the `config/config.js` file:

```javascript
modules: [
    {
        module: 'MMM-OTIS',
	position: 'top_right',
    }
]
```

## Configuration Options
The following properties can be configured:

<table width="100%">
	<thead>
		<tr>
			<th>Option</th>
			<th width="100%">Description</th>
		</tr>
	<thead>
	<tbody>
		<tr>
			<td><code>language</code></td>
			<td>
				The language used.
				<br>
				<br><b>Valid values:</b> 
				<br><code>en</code>
				<br>
				<br><b>Default value:</b> <code>en</code>
			</td>
		</tr>	
	</tbody>
</table>

## For Developers

For Module to work you will need to change your python path in the node_helper.js file
change the pythonPath variable in options of the runPython function to your python env path

Python dependencies:
random, json, sys, os, numpy, torch, torch.nn, torch.utils.data, nltk, nltk.stem.portet


To use MMM-OTIS in your module you have to send a socket notification like this `self.sendNotification("REPLY_TO_TEXT", "hello");`.

It will reply with a notification like this: `this.sendNotification("MMM-TTS", text);` and then you can run the answer through whichever module you use

