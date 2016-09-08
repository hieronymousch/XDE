/* 
Author: Crescencio IBANEZ (Cdt IBANEZ)
Service : MR-Mgt
Bemilcom : 9-2400-1469
EMail : crescencio.ibanez@mil.be
Version: 
Release Note: See Below
Contributors : 

*/

/* Active Functions 
--------------------*/

/* Format Numbers in dataTable (used in Template Node_Std_Table */
function fn_formatNr_BE(vNr) {		
	vNr = vNr.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
	vNr = vNr.replace(/[,]/g, ";");
	vNr = vNr.replace(/[.]/g, ",");
	vNr = vNr.replace(/[;]/g, ".");			
	return vNr;
}

/* Clear all LocalStorage DataTable Settings for a Report */
function CleardTSettings4URL(Rurl) {		
	for(var i=0, len=localStorage.length; i<len; i++) {
	    var key = localStorage.key(i);
	    if(key.indexOf(Rurl)>-1) {
	    	localStorage.removeItem(key);
	    	delete window.localStorage[key];
	    }
	}
	MRNNotif('1','T29 - All DataTable Settings Cleared','All Settings Cleared. Please Refresh Report',10,'ALL');	
}

/* Used For DataDic and OpenTip for Generation of Unique Id in DOM */
	function uniqueid(){
	    // always start with a letter (for DOM friendlyness)
	    var idstr=String.fromCharCode(Math.floor((Math.random()*25)+65));
	    do {                
	        // between numbers and characters (48 is 0 and 90 is Z (42-48 = 90)
	        var ascicode=Math.floor((Math.random()*42)+48);
	        if (ascicode<58 || ascicode>64){
	            // exclude all chars between : (58) and @ (64)
	            idstr+=String.fromCharCode(ascicode);    
	        }                
	    } while (idstr.length<32);

	    return (idstr);
		};
										
	function SetNodeLang(Node,Language) {
		NodeSetArr.Language=Language
		//MRNNotif('1','Language Changed','Language is now '+Language='. Page will now be relaoded',3000,'ALL');
		localStorage.setItem(Node+'_Settings',JSON.stringify(NodeSetArr));
		window.location="/";
		};
	
	// Set User And Army Number
	function SetUAAN(Node,UserName,ArmyNumber,Language,DisplayName) {
		// Retrieve Settings
		var Settings =JSON.parse(localStorage.getItem(Node+'_Settings'));	
		
		if(UserName!=='') {Settings.user=UserName};
		if(ArmyNumber!=='') {Settings.armynumber=ArmyNumber};
		if(DisplayName!=='') {Settings.displayname=DisplayName};
		if(Language!=='') {Settings.Language=Language};
		var LoginMsg='User is '+Settings.user+'<br/>Name is '+Settings.displayname+'<br/>Army Number is '+Settings.armynumber+'<br/>Language is '+Settings.Language;
		localStorage.setItem(Node+'_Settings',JSON.stringify(Settings));
		// Debug 
		if(Settings.DebugMode=='Y') {MRNNotif('1','TN26 - '+Node+' Settings Adapted',LoginMsg,3000,'ALL')};
	};

	function SettingsInitialize(Node) {
		localStorage.removeItem(Node+'_Settings');
		delete window.localStorage[Node+'_Settings'];
		var NodeSettings={
			'user':'Admin Local',
			'displayname':'Local Admin on Node',
			'armynumber':'N/A',
			'type':'Node_Admin',
			'nom': 'User Node Settings',
			'Menu':'1',
			'redirect':'N',
			'Prompt':'I',
			'DebugMode':'N',
			'backup':'N',
			'skin':'default',
			'Language':'EN',
			'Favorites':[
			{'Nbr':'01','nom':'Report 1 Title','URL':'http://localhost/1','order':'1','Active':'Y'},
			{'Nbr':'02','nom':'Report 2 Title','URL':'http://localhost/2','order':'2','Active':'Y'},
			{'Nbr':'03','nom':'Report 3 Title','URL':'http://localhost/3','order':'3','Active':'Y'},
			{'Nbr':'04','nom':'Report 4 Title','URL':'http://localhost/4','order':'4','Active':'Y'},
			{'Nbr':'05','nom':'Report 5 Title','URL':'http://localhost/5','order':'5','Active':'Y'},
			{'Nbr':'06','nom':'Report 6 Title','URL':'http://localhost/6','order':'6','Active':'Y'},
			{'Nbr':'07','nom':'Report 7 Title','URL':'http://localhost/7','order':'7','Active':'Y'},
			{'Nbr':'08','nom':'Report 8 Title','URL':'http://localhost/8','order':'8','Active':'Y'},
			{'Nbr':'09','nom':'Report 9 Title','URL':'http://localhost/9','order':'9','Active':'Y'},
			{'Nbr':'10','nom':'Report 10 Title','URL':'http://localhost/10','order':'10','Active':'Y'}
			]};
		localStorage.setItem(Node+'_Settings',JSON.stringify(NodeSettings));
	};

	function NodeSettingsSave(NodeSetname) {

		NodeSetArr.Favorites[0].nom=$('#FavT0').val();
		NodeSetArr.Favorites[0].URL=$('#FavU0').val();
		NodeSetArr.Favorites[1].nom=$('#FavT1').val();
		NodeSetArr.Favorites[1].URL=$('#FavU1').val();
		NodeSetArr.Favorites[2].nom=$('#FavT2').val();
		NodeSetArr.Favorites[2].URL=$('#FavU2').val();
		NodeSetArr.Favorites[3].nom=$('#FavT3').val();
		NodeSetArr.Favorites[3].URL=$('#FavU3').val();
		NodeSetArr.Favorites[4].nom=$('#FavT4').val();
		NodeSetArr.Favorites[4].URL=$('#FavU4').val();
		NodeSetArr.Favorites[5].nom=$('#FavT5').val();
		NodeSetArr.Favorites[5].URL=$('#FavU5').val();
		NodeSetArr.Favorites[6].nom=$('#FavT6').val();
		NodeSetArr.Favorites[6].URL=$('#FavU6').val();
		NodeSetArr.Favorites[7].nom=$('#FavT7').val();
		NodeSetArr.Favorites[7].URL=$('#FavU7').val();
		NodeSetArr.Favorites[8].nom=$('#FavT8').val();
		NodeSetArr.Favorites[8].URL=$('#FavU8').val();
		NodeSetArr.Favorites[9].nom=$('#FavT9').val();
		NodeSetArr.Favorites[9].URL=$('#FavU9').val();
		localStorage.setItem(NodeSetname,JSON.stringify(NodeSetArr));
		MRNNotif('1','TN27 - '+Node+' Settings Saved','Your Settings have been Successfuly Saved',3000,'ALL');
	};

	function GenerateDataDic() {
		var DDC=0;
		$('.DataDic').each(function(index){DDC=DDC+1;});
		if (DDC>0) {
				// Generate Pop-Up
				var tMsg="XXXXXX (pRID)<br/>Called Report<br/>Actual";
				MRNNotif('3','T18 - Report Data Dictionary incomplete',tMsg,10,"ALL");
				// Generate table
				$('.DataDic').each(function(index){$('#FillDD > tbody:last').append('<tr><td></td><td></td><td>REPORT</td><td>'+$(this).text()+'</td><td>FR</td><td>Caption</td><td>Hint Text To be filled</td></tr><tr><td></td><td></td><td>REPORT</td><td>'+$(this).text()+'</td><td>NL</td><td>Caption</td><td>Hint Text To be filled</td></tr><tr><td></td><td></td><td>REPORT</td><td>'+$(this).text()+'</td><td>EN</td><td>Caption</td><td>Hint Text To be filled</td></tr>');});
		        // Generate xlsx
		        alasql('SELECT * INTO XLSX("DataDicProposition.xlsx",{headers:true}) FROM HTML("#FillDD",{headers:true})');
			} else {
				// Do Nothing
			};
    };    
