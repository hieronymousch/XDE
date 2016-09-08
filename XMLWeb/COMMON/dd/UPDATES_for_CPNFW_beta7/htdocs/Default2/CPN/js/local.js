/* 
Author: Crescencio IBANEZ (Cdt IBANEZ)
Service : MR-Mgt
Bemilcom : 9-2400-1469
EMail : crescencio.ibanez@mil.be
Version: 2.1.4
Release Note: See Below
Contributors : 
v2.1.4 :
	@ Version Alignment with Node_Config.xsl
	@ showPopup added New Parameters and Width is still UNUSED
*/

function colateAllAndSumit(form){
	var inputs = document.getElementById('choose').getElementsByTagName("input");
	var years='';
	var dopas='';
	var cats='';
	for(var i=0; i < inputs.length; i++){		
		if(inputs[i].name=='year' && inputs[i].checked){
			years = years + (years==''?'':',') + inputs[i].value;
		}		
	}
	for(var i=0; i < inputs.length; i++){		
		if(inputs[i].name=='dopa' && inputs[i].checked){
			dopas = dopas + (dopas==''?'':',') + inputs[i].value;
		}		
	}
	for(var i=0; i < inputs.length; i++){		
		if(inputs[i].name=='cat' && inputs[i].checked){
			cats = cats + (cats==''?'':',') + inputs[i].value;
		}		
	}
	form.pYEARS.value = years;
	form.pDOPAS.value = dopas;
	form.pCATS.value = cats;
    this.submit();
}

function showPopup(url,width){
	var xhr_object = null;   
	xhr_object = new ActiveXObject("Microsoft.XMLHTTP");   

	xhr_object.open("GET", url, false);   
	xhr_object.send(null);   
	//if(xhr_object.readyState == 4) return overlib(xhr_object.responseText,width, 1000);   
	if(xhr_object.readyState == 4) return overlib(xhr_object.responseText, CAPTION, 'MR Node Tooltip PopUp', FGCOLOR, '#D9D4D2', BGCOLOR, '#000000', CAPCOLOR, '#ffffff', BORDER, 4, WRAP, VAUTO, HAUTO);   
}

// function loading the result of a xmlweb into a given html object (innerHTML)
// to use it :
// first param is the id of the html tag
// second is the xmlweb to call
// then paramName, paraValue to add to the url
// example: loadDiv('myDivid, 'myXMLWeb.xml',param1,value1,param2,value2)
// loads into tag having myDivid as id the result of myXMLWeb.xml?param1=value1&param2=value2
function loadDiv(divID,url){
	for(var i=2; i < arguments.length; i++){		
		if(i % 2 == 0){
		    url = url + (i==2?'?':'&') + arguments[i];
		} else {
			url = url + '=' + arguments[i];
		}
	}
	var xhr_object = null;
    if(document.getElementById(divID).innerHTML > 100) return;	
	if(window.XMLHttpRequest) // Firefox   
		xhr_object = new XMLHttpRequest();   
	else if(window.ActiveXObject) // Internet Explorer   
		xhr_object = new ActiveXObject("Microsoft.XMLHTTP");   
	else { // XMLHttpRequest non supporté par le navigateur   
		alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");   
		return;   
	}   
	xhr_object.onreadystatechange=function(){
		var div = document.getElementById(divID);
		switch (xhr_object.readyState) {
		case 0:
			div.innerHTML = "The httpRequest object is not initialized.<br/>";
			break;
		case 1:
			div.innerHTML = "Waiting for the send method.<br/>";
			break;
		case 2:
			div.innerHTML = "The send method has been called, but no content is available at this time.<br/>";
			break;
		case 3:
			div.innerHTML = "Partial data has been received, but this content is not available yet.<br/>";
			break;
		case 4:
			div.innerHTML = xhr_object.responseText;
			break;
		}
		var scriptTags = div.getElementsByTagName('script');
		for (var n = 0; n < scriptTags.length; n++) {
			//console.log('hallo');
			eval(scriptTags[n].innerHTML);
		}
	}
	xhr_object.open("GET", url, true);	
	xhr_object.send(null); 
	document.getElementById(divID).innerHTML = "<img width='110px' src='/Default2/CPN/img/HorWait.gif'/><BR/>" + 'loading: ' + url;

}