var url = tinyMCE.getParam("external_image_list_url");
if (url != null) {
	// Fix relative
	if (url.charAt(0) != '/' && url.indexOf('://') == -1){
		url = tinyMCE.documentBasePath + "/" + url;
		}

	document.write('<sc'+'ript language="javascript" type="text/javascript" src="' + url + '"></sc'+'ript>');
}

function insertImage() {
	var src = document.forms[0].src.value;
	var alt = document.forms[0].alt.value;
	var border = document.forms[0].border.value;
	var vspace = document.forms[0].vspace.value;
	var hspace = document.forms[0].hspace.value;
	var width = document.forms[0].width.value;
	var height = document.forms[0].height.value;
	var align = document.forms[0].align.options[document.forms[0].align.selectedIndex].value;

	tinyMCEPopup.restoreSelection();
	tinyMCE.themes['advanced']._insertImage(src, alt, border, hspace, vspace, width, height, align);
	tinyMCEPopup.close();
}


function init() {
	tinyMCEPopup.resizeToInnerSize();

	document.getElementById('srcbrowsercontainer').innerHTML = getBrowserHTML('srcbrowser','src','image','theme_advanced_image');

	var formObj = document.forms[0];

	for (var i=0; i<document.forms[0].align.options.length; i++) {
		if (document.forms[0].align.options[i].value == tinyMCE.getWindowArg('align'))
			document.forms[0].align.options.selectedIndex = i;
	}

	formObj.src.value = tinyMCE.getWindowArg('src');
	formObj.alt.value = tinyMCE.getWindowArg('alt');
	formObj.border.value = tinyMCE.getWindowArg('border');
	formObj.vspace.value = tinyMCE.getWindowArg('vspace');
	formObj.hspace.value = tinyMCE.getWindowArg('hspace');
	formObj.width.value = tinyMCE.getWindowArg('width');
	formObj.height.value = tinyMCE.getWindowArg('height');
	formObj.insert.value = tinyMCE.getLang('lang_' + tinyMCE.getWindowArg('action'), 'Insert', true); 

	// Handle file browser
	if (isVisible('srcbrowser'))
		document.getElementById('src').style.width = '180px';

	// Auto select image in list
	if (typeof(tinyMCEImageList) != "undefined" && tinyMCEImageList.length > 0) {
		for (var i=0; i<formObj.image_list.length; i++) {
			if (formObj.image_list.options[i].value == tinyMCE.getWindowArg('src'))
				formObj.image_list.options[i].selected = true;
		}
	}
	
	callForFilelist();
	
	
}

var preloadImg = new Image();

function resetImageData() {
	var formObj = document.forms[0];
	formObj.width.value = formObj.height.value = "";	
}

function updateImageData() {
	var formObj = document.forms[0];

	if (formObj.width.value == "")
		formObj.width.value = preloadImg.width;

	if (formObj.height.value == "")
		formObj.height.value = preloadImg.height;
}

function getImageData() {
	preloadImg = new Image();
	tinyMCE.addEvent(preloadImg, "load", updateImageData);
	tinyMCE.addEvent(preloadImg, "error", function () {var formObj = document.forms[0];formObj.width.value = formObj.height.value = "";});
	preloadImg.src = tinyMCE.convertRelativeToAbsoluteURL(tinyMCE.settings['base_href'], document.forms[0].src.value);
}

//KAG - adding scripts to pull filenames from server using AJAX
function xmlhttpPost(strURL) {
    var xmlHttpReq = false;
    var self = this;
    // Mozilla/Safari
    if (window.XMLHttpRequest) {
        self.xmlHttpReq = new XMLHttpRequest();
    }
    // IE
    else if (window.ActiveXObject) {
        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.open('POST', strURL, true);
    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    self.xmlHttpReq.onreadystatechange = function() {
        if (self.xmlHttpReq.readyState == 4) {
            updatepage(self.xmlHttpReq.responseText);
        }
    }
    self.xmlHttpReq.send(getquerystring());
}

function getquerystring() {
    //var form     = document.forms['f1'];
    //var word = form.word.value;
    qstr = 'folder=blog';
    return qstr;
}

function updatepage(str){
    if(str == "") {
        //alert("delay");
        window.setTimeout("callForFilelist()", 1000);
    } else {
        //document.getElementById("result").innerHTML = str;
        var fileListArray = str.split("|");
        var imagelistDDL = document.getElementById("imagelist");
        
        for(i=0; i < fileListArray.length; i++) {            
            if(Option) {
                imagelistDDL.options[i+1] = new Option(fileListArray[i].substring(fileListArray[i].lastIndexOf("/")+1),fileListArray[i]);
            } else {       
                var elOptNew = document.createElement('option');
                elOptNew.text = fileListArray[i].substring(fileListArray[i].lastIndexOf("/")+1);
                elOptNew.value = fileListArray[i];           
                imagelistDDL.add(elOptNew, null); // standards compliant; doesn't work in IE        
                //imagelistDDL.add(elOptNew); // IE only
            }   
        }
        imagelistDDL.disabled = false;
    }
}

function setImageLocValue() {    
    var imagelistDDL = document.getElementById("imagelist");
    var textbox = document.getElementById("src");
    textbox.value = imagelistDDL.options[imagelistDDL.selectedIndex].value;            
}

function callForFilelist() {

    //KAG - call to init the image ddl
	xmlhttpPost("../../../../../_private/handlers/BlogImageList.ashx");

}