/* Notification Toastr for DrillDown(2) only for Local Node and MR Node Administrators */
	function MRNNotif(NType,NTitle,NMsg,NDur,NUserAdmin,Node) {
        var NotifSet =JSON.parse(localStorage.getItem(Node+'_Settings'));
        //if(NotifSet.DebugMode=='Y'||NUserAdmin=='Y'||NUserAdmin=='ALL'||document.URL.indexOf('localhost') > 0) {
        if(NUserAdmin=='Y'||NUserAdmin=='ALL'||document.URL.indexOf('localhost') > 0) {
           var opts = {
	               "closeButton": true,
	               "debug": false,
	               "positionClass": "toast-bottom-left",
	               "newestOnTop": true,
  			       "progressBar": true,
  			       "preventDuplicates": true,
			   	   "onclick": null,
	               "showDuration": "100",
	               "hideDuration": "3000",
	               "timeOut": "5000",
	               "extendedTimeOut": "1000",
	               "showEasing": "swing",
	               "hideEasing": "linear",
	               "showMethod": "fadeIn",
	               "hideMethod": "fadeOut"
	            };
	         // Notifications
	            switch (NType) {
				     case '1':
				         setTimeout(function(){toastr.info(NMsg, NTitle, opts);}, NDur);
				         break; 
			         case '2':
				         setTimeout(function(){toastr.success(NMsg, NTitle, opts);}, NDur);
				         break; 
			         case '3':
				         setTimeout(function(){toastr.warning(NMsg, NTitle, opts);}, NDur);
				         break; 
				     case '4':
				         setTimeout(function(){toastr.error(NMsg, NTitle, opts);}, NDur);
				         break; 
				     default: 
				         setTimeout(function(){toastr.info(NMsg, NTitle, opts);}, NDur);    	
					}
    			};
	    		localStorage['NodeDebug'] = localStorage['NodeDebug']+'<br/>- <em><b><u>'+NTitle+'</u></b></em> : '+NMsg;
    		};
