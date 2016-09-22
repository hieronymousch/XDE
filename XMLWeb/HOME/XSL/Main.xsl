<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- START : Use this to avoid error illegal characters html --> 
<xsl:output method="html" indent="yes" use-character-maps="no-control-characters"/>
<xsl:character-map name="no-control-characters">
   <xsl:output-character character="&#127;" string=" "/>
   <xsl:output-character character="&#128;" string=" "/>
   <xsl:output-character character="&#129;" string=" "/>
   <xsl:output-character character="&#130;" string=" "/>
   <xsl:output-character character="&#131;" string=" "/>
   <xsl:output-character character="&#132;" string=" "/>
   <xsl:output-character character="&#133;" string=" "/>
   <xsl:output-character character="&#134;" string=" "/>
   <xsl:output-character character="&#135;" string=" "/>
   <xsl:output-character character="&#136;" string=" "/>
   <xsl:output-character character="&#137;" string=" "/>
   <xsl:output-character character="&#138;" string=" "/>
   <xsl:output-character character="&#139;" string=" "/>
   <xsl:output-character character="&#140;" string=" "/>
   <xsl:output-character character="&#141;" string=" "/>
   <xsl:output-character character="&#142;" string=" "/>
   <xsl:output-character character="&#143;" string=" "/>
   <xsl:output-character character="&#144;" string=" "/>
   <xsl:output-character character="&#145;" string=" "/>
   <xsl:output-character character="&#146;" string=" "/>
   <xsl:output-character character="&#147;" string=" "/>
   <xsl:output-character character="&#148;" string=" "/>
   <xsl:output-character character="&#149;" string=" "/>
   <xsl:output-character character="&#150;" string=" "/>
   <xsl:output-character character="&#151;" string=" "/>
   <xsl:output-character character="&#152;" string=" "/>
   <xsl:output-character character="&#153;" string=" "/>
   <xsl:output-character character="&#154;" string=" "/>
   <xsl:output-character character="&#155;" string=" "/>
   <xsl:output-character character="&#156;" string=" "/>
   <xsl:output-character character="&#157;" string=" "/>
   <xsl:output-character character="&#158;" string=" "/>
   <xsl:output-character character="&#159;" string=" "/>
