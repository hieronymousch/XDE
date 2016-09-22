<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<!-- Variable Declaration End -->
	<xsl:template match='/'>	
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
			<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1"/>
			<meta name="description" content="Bootstrap Sidebar Template for CPN HomePage"/>
			<meta name="author" content="Ibanez Crescencio"/>
				<head>
					<xsl:call-template name="Node_Std_Head"/>
					<title>
						My Settings @ <xsl:value-of select="$vNodeName"/>
					</title>
				</head>
				<body>
					<xsl:call-template name="Report_NavBar"/>
					<div class="container">
						<center>
							<h1>My Settings @ <xsl:value-of select="$vNodeName"/><small> localStorage</small></h1>
						</center>
						<hr/>
						<div class="row">	
							<div class="col-md-4">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">Identification</h3> 
									</div> 
									<div class="panel-body"> 
										<p>
											<div class="row">
												<div class="col-md-2">
													<img class="profilePic" src="/{$vHtDocsConfig}/CPN/img/Flat/contact-icon.png" width="60px"/>
												</div>
												<div class="col-md-8 col-md-offset-1">
													<p>
														<b>Network Login</b> : UNKNOWN
														<br/>Local User (Authentification not provided)
													</p>
												</div>
											</div>
										</p>
									</div> 
								</div>		
							</div>
							<div class="col-md-5">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">Options</h3> 
									</div> 
									<div class="panel-body"> 
										<!-- Debugging Mode For Admin & MR-Mgt Only -->
										<div class="form-group">
											<strong>General</strong>
											<div>
												<div class="checkbox">
													<label>
														<input id="Backup" type="checkbox"/> Copy automatically Settings on Node when Save (BackUp) <b> Not Yet implemented</b>
													</label> 
												</div> 
											</div>
											
											<div>
												<strong>Parameters</strong>
												<p>
													<label class="radio-inline">
														<input type="radio" name="Prompt" id="PromptInline" value="I" class="cbr cbr-pink"/>
														Inline
													</label>
													<label class="radio-inline">
														<input type="radio" name="Prompt" id="PromptModal" value="M" class="cbr cbr-secondary"/>
														Modal
													</label>
												</p>
												
											</div>
											
											<script type="text/javascript">
												var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));			
												if (NodeSetArr.Prompt=='I') {$( "#PromptInline" ).prop( "checked", true );};
												if (NodeSetArr.Prompt=='M') {$( "#PromptModal" ).prop( "checked", true );};
												$('input:radio[name="Prompt"]').on('click', function(e) {
												 	NodeSetArr.Prompt = this.value;
													localStorage.setItem('<xsl:value-of select="$vNodeConfig"/>_Settings',JSON.stringify(NodeSetArr)); 	
												});
											</script>
										</div>
									</div> 
								</div>		
							</div>
							<div class="col-md-3">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">Language</h3> 
									</div> 
									<div class="panel-body"> 
										<p>
											<label class="radio-inline">
												<input type="radio" name="LangRad" id="LangRadEN" value="EN" class="cbr cbr-pink"/>
												English
											</label>
											<br/>
											<label class="radio-inline">
												<input type="radio" name="LangRad" id="LangRadNL" value="NL" class="cbr cbr-secondary"/>
												Nederlands
											</label>
											<br/>
											<label class="radio-inline">
												<input type="radio" name="LangRad" id="LangRadFR" value="FR" class="cbr cbr-info"/>
												Français
											</label>
										</p>
										<script type="text/javascript">
											var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));			
											if (NodeSetArr.Language=='FR') {$( "#LangRadFR" ).prop( "checked", true );};
											if (NodeSetArr.Language=='NL') {$( "#LangRadNL" ).prop( "checked", true );};
											if (NodeSetArr.Language=='EN') {$( "#LangRadEN" ).prop( "checked", true );};
											$('input:radio[name="LangRad"]').on('click', function(e) {
											 	NodeSetArr.Language = this.value;
												localStorage.setItem('<xsl:value-of select="$vNodeConfig"/>_Settings',JSON.stringify(NodeSetArr)); 	
											});
										</script>
									</div> 
								</div>		
							</div>
						</div>
						<div class="row">	
							<div class="col-md-8">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">Favorites</h3> 
									</div> 
									<div class="panel-body"> 
										<form role="form" class="form-horizontal">	
											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 01</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA0" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm input-sm" id="FavT0" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU0">
												<label class="col-sm-2 control-label" for="FavU0">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm input-sm" id="FavU0" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA0").click(function () {
													if (NodeSetArr.Favorites[0]['Active'] == 'N') {
													    $('#FavU0').show();
													    $('#FavGU0').show();
													    NodeSetArr.Favorites[0]['Active']='Y';

													} else {
													    $('#FavU0').hide();
													    $('#FavGU0').hide();
													    NodeSetArr.Favorites[0]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 02</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA1" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT1" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU1">
												<label class="col-sm-2 control-label" for="FavU1">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU1" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA1").click(function () {
													if (NodeSetArr.Favorites[1]['Active'] == 'N') {
													    $('#FavU1').show();
													    $('#FavGU1').show();
													    NodeSetArr.Favorites[1]['Active']='Y';

													} else {
													    $('#FavU1').hide();
													    $('#FavGU1').hide();
													    NodeSetArr.Favorites[1]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 03</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA2" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT2" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU2">
												<label class="col-sm-2 control-label" for="FavU2">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU2" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA2").click(function () {
													if (NodeSetArr.Favorites[2]['Active'] == 'N') {
													    $('#FavU2').show();
													    $('#FavGU2').show();
													    NodeSetArr.Favorites[2]['Active']='Y';

													} else {
													    $('#FavU2').hide();
													    $('#FavGU2').hide();
													    NodeSetArr.Favorites[2]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 04</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA3" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT3" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU3">
												<label class="col-sm-2 control-label" for="FavU3">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU3" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA3").click(function () {
													if (NodeSetArr.Favorites[3]['Active'] == 'N') {
													    $('#FavU3').show();
													    $('#FavGU3').show();
													    NodeSetArr.Favorites[3]['Active']='Y';

													} else {
													    $('#FavU3').hide();
													    $('#FavGU3').hide();
													    NodeSetArr.Favorites[3]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 05</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA4" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT4" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU4">
												<label class="col-sm-2 control-label" for="FavU4">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU4" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA4").click(function () {
													if (NodeSetArr.Favorites[4]['Active'] == 'N') {
													    $('#FavU4').show();
													    $('#FavGU4').show();
													    NodeSetArr.Favorites[4]['Active']='Y';

													} else {
													    $('#FavU4').hide();
													    $('#FavGU4').hide();
													    NodeSetArr.Favorites[4]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 06</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA5" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT5" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU5">
												<label class="col-sm-2 control-label" for="FavU5">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU5" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA5").click(function () {
													if (NodeSetArr.Favorites[5]['Active'] == 'N') {
													    $('#FavU5').show();
													    $('#FavGU5').show();
													    NodeSetArr.Favorites[5]['Active']='Y';

													} else {
													    $('#FavU5').hide();
													    $('#FavGU5').hide();
													    NodeSetArr.Favorites[5]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 07</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA6" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT6" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU6">
												<label class="col-sm-2 control-label" for="FavU6">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU6" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA6").click(function () {
													if (NodeSetArr.Favorites[6]['Active'] == 'N') {
													    $('#FavU6').show();
													    $('#FavGU6').show();
													    NodeSetArr.Favorites[6]['Active']='Y';

													} else {
													    $('#FavU6').hide();
													    $('#FavGU6').hide();
													    NodeSetArr.Favorites[6]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 08</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA7" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT7" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU7">
												<label class="col-sm-2 control-label" for="FavU7">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU7" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA7").click(function () {
													if (NodeSetArr.Favorites[7]['Active'] == 'N') {
													    $('#FavU7').show();
													    $('#FavGU7').show();
													    NodeSetArr.Favorites[7]['Active']='Y';

													} else {
													    $('#FavU7').hide();
													    $('#FavGU7').hide();
													    NodeSetArr.Favorites[7]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 09</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA8" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT8" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU8">
												<label class="col-sm-2 control-label" for="FavU8">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU8" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA8").click(function () {
													if (NodeSetArr.Favorites[8]['Active'] == 'N') {
													    $('#FavU8').show();
													    $('#FavGU8').show();
													    NodeSetArr.Favorites[8]['Active']='Y';

													} else {
													    $('#FavU8').hide();
													    $('#FavGU8').hide();
													    NodeSetArr.Favorites[8]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>

											<div class="form-group">
												<label class="col-sm-2 control-label">
													<strong>Fav 10</strong>
												</label>
												<label class="col-sm-1 control-label">
													<input type="checkbox" id="FavA9" class="Fav iswitch iswitch-turquoise"/>
												</label>
												<label class="col-sm-2 control-label">
													Title
												</label>
												<div class="col-sm-5">
													<input type="text" class="form-control input-sm" id="FavT9" placeholder="Type Here Favorite Title"/>
												</div>
											</div>

											<div class="form-group" id="FavGU9">
												<label class="col-sm-2 control-label" for="FavU9">URL</label>
												
												<div class="col-sm-10">
													<input type="text" class="form-control input-sm" id="FavU9" placeholder="Type Here URL Favorite"/>
												</div>
											</div>
											<script type="text/javascript">
												$("#FavA9").click(function () {
													if (NodeSetArr.Favorites[9]['Active'] == 'N') {
													    $('#FavU9').show();
													    $('#FavGU9').show();
													    NodeSetArr.Favorites[9]['Active']='Y';

													} else {
													    $('#FavU9').hide();
													    $('#FavGU9').hide();
													    NodeSetArr.Favorites[9]['Active']='N';
													};
												});
											</script>
											<div class="form-group-separator"></div>
											

											<script type="text/javascript">
												for (index = 0; index &lt;10; ++index) {
												    $("#FavT"+index).val(NodeSetArr.Favorites[index].nom);
												    $("#FavU"+index).val(NodeSetArr.Favorites[index].URL);
												    if(NodeSetArr.Favorites[index]['Active'] == 'Y') {$( "#FavA"+index ).prop( "checked", true );$( "#FavU"+index ).prop( "checked", true );} else {$( "#FavGU"+index ).hide();$( "#FavU"+index ).hide();};   
												};
											</script>	
										</form>
									</div> 
								</div>		
							</div>
							<div class="col-md-4">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">Actions</h3> 
									</div> 
									<div class="panel-body"> 
										<p>
											<div class="row">
												<form role="form" class="col-md-12">
													<button class="col-md-6 col-md-offset-3 btn btn-success">
														<xsl:attribute name="onclick">NodeSettingsSave('<xsl:value-of select="$vNodeConfig"/>_Settings');alert('You can Close this page and refresh the HomePage (F5).');</xsl:attribute>
														Save Settings
													</button>
												</form>
											</div>
											<br/>
											<div class="row">
												<form role="form" class="col-md-12">
													<button class="col-md-6 col-md-offset-3 btn btn-danger">
														<xsl:attribute name="onclick">SettingsInitialize('<xsl:value-of select="$vNodeConfig"/>');</xsl:attribute>
														Delete and Re-Initialize
													</button>
												</form>
											</div>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">Debug</h3> 
									</div> 
									<div class="panel-body"> 
										<p>
											<div>
												<div class="checkbox">
													<label>
														<input id="Debug" type="checkbox"/> Allows Full Debugging Mode on Node
													</label> 
												</div>
												<b>Show Pop-Up :</b>
												<div class="checkbox-inline">
													<label class="col-md-3">
														<input id="PopUpBlue" type="checkbox"/>Blue
													</label>
													<label class="col-md-3">
														<input id="PopUpGreen" type="checkbox"/>Green
													</label>
													<label class="col-md-3">
														<input id="PopUpYellow" type="checkbox"/>Yellow
													</label>
													<label class="col-md-3">
														<input id="PopUpRed" type="checkbox"/>Red
													</label> 
												</div> 
											</div>
											<xsl:call-template name="TNotif">
												<xsl:with-param name="tTitle" select="'Test 4 Red'"/> 
												<xsl:with-param name="tMsg" select="'Test Msg Type 4'"/>
		   										<xsl:with-param name="tType" select="4"/> 	
												<xsl:with-param name="tAppear" select="1000"/>	
											</xsl:call-template>
											<xsl:call-template name="TNotif">
												<xsl:with-param name="tTitle" select="'Test 3 Yellow'"/> 
												<xsl:with-param name="tMsg" select="'Test Msg Type 3'"/>
		   										<xsl:with-param name="tType" select="3"/> 	
												<xsl:with-param name="tAppear" select="1000"/>	
											</xsl:call-template>
											<xsl:call-template name="TNotif">
												<xsl:with-param name="tTitle" select="'Test 2 Green'"/> 
												<xsl:with-param name="tMsg" select="'Test Msg Type 2'"/>
		   										<xsl:with-param name="tType" select="2"/> 	
												<xsl:with-param name="tAppear" select="1000"/>	
											</xsl:call-template>
											<xsl:call-template name="TNotif">
												<xsl:with-param name="tTitle" select="'Test 1 Blue'"/> 
												<xsl:with-param name="tMsg" select="'Test Msg Type 1'"/>
		   										<xsl:with-param name="tType" select="1"/> 	
												<xsl:with-param name="tAppear" select="1000"/>	
											</xsl:call-template>
											<script type="text/javascript">
												<!-- Check Old version -->
												if (NodeSetArr.DebugMode === 'Y') {NodeSetArr.DebugMode='YYYYY'}
												if (NodeSetArr.DebugMode === 'N') {NodeSetArr.DebugMode='NYYYY'}
												<!-- Save Settings -->
												localStorage.setItem('<xsl:value-of select="$vNodeConfig"/>_Settings',JSON.stringify(NodeSetArr))
												
												<!-- Debug -->
												if (NodeSetArr.DebugMode.substring(0,1) === 'Y') {$('#Debug').prop( 'checked','checked');}
												$("#Debug").click(function () {
													if ($(this).prop('checked') === true) {
													    NodeSetArr.DebugMode='Y'+NodeSetArr.DebugMode.substring(1,5);
													} else {
													    NodeSetArr.DebugMode='N'+NodeSetArr.DebugMode.substring(1,5);     
													}
													});
												<!-- Blue Pop-Up -->
												if (NodeSetArr.DebugMode.substring(1,2) === 'Y') {$('#PopUpBlue').prop( 'checked','checked');}
												$("#PopUpBlue").click(function () {
													if ($(this).prop('checked') === true) {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,1)+'Y'+NodeSetArr.DebugMode.substring(2,5);
													} else {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,1)+'N'+NodeSetArr.DebugMode.substring(2,5);     
													}
													});
												<!-- Green Pop-Up -->
												if (NodeSetArr.DebugMode.substring(2,3) === 'Y') {$('#PopUpGreen').prop( 'checked','checked');}
												$("#PopUpGreen").click(function () {
													if ($(this).prop('checked') === true) {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,2)+'Y'+NodeSetArr.DebugMode.substring(3,5);
													} else {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,2)+'N'+NodeSetArr.DebugMode.substring(3,5);     
													}
													});
												<!-- Yellow Pop-Up -->
												if (NodeSetArr.DebugMode.substring(3,4) === 'Y') {$('#PopUpYellow').prop( 'checked','checked');}
												$("#PopUpYellow").click(function () {
													if ($(this).prop('checked') === true) {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,3)+'Y'+NodeSetArr.DebugMode.substring(4,5);
													} else {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,3)+'N'+NodeSetArr.DebugMode.substring(4,5);     
													}
													});
												<!-- Red Pop-Up -->
												if (NodeSetArr.DebugMode.substring(4,5) === 'Y') {$('#PopUpRed').prop( 'checked','checked');}
												$("#PopUpRed").click(function () {
													if ($(this).prop('checked') === true) {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,4)+'Y';
													} else {
													    NodeSetArr.DebugMode=NodeSetArr.DebugMode.substring(0,4)+'N';     
													}
													});
											</script>

										</p>	
									</div> 
								</div>		
							</div>
							<!--div class="col-md-4">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">Report Presentation</h3> 
									</div> 
									<div class="panel-body"> 
										<p>
											<label class="radio-inline">
												<input type="radio" name="Pres" id="Pres1" value="1" class="cbr cbr-pink"/>
												Presentation 1
											</label>
											<br/>
											<label class="radio-inline">
												<input type="radio" name="Pres" id="Pres2" value="2" class="cbr cbr-secondary"/>
												Presentation 2
											</label>
											<br/>
											<label class="radio-inline">
												<input type="radio" name="Pres" id="Pres3" value="3" class="cbr cbr-info"/>
												Presentation 3
											</label>
										</p>
										<script type="text/javascript">
											var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));			
											if (NodeSetArr.Menu=='1') {$( "#Pres1" ).prop( "checked", true );};
											if (NodeSetArr.Menu=='2') {$( "#Pres2" ).prop( "checked", true );};
											if (NodeSetArr.Menu=='3') {$( "#Pres3" ).prop( "checked", true );};
											$('input:radio[name="Pres"]').on('click', function(e) {
											 	NodeSetArr.Menu = this.value;
												localStorage.setItem('<xsl:value-of select="$vNodeConfig"/>_Settings',JSON.stringify(NodeSetArr)); 	
											});
										</script>								
									</div> 
								</div>		
							</div-->
							
							<div class="col-md-4">
								<div class="panel panel-info">
									<div class="panel-heading"> 
										<h3 class="panel-title">For testing Purpose</h3> 
									</div> 
									<div class="panel-body"> 
										<p>
											<!--
											<div class="row">
												<form role="form" class="col-md-12">
													<button class="col-md-10 col-md-offset-1 btn btn-info" onclick="alert('Later...');">
														Export Settings To <xsl:value-of select="$vNodeName"/>
													</button>
												</form>
											</div>
											<br/>
											<div class="row">
												<form role="form" class="col-md-12">
													<button class="col-md-10 col-md-offset-1 btn btn-warning" onclick="alert('Later...');">
														Import Settings To <xsl:value-of select="$vNodeName"/>
													</button>
													<script type="text/javascript">
														var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));	
													</script>
												</form>
											</div>
											<br/>
											<hr/>
											<br/>
											-->
											<div class="row">
												<!--center><label>For testing Purpose ... </label></center-->
												<form role="form" class="col-md-12">
													<button class="col-md-6 col-md-offset-3 btn btn-danger">
														<xsl:attribute name="onclick">localStorage.removeItem('<xsl:value-of select="$vNodeConfig"/>_Settings');delete window.localStorage['<xsl:value-of select="$vNodeConfig"/>_Settings'];</xsl:attribute>
														Delete Settings
													</button>
												</form>
											</div>
											<br/>
											<div class="row">
												<form role="form" class="col-md-12">
													<button class="col-md-6 col-md-offset-3 btn btn-info">
														<xsl:attribute name="onclick">alert('<xsl:value-of select="$vNodeConfig"/>_Settings : '+localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));</xsl:attribute>
														View Settings
													</button>
												</form>
											</div>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</body>
		<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
	</xsl:template>
	
	
	<xsl:template match="row">
		<!-- For manual tables -->
		<xsl:param name="DBWEB_Name"/>						<!-- Mandatory : DBWeb Query Name -->
		<xsl:param name="Node_Conf"/>						<!-- Mandatory default N -->
		<xsl:param name="dT_Type" select="'99'"/>			<!-- Not mandatory default N -->
		<xsl:param name="RepDic" select="'N'"/>				<!-- Not mandatory default N -->
		<xsl:param name="Lang" select="'EN'"/>				<!-- Not mandatory default EN -->
		<xsl:param name="dictionary"/> 						<!-- Mandatory if RepDic is Y -->
		<xsl:param name="Detail_Data"/>
		<xsl:choose>
			<xsl:when test="$Detail_Data='TBD'">
				<!-- Specific Content for -->
			</xsl:when>
			<xsl:otherwise>
				<!-- No Specfic Content defined -->
				No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:include href='../../COMMON/Node_Config.xsl'/>
	<xsl:include href='../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