/* Clearing State for DataTable */
	function cleardt() {
       var clearStorage = function(key, storage) {
            if(key.match(/^DataTables_/) !== null) {
                try {
                    storage.removeItem(key);
                } catch(e) {}
            }
        };

        try {
            $.each(window.localStorage, function(key) {
                clearStorage(key, window.localStorage);
            });

            $.each(window.sessionStorage, function(key) {
                clearStorage(key, window.sessionStorage);
            });
        } catch(e) {}
		return this;
    };
/* MPopUp - Generic Magnificent pop-Up */
    function MagPopUp(Mmsg){
		$.magnificPopup.open({
		 	items: {
			  src: '<div class="white-popup">'+Mmsg+'</div>',
		  	  type: 'inline'
			  },
			  closeBtnInside: true,
			  closeOnContentClick : false,
			  closeOnBgClick : false,
			  modal : false
		});
	};	
/* CCheck URL */
	function CheckURL(Rurl,UrlUserAdmin) {
		var URL=document.URL;
		var URLPart = URL.split("/");
		// Check if Match
		if(URL.indexOf(Rurl)== -1) {
				//Notification if Administrators
				// If LocalHost show Notification
				if (document.URL.indexOf("localhost")>=0) {
					var tMsg="URL is NOT matching with Report Id (pRID)<br/>Called Report : "+Rurl+"<br/>Actual URL :" + URL;
					MRNNotif('4','T15 - Report URL vs Actual URL not matching',tMsg,10,"ALL")
				} else { 
					// Do Nothing 
				};
				// If MR Node show Notification
				if (document.URL.indexOf("mrnode")>=0 && (UrlUserAdmin=='Y')) {
					var tMsg="URL is NOT matching with Report Id (pRID)<br/>Called Report : "+Rurl+"<br/>Actual URL :" + URL;
					MRNNotif('4','T17 - Report URL vs Actual URL not matching',tMsg,10,"ALL")
					//setTimeout(function(){document.location.href=URLPart[0] + "//" + URLPart[2];},4000);
				} else { 
					// Do Nothing 
				};
				// If MR Node and not admin show Magnific Popup
				if (document.URL.indexOf("mrnode")>=0 && (UrlUserAdmin!=='Y')) {
					//var tMsg="URL is NOT matching with Report Id (pRID) URL. You will be redirected to Homepage.<br/>Called Report : "+Rurl+"<br/>Actual URL :" + URL;
					//MRNNotif('4','T16 - Report URL vs Actual URL not matching',tMsg,10,"ALL")
					//setTimeout(function(){document.location.href=URLPart[0] + "//" + URLPart[2];},4000);
					$.magnificPopup.open({
					 	items: {
				    	  src: '<div class="white-popup"><h2><u>T16 - Report URL vs Actual URL not matching</u></h2>URL is NOT matching with Report Id (pRID) URL.<br/><center><h2>You will be redirected to Homepage in...</h2></center><div align="center" id="mTimer"></div></div>',
				      	  type: 'inline'
						  },
						  closeBtnInside: true,
						  closeOnContentClick : false,
						  closeOnBgClick : false,
						  modal : false,
						  callbacks: {
						    open: function() {
							      // Will fire when popup is closed
								  $().html(TimerPopUp(5,"http://mrnode.mil.intra","mTimer"));
						    	},
						    close: function() {
							      // Will fire when popup is closed
							      window.location="http://mrnode.mil.intra";
						    	}
					    	},
					});

				} else { 
					// Do Nothing 
				};
			} else {
				//alert("URL is matching ... So Show Report")
			};
		};
