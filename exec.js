//
// main part
//
indent = function(text){
  return text.match(/^(\s)*/)[0].length;
};

// called from exec_bg.js
chrome.runtime.onMessage.addListener(function(req, sender, sendResponse) {
    lines = $('.lines > .line > .text');

    codestr = '';
    processing = 'no'; // no, yes, over
    codeindent = 0;
    for(let index = 0; index < lines.length; index++) {
	line = lines[index];
	text = $(line).text();
	if(processing == 'no'){
	    // detect JavaScript code block
	    if(text.match(/^\s*javascript\s*$/) || text.match(/^\s*\w+\.js\s*$/)){
		processing = 'yes';
		codeindent = indent(text);
	    }
	}
	else if(processing == 'yes'){
	    if(indent(text) > codeindent){
		codestr += (text + "\n");
	    }
	    else {
		processing = 'over';
	    }
	}
    }

    a = $('<script>');
    a.text(codestr);
    $('body').append(a);
});
