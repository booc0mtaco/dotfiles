JsOsaDAS1.001.00bplist00�Vscript_G// move current tab's page into reading list
var chrome = Application('Google Chrome');
var safari = Application('Safari');

// first, source the chrome app's current tab, and pull the URL
chrome.activate()

var url = chrome.windows[0].activeTab.url();

safari.addReadingListItem(url, {
	andPreviewText: "Added from Chrome"
});                              ] jscr  ��ޭ