/* Remove Ghost cell before apply DataTable */
	function RemoveGhost (TableId) {
		var expr = new RegExp('>[ \t\r\n\v\f]*<', 'g');
		var tbhtml = $('#'+TableId).html();
		$('#'+TableId).html(tbhtml.replace(expr, '><')); 
	}
/* Formatting function for row details in dataTable - TdId is unique identifier for LoadDiv */
	function format ( d, TdId ) {
		// `d` is the original data object for the row
		return '<table width="100%" align="center" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
			'<tr>'+
				'<td id="dT_TD_'+TdId+'" align="center">LoadDiv ... dT_TD_'+TdId+'</td>'+
			'</tr>'+
		'</table>';
	}
/* Formatting function for row details in dataTable */
	function formatDD ( d, TextIn ) {
		// `d` is the original data object for the row
		return '<table width="100%" align="center" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
			'<tr>'+
				'<td align="center">'+TextIn+'</td>'+
			'</tr>'+
		'</table>';
	}
/* Function for calling in Drill-Down2 pMODE row details in dataTable - TdId is unique identifier for LoadDiv */
	function dt_Table_Detail(TableId,dT_TableVar,dT_URL_LD,DD2Lang) {
		// Add event listener for opening and closing details
		$('#'+TableId+' tbody').on('click', 'td.details-control', function () {
			var tr = $(this).parents('tr');
			var row = dT_TableVar.row( tr );
			//Retrieve Id for LoadDiv Div identification
			var dT_Id=$(this).attr('id');
			//Retrieve Criteria for LoadDiv Div identification (based on dummy crit class)
			var dT_Crit=$(this).attr('crit');
			if ( row.child.isShown() ) {
				// This row is already open - close it
				row.child.hide();
				$("#"+dT_Id).css("backgroundImage", "url('/Default2/CPN/img/SPE05Open.png')");
				return false; // Avoid Side-Effect when multipe Drill-Down
				}
				else {
					// Open this row
					row.child( format(row.data(),dT_Id) ).show();
					var TargetDiv = 'dT_TD_'+dT_Id;
					var TargetLoad = dT_URL_LD+dT_Crit+'&pLANG='+DD2Lang+'&pMODE=Drill-Down2&XXX='+Math.floor(Math.random()*1001);
					// Chargement du rapport via LoadDiv
					loadDiv(TargetDiv,TargetLoad); //Appel du KPI
					// Added Notification to Help Users in Local Node and MR Node Administrators
					MRNNotif('1','Drill-Down2 Called','Load : <a href="'+TargetLoad+'" target="_blank">'+TargetLoad+' </a> in '+TargetDiv,10,'ALL')
					$("#"+dT_Id).css("backgroundImage", "url('/Default2/CPN/img/SPE05Close.png')");
					return false; // Avoid Side-Effect when multipe Drill-Down
				}
			}
		);
	}
