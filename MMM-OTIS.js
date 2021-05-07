//MMM-OTIS.js:

Module.register("MMM-OTIS", {
    // Default module config.
    text: "O.T.I.S 1.0",
    defaults: {
        language: "en",
        text: "Hello World!"
    },

    replyToText: function(text) {
        this.sendNotification("MMM-TTS", text);
    },

    notificationReceived: function(notification, payload, sender) {
        if (notification === "REPLY_TO_TEXT") {
            this.sendSocketNotification('GET_ANSWER', payload);
        }
    },

    socketNotificationReceived(notification, payload) {
        if (notification === 'ANSWER') {
            this.replyToText(payload);
        }
    },

    getDom: function() {
        var wrapper = document.createElement("div");
        wrapper.className = "small light";
        wrapper.innerHTML = this.text;
        return wrapper;
    },

    start() {
        Log.info(`Starting module: ${this.name}`);
        this.sendSocketNotification('CONFIG', this.config);
    },
});