</xsl:character-map>
	<xsl:template match='/'>	
		<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
		<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<meta name="description" content="Bootstrap Sidebar Template for CPN HomePage"/>
		<meta name="author" content="Drijkoningen Dirk, Ibanez Crescencio"/>
			<head>
				<!-- js -->
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/jQuery-2.2.3/jquery-2.2.3.min.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/Bootstrap-3.3.6/js/bootstrap.min.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/Home/js/bootstrap-select.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/Home/js/sidebar.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/js/CPN.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/toastr/toastr.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/mpopup/jquery.magnific-popup.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/js/local.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/js/overlib.js"></script>
							
				<!-- CSS -->
					
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/extras/toastr/toastr.css"/>
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/fonts/linecons/css/linecons.css" />
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/fonts/fontawesome/css/font-awesome.min.css" />
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/extras/Bootstrap-3.3.6/css/bootstrap.min.css" />
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/extras/mpopup/magnific-popup.css" media="all"/>
					<link rel="shortcut icon" type="image/x-icon" href="/{$vHtDocsConfig}/CPN/img/logo/{$vNodeConfig}/favicon.ico" />	
					
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/Home/css/bootstrap-select.css" />
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/Home/css/sidebar.css" />
					
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/Home/css/main.css" media="all"/>
					<!-- If Node Config contains Accept so Pink Background -->
					<xsl:if test="contains($vNodeConfig,'Accept')">
						<style>
							body {
								background-color:#F6CEF5;
							}
						</style>
					</xsl:if>
						
				<title>
					<xsl:value-of select="$vNodeName"/> Home Page
				</title>
			</head>
			<body>
				<xsl:call-template name="CPN_About"/>
				<!-- Modal if No Setting Arry for Node -->
				<div id="Welcome" class="modal fade" role="dialog">
			        <div class="modal-dialog modal-lg">
			            <!-- Modal content-->
			            <div class="modal-content">
							<div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal">X</button>
			                    <h4 class="modal-title">
			                    	<center>
										<img src="/Default2/CPN/img/logo/{$vNodeConfig}/TextLogo.png" width="200px"/>
										<u>Welcome on New <xsl:value-of select="$vNodeName"/> Homepage</u>
									</center>
								</h4>
			                </div>
							<p class="navbar-text">
								A Standard Settings Profile with basic settings has been created for you.<br/>A new Window called (Settings @ Node) will be opened where you can adapt your Settings (choose the correct language, Favorites, etc).<br/>Don t forget to <u>save</u> your settings to see modifications in Node Homepage.
								<center>
									<br/><xsl:value-of select="$vWebMaster"/>
								</center>
							</p>
			            </div>
			        </div>
			    </div>
				
				<!-- Check if Settings defined if no go to Settings -->
				<script>
					if(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings')==null) {
						// initialized with defaults 
						$('#Welcome').modal();
						//$(function () { $('#Welcome').modal('hide')})});
						$(function () { $('#Welcome').on('hide.bs.modal', 
							function () { 
								SettingsInitialize('<xsl:value-of select="$vNodeConfig"/>');
								window.open("/LRF/XMLWeb/ProcessDescriptor/descriptor/HOME/Settings.xml","_blank");
								}) 
							});

					} else {
						SetUAAN('<xsl:value-of select="$vNodeConfig"/>','<xsl:value-of select="upper-case(//dbquery[@id='MRN_USER']/rows/row/@sAMAccountName)"/>','<xsl:value-of select="upper-case(//dbquery[@id='MRN_USER']/rows/row/@employeeID)"/>','<xsl:value-of select="$vLANG"/>','<xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@displayName"/>');
						var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));
						};
				</script>
				<div id="wrapper">
					<!-- Sidebar -->
					<div id="sidebar-wrapper">
						<div class="brand">
							<img src="/{$vHtDocsConfig}/CPN/img/logo/{$vNodeConfig}/Logo.png"/>
							<span><xsl:value-of select='$vNodeName'/></span>
						</div>
						<ul class="sidebar-nav">
							<li>
								<a href="Settings.xml?pRID=10103&amp;pLANG={$vLANG}" title="Settings"><div class="fa fa-cog"></div>Settings</a>
							</li>
							<li class="submenu"><!-- class REQUIRED when creating a submenu-->
								<a href="#"><div class="fa fa-database"></div>Common Pillar Nodes<div class="glyphicon glyphicon-menu-right pull-right"></div></a>
								<ul class="sub-level"><!-- class REQUIRED when creating a submenu-->
									<li>
										<a href="http://mrnode.mil.intra"><img src="/{$vHtDocsConfig}/CPN/img/logo/MRN_Prod/Logo.png" width="34px"/> MR Node</a>
									</li>
									<li>
										<a href="http://qrnode.mil.intra/ILIAS/Reports/"><img src="/{$vHtDocsConfig}/CPN/img/logo/QRNI_Prod/Logo.png" width="25px"/> QR Node ILIAS</a>
									</li>
									<li>
										<a href="http://opsnode.mil.intra"><img src="/{$vHtDocsConfig}/CPN/img/logo/OPSN_Prod/Logo.png" width="25px"/> Ops Node</a>
									</li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#"><div class="linecons-star"></div>Favorites<div class="glyphicon glyphicon-menu-right pull-right"></div></a>
								<ul class="sub-level">
									<li>
										<a href="#" id="Fav0"></a>
									</li>
									<li>
										<a href="#" id="Fav1"></a>
									</li>
									<li>
										<a href="#" id="Fav2"></a>
									</li>
									<li>
										<a href="#" id="Fav3"></a>
									</li>
									<li>
										<a href="#" id="Fav4"></a>
									</li>
									<li>
										<a href="#" id="Fav5"></a>
									</li>
									<li>
										<a href="#" id="Fav6"></a>
									</li>
									<li>
										<a href="#" id="Fav7"></a>
									</li>
									<li>
										<a href="#" id="Fav8"></a>
									</li>
									<li>
										<a href="#" id="Fav9"></a>
									</li>
									<script>
										 for (var i = 0; i &lt; 10; i++) {
											$('#Fav'+i).prop('href',NodeSetArr.Favorites[i].URL);
										 	$('#Fav'+i).text(NodeSetArr.Favorites[i].nom);
											if (NodeSetArr.Favorites[i]['Active'] !== 'Y') {
												$('#Fav'+i).hide();
											};
										}
									</script>
								</ul>
							</li>
							<li>
								<a href="#" data-toggle="modal" title="Information" data-target="#CPN_About" role="button"><div class="glyphicon glyphicon-info-sign"></div>Information</a>
							</li>
							<!--
							<li class="submenu">
								<a href="#"><div class="fa fa-envelope"></div>Contact POC<div class="glyphicon glyphicon-menu-right pull-right"></div></a>
								<ul class="sub-level">
									<li>
										<a href="#">MR Node</a>
									</li>
									<li>
										<a href="#">QR Node ILIAS</a>
									</li>
									<li>
										<a href="#">Ops Node</a>
									</li>
								</ul>
							</li>
							-->
						</ul>
					</div><!-- END SIDEBAR WRAPPER -->
					<!-- Page Content -->
					<div class="user-info-panel" style="line-height:50px">
						<!--nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"-->
							<div>
								<div class="row">
									<div class="col-md-8 collapse navbar-inverse navbar-collapse" style="text-align:center;">
										<ul class="nav navbar-nav navbar-inverse navbar-left">	
											<li>
						                        <span class="fa fa-bars" id="menu-toggle" title="Show / Hide full menu."></span>
						                    </li>
											<li class="active">
						                        <a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
						                    </li>
						                    <li>
						                        <script>
						                            document.write('<a href="http://mrnode.mil.intra/LRF/XMLWeb/ProcessDescriptor/descriptor/HOME/Redir.xml?pLANG={$vLANG}&amp;pRID=2000" target="_blank">CPN FW Status</a>')
						                        </script>  
						                    </li>
						                    <li>
						                        <script type="text/javascript">
						                            document.write('<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/CPN/CPN_STATUS/CPN_STATUS.xml?pRID=10102&amp;pLANG='+ NodeSetArr.Language +'" target="_blank">Status</a>')
						                        </script>
						                    </li>
						                    <li>
						                        <script type="text/javascript">
						                            document.write('<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/CPN/CPN_REPORT/CPN_REP_LIST.xml?pRID=10101&amp;pLANG='+ NodeSetArr.Language +'" target="_blank">Reports</a>')
						                        </script>
						                    </li>
						                    <li class="dropdown">
						                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Community <span class="caret"></span></a>
						                        <ul class="dropdown-menu">
						                        	<li><a href="http://icp.idcn.mil.intra/iforum/index.php?board=46.0" target="Forum">Forum DB Node</a></li>
						                            <li><a href="http://icp.idcn.mil.intra/iforum/index.php?board=58.0" target="Forum">Forum CPN FW</a></li>
						                            <li role="separator" class="divider"></li>
						                            <li>
						                            	<xsl:choose>
						                            		<xsl:when test="$vLANG='FR' or $vLANG='NL'">
						                            			<script type="text/javascript">
										                            document.write('<a href="http://icp.idcn.mil.intra/bedef'+ NodeSetArr.Language.toLowerCase() +'/index.php?title=CPC" target="_blank">CPN Community</a>')
										                        </script>
						                            		</xsl:when>
						                            		<xsl:otherwise>
						                            			<a href="#" target="_blank"><font color="red">Doc only in F or N (Change language)</font></a>
						                            		</xsl:otherwise>
						                            	</xsl:choose>
						                            </li>
						                            <li role="separator" class="divider"></li>
						                            <li>
						                            	<xsl:choose>
						                            		<xsl:when test="$vLANG='FR' or $vLANG='NL'">
						                            			<script type="text/javascript">
										                            document.write('<a href="http://icp.idcn.mil.intra/bedef'+ NodeSetArr.Language.toLowerCase() +'/index.php?title=CPN" target="_blank">Doc on Wiki</a>')
										                        </script>
						                            		</xsl:when>
						                            		<xsl:otherwise>
						                            			<a href="#" target="_blank"><font color="red">Doc only in F or N (Change language)</font></a>
						                            		</xsl:otherwise>
						                            	</xsl:choose>
						                            </li>
					                            </ul>
						                    </li>
						                    <li class="dropdown">
						                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Contact <span class="caret"></span></a>
						                        <ul class="dropdown-menu">
						                            <li>
						                                <div class="navbar-contact">
						                                    <h3>MR Node</h3>
						                                    <div>
						                                        <img alt="Cdt IBANEZ C." src="http://hrnode.mil.intra/FotoProggie/output_foto150/9180231.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">Cdt Ibanez C.</p>
						                                        <p>ILIAS Support - MR-Mgt</p>
						                                        <p>Tel : 9-2400-1469</p>
						                                        <p>Fax : 9-2400-6702</p>
						                                        <p>E-Mail : <a href="mailto:crescencio.ibanez@mil.be">crescencio.ibanez@mil.be</a></p>
						                                    </div>
						                                    <div>
						                                        <img alt="Adjt DUBUS R." src="http://hrnode.mil.intra/FotoProggie/output_foto150/R73827.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">Adjt Dubus R.</p>
						                                        <p>ILIAS Support - MR-Mgt</p>
						                                        <p>Tel : 9-2400-1469</p>
						                                        <p>Fax : 9-2400-6702</p>
						                                        <p>E-Mail : <a href="mailto:renzo.dubus@mil.be">renzo.dubus@mil.be</a></p>
						                                    </div>
						                                    <div>
						                                        <p>
						                                        	<a href="http://mrnode.mil.intra/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_EVAL/MRN_EVAL.xml?pRID=1064&amp;pVRID=2000&amp;pLANG={$vLANG}0" target="_blank">
						                                        		<p style="font-weight:bold;color:#ff0;">Feedback To MR Node Administrators</p>
						                                        	</a>
						                                        </p>
						                                    </div>
						                                    <hr/>
						                                    <h3>Ops Node</h3>
						                                    <div>
						                                        <img alt="kapt Van Geldorp J. (VGJ)" src="http://hrnode.mil.intra/FotoProggie/output_foto150/0201013.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">kapt Van Geldorp J. (VGJ)</p>
						                                        <p>ComOpsLand G4</p>
						                                        <p>Tel : 9-2400-6432</p>
						                                        <p>E-Mail : <a href="mailto:Jochen.VanGeldorp@mil.be">Jochen.VanGeldorp@mil.be</a></p>
						                                    </div>
						                                    <div>
						                                        <img alt="1SM Nathanael N. (NN)" src="http://hrnode.mil.intra/FotoProggie/output_foto150/9903661.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">1SM Nathanael N. (NN)</p>
						                                        <p>ComOpsLand G4</p>
						                                        <p>Tel : 9-2400-4100</p>
						                                        <p>E-Mail : <a href="mailto:Nathanael.Nourry@mil.be">Nathanael.Nourry@mil.be</a></p>
						                                    </div>
						                                    <hr/>
						                                    <h3>QR Node ILIAS</h3>
						                                    <div>
						                                        <img alt="Adc Drijkoningen P. (DP)" src="http://hrnode.mil.intra/FotoProggie/output_foto150/A46671.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">Adc Drijkoningen P. (DP)</p>
						                                        <p>10 W Tac - Smd E&amp;T</p>
						                                        <p>Tel : 9-2671-2462</p>
						                                        <p>E-Mail : <a href="mailto:patrick.drijkoningen@mil.be">patrick.drijkoningen@mil.be</a></p>
						                                    </div>
						                                    <div>
						                                        <img alt="Adjt Drijkoningen D. (DD)" src="http://hrnode.mil.intra/FotoProggie/output_foto150/A46728.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">Adjt Drijkoningen D. (DD)</p>
						                                        <p>10 W Tac - Smd E&amp;T</p>
						                                        <p>Tel : 9-2671-2462</p>
						                                        <p>E-Mail : <a href="mailto:dirk.drijkoningen@mil.be">dirk.drijkoningen@mil.be</a></p>
						                                    </div>
						                                </div>
						                            </li>
						                        </ul>
						                    </li>
						                    <li class="dropdown">
						                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">AdHoc Query<span class="caret"></span></a>
						                        <ul class="dropdown-menu">
						                            <li><a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/_SAMPLE/IL_CPN_SQL/IL_CPN_SQL.xml?pLANG={$vLANG}&amp;pRID=10033" target="ERD">Adhoc Query (Provided by CPN)</a></li>
						                            <li role="separator" class="divider"></li>
						                            <li><a href="http://erd.idcn.mil.intra/erd/mainframe" target="ERD">Query Builder (Provided by MR C&amp;I)</a></li>
						                            <li><a href="/QueryBuilder/" target="QueryBuider">ERD</a></li>
						                            <li><a href="#" target="QB_Documentation">Documentation</a></li>
						                            <li>
						                            	<div class="navbar-contact">
						                                    <div>
						                                        <img alt="CPN Beirens G." src="http://hrnode.mil.intra/FotoProggie/output_foto150/0201809.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">CPN Beirens G.</p>
						                                        <p>CIS/S/DS - Bur Data Services</p>
						                                        <p>Tel : 9-2400-4341</p>
						                                        <p>E-Mail : <a href="mailto:gregory.beirens@mil.be">Gregory.Beirens@mil.be</a></p>
						                                    </div>
						                                </div>
						                            </li>
						                        </ul>
						                    </li>
						                    
						                </ul>
						                <ul class="nav navbar-nav navbar-right">
						                    <li class="dropdown">
						                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">DBase Tool <span class="caret"></span></a>
						                        <ul class="dropdown-menu">
						                            <li><a href="/admin.php" target="adminer">Adminer</a></li>
						                            <li role="separator" class="divider"></li>
						                            <li><a href="/phpmyadmin" target="adminer">PHPMyAdmin 3</a></li>
						                        </ul>
						                    </li>
						                    <li class="dropdown">
						                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Language (<xsl:value-of select="$vLANG"/>)<span class="caret"></span></a>
						                        <ul class="dropdown-menu">
						                            <script>
						                                var MLang='';
						                                switch(NodeSetArr.Language) {
						                                    case 'FR':
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'FR\');" style="color:#ff0;font-weight:bold;cursor:pointer;">Francais</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'EN\');" style="cursor:pointer;">English</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'NL\');" style="cursor:pointer;">Nederlands</a></li>');
						                                        break;
						                                    case 'EN':
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'FR\');" style="cursor:pointer;">Francais</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'EN\');" style="color:#ff0;font-weight:bold;cursor:pointer;">English</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'NL\');" style="cursor:pointer;">Nederlands</a></li>');
						                                        break;
						                                    case 'NL':
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'FR\');" style="cursor:pointer;">Francais</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'EN\');" style="cursor:pointer;">English</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'NL\');" style="color:#ff0;font-weight:bold;cursor:pointer;">Nederlands</a></li>');
						                                        break;
						                                    default:
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'FR\');" style="cursor:pointer;">Francais</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'EN\');" style="cursor:pointer;">English</a></li>');
						                                        document.write('<li><a href="#" onclick="SetNodeLang(\'{$vNodeConfig}\',\'NL\');" style="cursor:pointer;">Nederlands</a></li>');
						                                        break;
						                                }
						                            </script>
						                        </ul>
						                    </li>
						                </ul>
									</div>
									<div class="col-md-1 collapse navbar-inverse navbar-collapse">
										<script>
											if (NodeSetArr.armynumber=='N/A') {
													document.write('<img class="profilePic" src="/{$vHtDocsConfig}/CPN/img/Flat/contact-icon.png" width="30px"/>');
												} else {
													document.write('<img class="profilePic" src="http://hrnode.mil.intra/FotoProggie/output_foto150/'+NodeSetArr.armynumber+'.jpg" width="30px"/>');
												};
										</script>
										
									</div>
									<div class="col-md-2 collapse navbar-inverse navbar-collapse">
										<select class="selectpicker" title="Unknown" name="user" id="user">
											<option data-icon="glyphicon-cog" value="settings">Settings</option>
											<!--
											<option data-icon="glyphicon-user" value="profile">Profile</option>
											-->
											<option data-divider="true"></option>
											<option data-icon="glyphicon-off" value="login">Login</option>
											<option data-icon="glyphicon-off" value="logout">Logout</option>
										</select>
									</div>
									<script>
										$('#user').prop('title', NodeSetArr.displayname);
										$(function() {
										  $('.selectpicker').on('change', function(){
										    var selected = $(this).find("option:selected").val();
										    //alert(selected);
										    switch (selected) {
										    case 'settings':
										        window.location="Settings.xml";
										        break; 
										    case 'login':
										        window.location="Login.xml";
										        break; 
										    case 'logout':
										    	NodeSetArr.user='';
												NodeSetArr.armynumber='';
												NodeSetArr.displayname='';
												var LoginMsg='LogOut is Done';
												localStorage.setItem('<xsl:value-of select="$vNodeConfig"/>_Settings',JSON.stringify(NodeSetArr));
												location.reload(); 
												break; 
										    default: 
										        text = "Looking forward to the Weekend";
											} 
										  });
										});
									</script>
								</div>
							</div>
						<!--/nav-->
					</div>
					
					<div id="page-content-wrapper">
						<b>
							<ul class="nav nav-tabs">
							  	<li class="active"><a data-toggle="tab" href="#home">Welcome on the <xsl:value-of select="$vNodeName"/></a></li>
							  	<li><a data-toggle="tab" href="#menu1">What's News</a></li>
							  	<li><a data-toggle="tab" href="#menu2">Current Bug's</a></li>
							  	<li><a data-toggle="tab" href="#menu3">POC, Forum and Feedbacks</a></li>
							</ul>
						</b>

						<div class="tab-content">
						  	<div id="home" class="tab-pane fade in active">
						    	<center>
							    	<h2><b>Welcome on the <xsl:value-of select="$vNodeName"/>.</b></h2>
									<h3>Based on CPN Version <small><xsl:value-of select="$CPNVersion"/></small></h3>
									<h3>This Node provides a way to <b>Create, Improve and Extend</b><br/>MR - Ops - QR (ILIAS) Node Reports!</h3>
								</center>
								<p style="text-align:center;"><img style="width:247px;height:273px;" src="/{$vHtDocsConfig}/Home/img/cpn.png"/></p>
								<p style="text-align:center;">This is the homepage of the <code>Common Pillar Node</code>. From here you can adjust your settings, visit all members of the CPN ( MR, QR ILIAS, OPS) and query their reports.</p>
						  	</div>
						  	<div id="menu1" class="tab-pane fade col-md-offset-1">
						    	<h2>What's New</h2>
						    	<p>
						    		See on CPN FW Version Logging Page on ILIAS Wiki
						    	</p>
						  	</div>
						  	<div id="menu2" class="tab-pane fade col-md-offset-1">
						    	<h3>Current Bug's not yet solved</h3>
						    	<p>
						    		See on CPN FW Forum
						    	</p>
						  	</div>
						  	<div id="menu3" class="tab-pane fade col-md-offset-1">
						    	<h3>Point of Contact</h3>
						    	<p>
						    		<h4>Cdt IBANEZ</h4>
						    		Bemilcom : 9-2400-1469
						    		EMail : Crescencio.ibanez@mil.be
						    		<h4>Forum</h4>
						    		You can post question and answer questions posted by other user ... <a target="_blank" href="http://icp.idcn.mil.intra/iforum/index.php?board=58.0">There</a>
						    		<h4>Feedback</h4>
						    		You can provide Feedback <a target="_blank" href="http://mrnode.mil.intra/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_EVAL/MRN_EVAL.xml?pRID=1064&amp;pVRID=2000&amp;pLANG={$vLANG}">There</a>
						    		<br/><br/>
						    		<h3>
						    			Disclaimer
										<br/>
										<small>
											THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION.
											<br/>
											HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
										</small>
						    		</h3>
						    	</p>
						  	</div>
						</div>
					</div><!-- END PAGE-CONTENT_WRAPPER -->
				</div>
				<script>
					$('.selectpicker').selectpicker({
						style: 'btn-danger',
						size: 3
					});
				</script>
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
	<!--xsl:include href='CPN.xsl'/-->
</xsl:stylesheet>