/* Function Timer for MagnificPopUp */
	function TimerPopUp(Tsec,Turl,TTimerId) {
		var ringer = {
		  countdown_to: new Date().getTime()+1000*Tsec,
		  rings: {
		    'SECONDS': {
		      s: 1000,
		      max: 60
		    },
		    'MICROSEC': {
		      s: 10,
		      max: 100
		    }
		   },
		  r_count: 2,
		  r_spacing: 10, // px
		  r_size: 100, // px
		  r_thickness: 2, // px
		  update_interval: 11, // ms
		    
		    
		  init: function(){
		   
		    $r = ringer;
		    $r.cvs = document.createElement('canvas'); 
		    
		    $r.size = { 
		      w: ($r.r_size + $r.r_thickness) * $r.r_count + ($r.r_spacing*($r.r_count-1)), 
		      h: ($r.r_size + $r.r_thickness) 
		    };
		    $r.cvs.setAttribute('width',$r.size.w);           
		    $r.cvs.setAttribute('height',$r.size.h);
		    $r.ctx = $r.cvs.getContext('2d');
		    //$("#mTimer").append($r.cvs);
		    $("#mTimer").append($r.cvs);
		    $r.cvs = $($r.cvs);    
		    $r.ctx.textAlign = 'center';
		    $r.actual_size = $r.r_size + $r.r_thickness;
		    $r.countdown_to_time = new Date($r.countdown_to).getTime();
		    $r.cvs.css({ width: $r.size.w+"px", height: $r.size.h+"px" });
		    $r.go();
		  },
		  ctx: null,
		  go: function(){
		    var idx=0;
		    
		    $r.time = (new Date().getTime()) - $r.countdown_to_time;
		    if(((new Date().getTime()) - $r.countdown_to_time)<0) {
		    	for(var r_key in $r.rings) $r.unit(idx++,r_key,$r.rings[r_key]);      
		        setTimeout($r.go,$r.update_interval);
		    	} else {
		    	// Will Fire when Timing is positive
		    	window.location=Turl	
		    	}
		    
		  },
		  unit: function(idx,label,ring) {
		    var x,y, value, ring_secs = ring.s;
		    value = parseFloat($r.time/ring_secs);
		    $r.time-=Math.round(parseInt(value)) * ring_secs;
		    value = Math.abs(value);
		    x = ($r.r_size*.5 + $r.r_thickness*.5);
		    x +=+(idx*($r.r_size+$r.r_spacing+$r.r_thickness));
		    y = $r.r_size*.5;
		    y += $r.r_thickness*.5;
		    
		    // calculate arc end angle
		    var degrees = 360-(value / ring.max) * 360.0;
		    var endAngle = degrees * (Math.PI / 180);
		    
		    $r.ctx.save();

		    $r.ctx.translate(x,y);
		    $r.ctx.clearRect($r.actual_size*-0.5,$r.actual_size*-0.5,$r.actual_size,$r.actual_size);

		    // first circle
		    $r.ctx.strokeStyle = "rgba(128,128,128,0.2)";
		    $r.ctx.beginPath();
		    $r.ctx.arc(0,0,$r.r_size/2,0,2 * Math.PI, 2);
		    $r.ctx.lineWidth =$r.r_thickness;
		    $r.ctx.stroke();
		   
		    // second circle
		    $r.ctx.strokeStyle = "rgba(253, 128, 1, 0.9)";
		    $r.ctx.beginPath();
		    $r.ctx.arc(0,0,$r.r_size/2,0,endAngle, 1);
		    $r.ctx.lineWidth =$r.r_thickness;
		    $r.ctx.stroke();
		    
		    // label
		    $r.ctx.fillStyle = "#456465";
		   
		    $r.ctx.font = '12px Helvetica';
		    $r.ctx.fillText(label, 0, 23);
		    $r.ctx.fillText(label, 0, 23);   
		    
		    $r.ctx.font = 'bold 40px Helvetica';
		    $r.ctx.fillText(Math.floor(value), 0, 10);
		    
		    $r.ctx.restore();
		  }
		}

		ringer.init();
	}
