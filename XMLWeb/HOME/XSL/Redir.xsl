<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>		
<xsl:template match='/'>	
<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
	<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<head>	
		<xsl:call-template name="Node_Std_Head">
			<xsl:with-param name="Node_Conf" select="'MRN_Prod'"/>
		</xsl:call-template>
		<title>
			<xsl:value-of select="$vNodeName"/> Home Page
		</title>
	</head>
	<body>
		<xsl:call-template name="Checks"/>
		<!-- Check if Settings defined if no go to Settings -->
		<script>
			if(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings')===null) {
				//alert('Settings NOT found');
				SettingsInitialize('<xsl:value-of select="$vNodeConfig"/>');
				$.magnificPopup.open({
				 	items: {
			    	  src: '<div class="white-popup"><center><img src="/Default2/CPN/img/logo/{$vNodeConfig}/TextLogo.png"/><h3><u>Welcome on New <xsl:value-of select="$vNodeName"/> Homepage</u></h3></center><br/>A Std Settings Profile with basic settings has been created for you.<br/>A new Window called (Settings @ Node) will be opened where you can adapt your Settings (choose the correct language, Favorites, etc).<br/>Don t forget to <u>save</u> your settings to see modifications in Node Homepage.<center><br/><xsl:value-of select="$vWebMaster"/></center></div>',
			      	  type: 'inline'
					  },
					  closeBtnInside: true,
					  closeOnContentClick : false,
					  closeOnBgClick : false,
					  modal : false,
					  callbacks: {
					    close: function() {
						    // Will fire when popup is closed
						    window.open("/LRF/XMLWeb/ProcessDescriptor/descriptor/HOME/Settings.xml","_blank");
					    	}
				    	},
				});
			} else {
				// Retrieve Settings
				//alert('Settings found');
				//alert(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));
				var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));
				//alert('User is <xsl:value-of select="distinct-values(upper-case(//dbquery[1]/descriptor/parameters/param[@name='pCDN']/@value))"/>'); 
				NodeSetArr.user='<xsl:value-of select="distinct-values(upper-case(//dbquery[1]/descriptor/parameters/param[@name='pCDN']/@value))"/>';
				localStorage.setItem('<xsl:value-of select="$vNodeConfig"/>_Settings',JSON.stringify(NodeSetArr));
				//if (NodeSetArr.user=='') {alert('UNK');} else {alert(NodeSetArr.user);};
						
				};
		</script>			
		<!-- Variables -->
		<xsl:variable name="vNode_URL" select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_node_url"/>
		<xsl:variable name="vReport_URL" select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_url"/>
			<div class="container">
				<center>
					<img src="/{$vHtDocsConfig}/CPN/img/logo/{$vNodeConfig}/Logo.png"/>
					<br/>
					<h1><xsl:value-of select="$vNodeName"/><small><br/>Redirection Page</small></h1>
					<br/>
					<img src="/{$vHtDocsConfig}/CPN/img/HorWait.gif"></img>
					
					<!-- Report Not found -->
					<xsl:if test="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_id=''">
						<h2>
							<img width="25px" src='/{$vHtDocsConfig}/CPN/img/Flat/close-2-icon.png'/> Report Not found<br/>
							<small>You are redirected on <xsl:value-of select="$vNodeName"/> Home Page</small>
							<script>
								setTimeout(function(){ window.location="/"; }, 2000);
							</script>
						</h2>
					</xsl:if>
				
				</center>
					<!-- Report found -->
					<xsl:if test="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_id!=''">
						<div class="row">	
							<div class="col-md-3 col-md-offset-4">
								<h3><img width="23px" src='/{$vHtDocsConfig}/CPN/img/Flat/check-1-icon.png'/> Report found</h3>
							</div>
							<div class="col-md-3">
								<h3>
									<small><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_name"/></small>
								</h3>
							</div>
						</div>
					
										
						<!-- Check if Report Secured and user not identified. If Yes go to Redir Autheticated.-->
						<xsl:if test="//dbquery[@id='Report_Info']/rows/row[1]/@dbn_rep_secure = 'Secure' and substring($vUSER,1,5)='$AUTH'">
							<div class="row">	
								<div class="col-md-3 col-md-offset-4">
									<h3><img width="23px" src='/{$vHtDocsConfig}/CPN/img/Flat/check-1-icon.png'/> Report Secured</h3>
								</div>
								<div class="col-md-3">
									<h3>
										<small>You must be identified to used this report.</small>
									</h3>
								</div>
							</div>
							<script>
								alert('Go to redir Autenticated ... To be done');
								//alert("This Report is secured and you have to be identified to vizualize it. Please be sure that you are identified at CDN Level.");
								//window.location="/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_REDIR/REDIR.xml?pRID=161";
							</script>
						</xsl:if>
						
						<!-- Check if Report Secured and user is identified. -->
						<xsl:if test="//dbquery[@id='Report_Info']/rows/row[1]/@dbn_rep_secure = 'Secure' and substring($vUSER,1,5)!='$AUTH'">
							<div class="row">	
								<div class="col-md-3 col-md-offset-4">
									<h3><img width="23px" src='/{$vHtDocsConfig}/CPN/img/Flat/check-1-icon.png'/> Report Secured</h3>
								</div>
								<div class="col-md-3">
									<h3>
										<small>Called by <xsl:value-of select='$vUSER'/></small>
									</h3>
								</div>
							</div>
							<script>
								alert('Confirm that you want to view this report.');
								var r=confirm("<xsl:value-of select='$vUSER'/>"+"... The Report you call is Secured. A confirmation is requested for accessing this Report. This access will be be recorder in the MR Node Secure Report Accessed Table.");
								 if (r==true)
								   {
								   x="You pressed OK!";
								   }
								 else
								   {
								   x="You pressed Cancel!";
								   alert('You have canceled your Request. You are redirected to MR Node Report List');
								   window.location="/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN/MRN_REPORT/MRN_REP_LIST.xml";
								   } 
							</script>
						</xsl:if>
						
						<!-- Checking Parameters -->
						<div class="row">	
							<div class="col-md-3 col-md-offset-4">
								<h3><img width="23px" src='/{$vHtDocsConfig}/CPN/img/Flat/check-1-icon.png'/> Checking Parameters</h3>
							</div>
								<script>
									function countString(str, search){
									    var count=1;
									    var index=str.indexOf(search);
									    while(index!=-1){
									        count++;
									        index=str.indexOf(search,index+1);
									    }
										<!-- Check if pLANG and pRID in URL. If Yes -1 -->
									    if(str.indexOf('pLANG=')!==-1) {count=count-1};
									    if(str.indexOf('pRID=')!==-1) {count=count-1};
									    return count;
									};

									var url = window.location.href;
									var URLParam = url.substring(url.indexOf("?") + 1);  // Split by "param=value".
									var MultParam = url.indexOf("&amp;");  // Split by "param=value".
									<!-- If KPI Dashboard - Special treatment
									// MR Node (KPI) - Special Treatment
									if(url.indexOf("IL_MR_KPI_DASHBOARD")>0) {
										alert('KPI ... Special Treatment. To be Done');
										ParamInURL=ParamInURL-1
										};
									-->
									<!-- Count Real Parameters -->
									RealParamInURL=countString(URLParam,'&amp;');
									ReportURL="<xsl:value-of select='$vNode_URL'/><xsl:value-of select='$vReport_URL'/>";
									if(RealParamInURL>0) {
										<!-- Real Params so use it -->
										document.write('<div class="col-md-3"><h3><small>'+RealParamInURL+' Parameters found. Go...</small></h3></div>');
										window.location=ReportURL+'?'+URLParam;
									} else {
										<!-- No Real Params so check if local storage -->
										PARAM = $.parseJSON(localStorage.getItem('CPN'+"<xsl:value-of select='$vRID'/>"));
										if (PARAM) {
											<!-- Local Storage Present -->
											document.write('<div class="col-md-3"><h3><small>Default Values found</small></h3></div>');
											document.write('<center><div class="col-md-12"><table>');
											addurl='?pLANG=<xsl:value-of select='$vLANG'/>&amp;pRID='+"<xsl:value-of select='$vRID'/>";
											<xsl:for-each select="//dbquery[@id='Report_Prompt']/rows/row">
												DParam = "<xsl:value-of select='@dbn_repp_param'/>"; 
												//check if parameter is filled
												if (eval("PARAM.p_"+DParam)){
													//Retrieve value of parameter for filling Input Box
													WSParam = "PARAM.p_"+DParam;
													WSParamValFull = eval(WSParam); 
													WSParamValPart = WSParamValFull.split('=');
													addurl=addurl+'&amp;'+WSParamValFull
													document.write("<tr>");
													document.write('<td align="left"><h5>Parameter <em>'+DParam+'</em> :</h5></td>');
													document.write('<td align="center"><h4><small><b>'+WSParamValPart[WSParamValPart.length-1]+'</b></small></h4></td></tr>');
												};
											</xsl:for-each>
											document.write('</table></div>');
											document.write('<div class="col-md-12"><h4>Parameters<br/><small>'+addurl+'</small></h4></div>');
											document.write('<div class="col-md-12"><h4>Go to to report (with Personnal Parameters) located at <br/><small>'+ReportURL+addurl+'</small></h4></div></center>');
											window.location=ReportURL+addurl;
										} else {
											document.write('<div class="col-md-3"><h3><small>Default values Not found ... Go to Input Form</small></h3></div>');
											window.location='InputForm.xml?pRID=<xsl:value-of select="$vRID"/>&amp;pLANG=<xsl:value-of select="$vLANG"/>';
										};	
									}	
								</script>
						</div>
					</xsl:if>
			</div>
		</body>
	<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>

<xsl:include href='../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../COMMON/Report_Components.xsl'/>
	
</xsl:stylesheet>