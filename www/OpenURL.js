var OpenURL = {
  open: function(successCallback, errorCallback, url) {
    cordova.exec(successCallback, errorCallback, "OpenURL", "open", [url]);
  },
}
module.exports = OpenURL;