/* Formatting function for row details in dataTable - TdId is unique identifier for LoadDiv */
	function dt_Table_DD(TableId,dT_TableVar) {
		// Add event listener for opening and closing details
		$('#'+TableId+' tbody').on('click', 'td.dd-control', function () {
			//var Va1=$(this).next().html();
			var Va1=$(this).next().html();
			var tr = $(this).parents('tr');
			var row = dT_TableVar.row( tr );
			//Retrieve Id for LoadDiv Div identification
			var dT_Id=$(this).attr('id');
			//Retrieve Criteria for LoadDiv Div identification (based on dummy crit class)
			var dT_Crit=$(this).attr('crit');
			if ( row.child.isShown() ) {
				// This row is already open - close it
				row.child.hide();
				//Not Work With Generic Approach ... Why ?
				//tr.removeClass('shown');
				}
				else {
					// Open this row
					row.child( formatDD(row.data(),Va1) ).show();				
				}
			}
		);
	}
/* Load Structure KPI for MR Node Dashboard */
	function LoadStrucKPI(RowId,KeyValue,KPINbr) {
	// Exemple LoadStrucKPI(this,'02DI','0001');
	var DivId = "div#DIVSD_" + KeyValue;
	//alert(DivId);
	if ($(DivId).length > 0 && $(DivId + ":visible").length > 0) {
		$(DivId).hide();
	} else {
		if ($(DivId).length > 0) {
			LoadXplorerStruc(KeyValue,KPINbr);
			$(DivId).show();
		} else {
			$(RowId).closest("tr").after("<tr><td colspan='20' style='padding: 0px 0px;'><div id='DIVSD_" + KeyValue + "'>DIVSD_" + KeyValue + "</div></td></tr>");
			LoadXplorerStruc(KeyValue,KPINbr);
			}
		}
	};
/* Tim Pics Check (Used I0 v1.0) */
	function TIMPicsCheck() {
		var nodes = document.getElementsByTagName("input");
		for(i=0; i < nodes.length; ++i){
			var inputValue=nodes[i].getAttribute('value');
			if(inputValue.indexOf('http://tim.mil.intra') != -1){
				displayTIM(i,inputValue);
			}
		};
	}
/* Display Tim Pics (Used I0 v1.0) */
	function displayTIM(nodeNbr,imageURL){
		var nodeCol = document.getElementsByTagName("input");
		var foundIMG = document.createElement('img');
		foundIMG.src = '/Default/img/Box_Green16.png';
		var notfoundIMG = document.createElement('img');
		notfoundIMG.src = '/Default/img/Box_Red16.png';
		notfoundIMG.title = 'No TIM image!';
		var codeIMG = new Image();
		codeIMG.onload = function(){
			nodeCol[nodeNbr].parentNode.appendChild(foundIMG);
			foundIMG.onmouseover = function(){
				overlib('<div><img src="'+imageURL+'" border="0"/></div>',FULLHTML);
			}
			foundIMG.onmouseout = function(){
				return nd();
			}
		}
		codeIMG.onerror = function(){
			nodeCol[nodeNbr].parentNode.appendChild(notfoundIMG);
		}
		codeIMG.src = imageURL;
	}

	function MRN_ComboBox (LOV,DefaultValue) {
		for (var i=0; i<LOV.length/2; i++) {
		var CBValue = LOV[2*i];
		if (CBValue == DefaultValue) {
			document.write("<option value='" + LOV[2*i] + "' selected>" + LOV[2*i+1] + "</option>");
		} else {
			document.write("<option value='" + LOV[2*i] + "'>" + LOV[2*i+1] + "</option>");
			}										
		}
	};
