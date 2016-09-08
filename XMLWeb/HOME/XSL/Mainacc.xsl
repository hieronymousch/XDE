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
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/jQuery-2.1.4/jquery-2.1.4.min.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/bootstrap-3.3.5/js/bootstrap.min.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/Home/js/bootstrap-select.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/Home/js/sidebar.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/js/CPN.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/toastr/toastr.js"></script>
					<script type="text/javascript" src="/{$vHtDocsConfig}/CPN/extras/mpopup/jquery.magnific-popup.js"></script>
							
				<!-- CSS -->
					
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/extras/toastr/toastr.css"/>
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/fonts/linecons/css/linecons.css" />
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/fonts/fontawesome/css/font-awesome.min.css" />
					<link rel="stylesheet" type="text/css" href="/{$vHtDocsConfig}/CPN/extras/bootstrap-3.3.5/css/bootstrap.min.css" />
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
								<a href="Settings.xml" title="Settings"><div class="fa fa-cog"></div>Settings</a>
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
									<div class="col-md-1 navbar-inverse">
										<!--span class="fa fa-bars" id="menu-toggle" title="Show / Hide full menu."></span-->
										<ul class="nav navbar-nav navbar-inverse navbar-left">	
											<li>
						                        <span class="fa fa-bars" id="menu-toggle" title="Show / Hide full menu."></span>
						                    </li>
										</ul>
									</div>
									<div class="col-md-8 collapse navbar-inverse navbar-collapse" style="text-align:center;">
										<ul class="nav navbar-nav navbar-inverse navbar-left">	
											<li class="active">
						                        <a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
						                    </li>
						                    <li>
						                        <script>
						                            document.write('<a href="http://mrnode.mil.intra/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_REDIR/REDIR.xml?pLANG={$vLANG}&amp;pRID=2000" target="_blank">CPN Status</a>')
						                        </script>  
						                    </li>
						                    <li>
						                        <script type="text/javascript">
						                            document.write('<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/CPN/CPN_STATUS/CPN_STATUS.xml?pLANG='+ NodeSetArr.Language +'" target="_blank">Status</a>')
						                        </script>
						                    </li>
						                    <li>
						                        <script type="text/javascript">
						                            document.write('<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/CPN/CPN_REPORT/CPN_REP_LIST.xml?pLANG='+ NodeSetArr.Language +'" target="_blank">Reports</a>')
						                        </script>
						                    </li>
						                    <li class="dropdown">
						                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Community <span class="caret"></span></a>
						                        <ul class="dropdown-menu">
						                        	<li><a href="http://cdclprdicp02.idcn.mil.intra/iforum/index.php?board=46.0" target="Forum">Forum DB Node</a></li>
						                            <li><a href="http://cdclprdicp02.idcn.mil.intra/iforum/index.php?board=58.0" target="Forum">Forum CPN FW</a></li>
						                            <li role="separator" class="divider"></li>
						                            <li>
						                            	<a href="#" onclick="alert('Later');" data-toggle="modal" data-target="#community" role="button">CPN Community</a>
						                            </li>
						                            <li role="separator" class="divider"></li>
						                            <li>
						                            	<xsl:choose>
						                            		<xsl:when test="$vLANG='FR' or $vLANG='NL'">
						                            			<script type="text/javascript">
										                            document.write('<a href="http://cdclprdicp02.idcn.mil.intra/bedef'+ NodeSetArr.Language.toLowerCase() +'/index.php?title=CPN" target="_blank">Doc on Wiki</a>')
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
						                                    <div>
						                                        <img alt="Cdt IBANEZ C." src="http://hrnode.mil.intra/FotoProggie/output_foto150/9180231.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">Cdt IBANEZ C.</p>
						                                        <p>ILIAS Support - MR-Mgt</p>
						                                        <p>Tel : 9-2400-1469</p>
						                                        <p>Fax : 9-2400-6702</p>
						                                        <p>E-Mail : <a href="mailto:crescencio.ibanez@mil.be">crescencio.ibanez@mil.be</a></p>
						                                    </div>
						                                    <hr/>
						                                    <div>
						                                        <img alt="Adjt DUBUS R." src="http://hrnode.mil.intra/FotoProggie/output_foto150/R73827.jpg"/>
						                                        <p style="font-weight:bold;color:#ff0;">Adjt DUBUS R.</p>
						                                        <p>ILIAS Support - MR-Mgt</p>
						                                        <p>Tel : 9-2400-1469</p>
						                                        <p>Fax : 9-2400-6702</p>
						                                        <p>E-Mail : <a href="mailto:renzo.dubus@mil.be">renzo.dubus@mil.be</a></p>
						                                    </div>
						                                    <hr/>
						                                    <div>
						                                        <p>
						                                        	<a href="http://mrnode.mil.intra/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_EVAL/MRN_EVAL.xml?pRID=1064&amp;pVRID=2000&amp;pLANG={$vLANG}0" target="_blank">
						                                        		<p style="font-weight:bold;color:#ff0;">Feedback To Node Administrators</p>
						                                        	</a>
						                                        </p>
						                                    </div>
						                                </div>
						                            </li>
						                        </ul>
						                    </li>
						                    <li class="dropdown">
						                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Query Buider <span class="caret"></span></a>
						                        <ul class="dropdown-menu">
						                            <li><a href="/QueryBuilder/" target="QueryBuider">Query Builder (Provided by MR C&amp;I)</a></li>
						                            <li role="separator" class="divider"></li>
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
						                            <li><a href="/phpMyAdmin-4.0.10.8" target="adminer">PHPMyAdmin 4</a></li>
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
										<xsl:variable name="vArmyNbr" select="//dbquery[@id='MRN_USER']/rows/row/@employeeID"/>
										<img class="profilePic" width="30px">
											<xsl:attribute name="src"><xsl:value-of select="concat('http://hrnode.mil.intra/FotoProggie/output_foto150/',$vArmyNbr,'.jpg')"/></xsl:attribute>
										</img>
									</div>
									<div class="col-md-2 collapse navbar-inverse navbar-collapse">
										<select class="selectpicker" title="Unknown" name="user" id="user">
											<option data-icon="glyphicon-cog" value="settings">Settings</option>
											<!--
											<option data-icon="glyphicon-user" value="profile">Profile</option>
											
											<option data-divider="true"></option>
											<option data-icon="glyphicon-off" value="login">Login</option>
											<option data-icon="glyphicon-off" value="logout">Logout</option>
											-->
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
							  	<li><a data-toggle="tab" href="#menu1">What's News in RC1</a></li>
							  	<li><a data-toggle="tab" href="#menu2">Current Bug's in Beta 7</a></li>
							  	<li><a data-toggle="tab" href="#menu3">POC, Forum and Feedbacks</a></li>
							  	<li><a data-toggle="tab" href="#menu4">Future Version (Production 1.0)</a></li>
							</ul>
						</b>

						<div class="tab-content">
						  	<div id="home" class="tab-pane fade in active">
						    	<br/>
						    	<div class="col-md-5">
						    		<center>
						    			<img src="/{$vHtDocsConfig}/CPN/img/logo/MRN_Accept/TextLogo.png" width="300px"/>
						    		</center>
						    	</div>
						    	<div class="col-md-7">
						    		<center>
								    	<h2><b>Welcome on the <xsl:value-of select="$vNodeName"/>.</b></h2>
										<h3>Based on CPN Version <small><xsl:value-of select="$CPNVersion"/></small></h3>
										<img style="width:50px" src="/{$vHtDocsConfig}/Home/img/cpn.png"/> Member of CPN Community
									</center>
						    	</div>
						    	<div class="row">
							    	<center>
							    		<div class="col-md-8 col-md-offset-2">
								    		<center>
								    			<h3>This Node used <b>latest version of CPN FW</b> and will be used to test the Future MR Node Production</h3>
									    		<p style="text-align:center;">
									    			Please help us to test and validate reports based on the new framework.
									    			<br/><br/>
									    			MR Node Administrators (Cdt IBANEZ C and Adjt DUBUS R.)
									    		</p>
								    		</center>
								    	</div>
									</center>
						    	</div>
							</div>
						  	<div id="menu1" class="tab-pane fade col-md-offset-1">
						    	<h2>What's New</h2>
						    	<p>
						    		<h3>In Current Version (RC1) :</h3>
						    		This version is probably the last version before Production Version 1.0. 
						    		<ul>
						    			<li>
						    				Problem with SPE00 is now Fixed. By MIB (Cdt Ibanez)
						    			</li>
						    			<li>
						    				Samples Updated and modified to be in accordance with Wiki Documentation. By MIB (Cdt Ibanez)
						    			</li>
						    			<li>
						    				Documentation is available only in French in ILIAS Wiki. PLEASE Help US 
						    				<ul>
						    					<li>to translate</li>
						    					<li>to comment ONLY in Discussion Pages the Documentation</li>
						    				</ul>
						    				Entry point Pages are  
						    				<ul>
						    					<li>DB Node (Category)</li>
						    					<li>CPN</li>
						    				</ul>
						    				By MIB (Cdt Ibanez)
						    			</li>
						    			<li>
						    				Dictionary Parameter in correctly used by Title/Page Name/Block Query and Fields. By MIB (Cdt Ibanez)
						    			</li>
						    			<li>
						    				Bug in Multiple Drill-Down2 (now OK). By MIB (Cdt Ibanez)
						    			</li>
						    			<li>
						    				Language is now correctly used in Drill-Down Mode (Only English in previous version). By MIB (Cdt Ibanez)
						    			</li>
						    			<li>
						    				Added indication of number of colums shown versus total in a Table generated by dataTable. Thanks DD - Dirk Drijkoningen (10W Data Cell - QR Node ILIAS Admin) ! 
						    			</li>
						    			<li>
						    				Sorting on numbers in a XTable is now Correct. Thanks Dirk Drijkoningen (10W Data Cell - QR Node ILIAS Admin) ! 
						    			</li>
						    			<li>
						    				Parameter HeatMap added for Xtable. This parameter allows to colorized the XTable with a Heatmap (Color Darkness background based on value in XTable). Thanks Dirk Drijkoningen (10W Data Cell - QR Node ILIAS Admin) ! 
						    			</li>
						    			<li>
						    				Remarks (?) are now correctly displayed in Prompts. Thanks Dirk Drijkoningen (10W Data Cell - QR Node ILIAS Admin) ! 
						    			</li>
						    			<li>
						    				Pop-up Background is now fixed. Thanks Dirk Drijkoningen (10W Data Cell - QR Node ILIAS Admin) ! 
						    			</li>
						    			<li>
						    				2 news parameters added in Node Config for Feedback and DataDic (Only for Pillar Nodes). By MIB (Cdt Ibanez)
						    			</li>
						    		</ul>
						    		<h3>CPN Ver 1.0 Beta 6 :</h3>
						    		<ul>
						    			<li>
						    				Prompt sometimes empty (for a specific language) ... solved. Used of Param 'En' if 'Fr' or 'Nl' empty
						    			</li>
						    			<li>
						    				Datadic popup colored based on case and italic only applied if nothing found.
						    			</li>
						    			<li>
						    				Multiple Drill-Down2 in same report generate multiple Drill-Down2 for Each Drill-Down (Side-Effect). Solved with correction in CPN.js (Don't forget to update Default2)
						    			</li>
						    			<li>
						    				Drill-Down2 generates a Pop-Up for Report Debugging.
						    			</li>
						    			<li>
						    				Datadictionnary problem in Xtable and XGraph. Solved. Tip (Don't fill pLANG in $XMLFileName or $XMLFileParamName). Idem for DD2
						    			</li>
						    			<li>
						    				Drill-Down on Graph (Template XGRAPH) is now effective (plus Cursor)
						    			</li>
						    			<li>
						    				At this moment the tooltip created by opentip, partially hides behind the top navbar.
											<br/>Example: hover over "Accuracy" or in the grey bar over "Node List of Report's".
											<br/>Thanks DD
						    			</li>
						    		</ul>
						    		<h3>CPN Ver 1.0 Beta 5 :</h3>
						    		<ul>
						    			<li>
						    				Language Switching now correct for All Node Configuration
						    			</li>
						    			<li>
						    				Status Node (base on dbn_entities) is now correct and Report Accuracy also
						    			</li>
						    			<li>
						    				Side-Effet on dataTable filter when Input tag used is now disappeared
						    			</li>
						    			<li>
						    				About (See Menu) enhanced with parameters info and Authentication can be activated on Pillar Node. Use pUSER parameter in Reports. 
						    			</li>
						    			<li>
						    				Added Generic Template for Tabulation (Not full Ops) 
						    			</li>
						    		</ul>
						    		<h3>CPN Ver 1.0 Beta 4 :</h3>
						    		<ul>
						    			<li>
						    				Added Query Builder provided by MR C&amp;I. This tool is NOT part of CNP FW. Bugs, remarks and questions must be forwarded to MR C&amp;I. Query builder has been adapted to work on latest version of DBNode (DBWeb retrieveEntities.xml)
						    			</li>
						    			<li>
						    				Solved Bugs See Topics 2077,2078,2081,2076,2079
						    			</li>
						    			<li>
						    				Report Info, About, Block Info, Block Toolbox, Queries Used enhanced.
						    			</li>
						    			<li>
						    				Acceptance Env (See MR Node - MR_Accept) added (Pink).
						    			</li>
						    			<li>
						    				Added MS Access Database called NodeManagement.accdb located in htdoc. This tool helps user to manage 
						    				<ul>
						    					<li>Report in local node (Report DataModel)</li>
						    					<li>local Indexes</li>
						    				</ul>

						    			</li>
						    		</ul>
						    		<h3>CPN Ver 1.0 Beta 3 :</h3>
						    		<ul>
						    			<li>
						    				New Sample Added (01) - Generate which generate report with 1 Call-Template
						    			</li>
						    			<li>
						    				Sample 2 includes examples of different type of Prompts (Radio, Date Picker, Dropbox, Mandatory)
						    			</li>
						    			<li>
						    				Link adapted for image in Special Features (SPE20). Now Pillar Node icon are shown properly + option 0 for no icon.
						    			</li>
						    			<li>
						    				SPE02 adapted : works with redirect page define in Node_config.xsl (param vNodeRedirect)
						    			</li>
						    			<li>
						    				Template Node_Std_Table simplified : all nodes use same dt_Type (Default is 99 - All options). Caution : you can preset options in Node_Config
						    			</li>
						    		</ul>
						    	</p>
						  	</div>
						  	<div id="menu2" class="tab-pane fade col-md-offset-1">
						    	<h3>Current Bug's not yet solved in Beta 6</h3>
						    	<p>
						    		<ul>
						    			<li>
						    				All known Bugs are solved 
						    			</li>
						    		</ul>
						    	</p>
						  	</div>
						  	<div id="menu3" class="tab-pane fade col-md-offset-1">
						    	<h3>Point of Contact</h3>
						    	<p>
						    		<h4>Cdt IBANEZ</h4>
						    		Bemilcom : 9-2400-1469
						    		EMail : Crescencio.ibanez@mil.be
						    		<h4>Forum</h4>
						    		You can post question and answer questions posted by other user ... <a target="_blank" href="http://cdclprdicp02.idcn.mil.intra/iforum/index.php?board=58.0">There</a>
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
						  	<div id="menu4" class="tab-pane fade col-md-offset-1">
						    	<h2>Production Version 1.0 <small>Final Version</small></h2>
						    	<p>
						    		<h3>Final Version :</h3>
						    		<ul>
						    			<li>
						    				None
						    			</li>
						    		</ul>
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
