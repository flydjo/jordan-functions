const alert = alertMessage => {
    console.log(alertMessage);
    return alertMessage;
};

module.exports.sendAlertLinkedin = (req, res) => {
    const message = alert("Hello world")
    console.log(message);
    return res.status(200).json({ Msg: message });
};