/* Return parameters from a LRF Report (URL) */ 
	function get_param(return_this)
	{
		return_this = return_this.replace(/\?/ig, "").replace(/=/ig, ""); // Globally replace illegal chars.

		var url = window.location.href;                                   // Get the URL.
		var parameters = url.substring(url.indexOf("?") + 1).split("&");  // Split by "param=value".
		var params = [];                                                  // Array to store individual values.

		for(var i = 0; i < parameters.length; i++)
			if(parameters[i].search(return_this + "=") != -1)
				return parameters[i].substring(parameters[i].indexOf("=") + 1).split("+");

		return "Nihil";
	}
/* MR Node Tabs Generation (Max 3 per Page incl LoadDiv) */
	function MRNTabs(tabid) {
		if ( ! $.fn.dataTable ) {
			return;
		}
		var dt110 = $.fn.dataTable.Api ? true : false;

		// Work around for WebKit bug 55740
		var info = $('#'+tabid+' div.info');

		if ( info.height() < 115 ) {
			info.css( 'min-height', '8em' );
		}

		var escapeHtml = function ( str ) {
			return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
		};

		// css
		var cssContainer = $('#'+tabid+' div.tabs div.css');
		if ( $.trim( cssContainer.find('code').text() ) === '' ) {
			cssContainer.find('code, p:eq(0), div').css('display', 'none');
		}

		// init html
		var table = $('<p/>').append( $('table').clone() ).html();
		$('#'+tabid+' div.tabs div.table').append(
			'<code class="multiline brush: html;">\t\t\t'+
				escapeHtml( table )+
			'</code>'
		);
		//SyntaxHighlighter.highlight({}, $('#display-init-html')[0]);

		// Allow the demo code to run if DT 1.9 is used
		if ( dt110 ) {
			// json
			var ajaxTab = $('ul.tabs li').eq(3).css('display', 'none');

			$(document).on( 'init.dt', function ( e, settings ) {
				var api = new $.fn.dataTable.Api( settings );

				var show = function ( str ) {
					ajaxTab.css( 'display', 'block' );
					$('div.tabs div.ajax code').remove();

					// Old IE :-|
					try {
						str = JSON.stringify( str, null, 2 );
					} catch ( e ) {}

					$('div.tabs div.ajax').append(
						'<code class="multiline brush: js;">'+str+'</code>'
					);
					SyntaxHighlighter.highlight( {}, $('div.tabs div.ajax code')[0] );
				};

				// First draw
				var json = api.ajax.json();
				if ( json ) {
					show( json );
				}

				// Subsequent draws
				api.on( 'xhr.dt', function ( e, settings, json ) {
					show( json );
				} );
			} );

			// php
			var phpTab = $('ul.tabs li').eq(4).css('display', 'none');

			$(document).on( 'init.dt.demoSSP', function ( e, settings ) {
				if ( settings.oFeatures.bServerSide ) {
					if ( $.isFunction( settings.ajax ) ) {
						return;
					}
					$.ajax( {
						url: '../resources/examples.php',
						data: {
							src: settings.sAjaxSource || settings.ajax.url || settings.ajax
						},
						dataType: 'text',
						type: 'post',
						success: function ( txt ) {
							phpTab.css( 'display', 'block' );
							$('div.tabs div.php').append(
								'<code class="multiline brush: php;">'+txt+'</code>'
							);
							SyntaxHighlighter.highlight( {}, $('div.tabs div.php code')[0] );
						}
					} );
				}
			} );
		}
		else {
			$('#'+tabid+' ul.tabs li').eq(3).css('display', 'none');
			$('#'+tabid+' ul.tabs li').eq(4).css('display', 'none');
			$('#'+tabid+' ul.tabs li').eq(5).css('display', 'none');
		}

		// Tabs
		$('#'+tabid+' ul.tabs').on( 'click', 'li', function () {
			$('#'+tabid+' ul.tabs li.active').removeClass('active');
			$(this).addClass('active');

			$('#'+tabid+' div.tabs>div')
				.css('display', 'none')
				.eq( $(this).index() ).css('display', 'block');
		} );
		$('#'+tabid+' ul.tabs li.active').click();
	} ;
	
