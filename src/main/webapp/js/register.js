function showMessage(message, type) {
    var messageBox = document.createElement("div");
    messageBox.textContent = message;
    messageBox.style.padding = "10px";
    messageBox.style.margin = "10px 0";
    messageBox.style.borderRadius = "5px";
    messageBox.style.fontSize = "16px";
    messageBox.style.fontWeight = "bold";
    messageBox.style.textAlign = "center";

    // Set message background color based on type
    if (type === "success") {
        messageBox.style.backgroundColor = "#4CAF50";
        messageBox.style.color = "white";
    } else if (type === "error") {
        messageBox.style.backgroundColor = "#f44336";
        messageBox.style.color = "white";
    }

    // Find the target element (e.g., #message-container) and append the message
    var messageContainer = document.getElementById("register-message-container");
    if (messageContainer) {
        messageContainer.appendChild(messageBox);
        // Redirect to index.jsp after 2 seconds if the login is successful
        if (type === "success") {
            setTimeout(function() {
                window.location.href = "login.jsp";
            }, 2000); // 2000ms = 2 seconds
        }
    } else {
        console.error("Message container not found");
    }
}

window.onload = function() {
    if (typeof message !== 'undefined' && message) {
        showMessage(message, messageType);
    }
};
