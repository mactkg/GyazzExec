//
// called when extension icon is clicked
//
chrome.browserAction.onClicked.addListener(function(tab) {
    chrome.tabs.sendMessage(tab.id, {}, {}, function(){
    });
});