/* Function to convert DataTable background into a HeatMap */
/* Parameters rgb red value, rgb green value, rgb blue value, table id */
	function heatMap(yr,yg,yb,hmTable){
		// Function to get the Max value in Array
	    Array.max = function( array ){
	        return Math.max.apply( Math, array );
	    };
	    // get all values
	    var counts= $(hmTable+' tbody tr td').not('.MRNC11, .MRNC12').map(function() {
	        return parseFloat($(this).attr('data-order'));
	    }).get();
		// return max value
		var max = Array.max(counts);
		xr = 255;
	    xg = 255;
	    xb = 255;
	    n = 100;
		// add classes to cells based on nearest 10 value
		$(hmTable+' tbody tr td').not('.MRNC11, .MRNC12').each(function(){
			var val = parseFloat($(this).attr('data-order'));
			var pos = parseFloat((Math.round((val/max)*100)).toFixed(0));
			red = parseInt((xr + (( pos * (yr - xr)) / (n-1))).toFixed(0));
			green = parseInt((xg + (( pos * (yg - xg)) / (n-1))).toFixed(0));
			blue = parseInt((xb + (( pos * (yb - xb)) / (n-1))).toFixed(0));
			clr = 'rgb('+red+','+green+','+blue+')';
			$(this).css({backgroundColor:clr});
		});
	}

/* Depreacated Functions 
--------------------*/

/* DEPREACATED v1.5 - Debug Mode */
	function Debug_mode() {
	var DBGParam = get_param('pDEBUG');
	var DBGMode = 'No';
	if (DBGParam == 'Yes') {
			DBGMode = 'Yes';
		} else {
			DBGMode = 'No';
			}										
	};
/* DEPREACATED v1.5 - Link 2 ILIAS */
	function Link2ILIAS(Arg1,What,Screen) {
		var ILink="https://cissrvwprdils30.idcn.mil.intra/forms/frmservlet"
		var IArgFr="?config=ilias_fr&amp;fun="+Screen+"&amp;ARG1="+Arg1
		var IArgNl="?config=ilias_nl&amp;fun="+Screen+"&amp;ARG1="+Arg1
		document.write("<a target='ILIAS' href='"+ILink+IArgFr+"'><img src='/Default/img/IOLP_FR.png' border='0px' alt='See this "+What+" in ILIAS (Fr) Screen "+Screen+"' width='15px' style='vertical-align:Top'/></a>");
		document.write("<a target='ILIAS' href='"+ILink+IArgNl+"'><img src='/Default/img/IOLP_NL.png' border='0px' alt='See this "+What+" in ILIAS (Nl) Screen "+Screen+"' width='15px' style='vertical-align:Top'/></a>");												
	};
/* DEPREACATED v1.5 - MR Node Hide Columns */
	function MRHideColumns () {
		$('input:checkbox').change(function(){
		    var ColToHide = $(this).attr("name");    
			var myPar = $($(this).parents("table")).parents("table").attr('id');; 
			if(this.checked){
				$("#" + myPar + " td[class*='" + ColToHide + "']").show();        
			}else{
				$("#" + myPar + " td[class*='" + ColToHide + "']").hide();
			};
			if(this.checked){
				$("#" + myPar + " th[class*='" + ColToHide + "']").show();        
			}else{
				$("#" + myPar + " th[class*='" + ColToHide + "']").hide();
			};
	});
	}

