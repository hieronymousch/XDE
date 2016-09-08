<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<!-- Variable Declaration -->	
	<xsl:variable name="RepConf">MRN_Prod</xsl:variable>	
	<xsl:variable name="dT_Type">99</xsl:variable>

	<!-- Variable Declaration End -->
	<xsl:template match='/'>	
		<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text> 
			<head>
				<meta charset="utf-8"/>
			    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
			    <meta name="viewport" content="width=device-width, initial-scale=1"/>
			    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
			    
				<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
				<xsl:call-template name="Node_Std_Head">
					<xsl:with-param name="Node_Conf" select="$RepConf"/>
				</xsl:call-template>
				<title>
					Login @ <xsl:value-of select="$vNodeName"/>
				</title>
			</head>
			<body>
				<script>
					SetUAAN('<xsl:value-of select="$vNodeConfig"/>','<xsl:value-of select="upper-case(//dbquery[@id='MRN_USER']/rows/row/@sAMAccountName)"/>','<xsl:value-of select="upper-case(//dbquery[@id='MRN_USER']/rows/row/@employeeID)"/>','<xsl:value-of select="$vLANG"/>','<xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@displayName"/>');
				</script>
				<div class="container">
					<center>
						<h1>
							Welcome <xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@displayName"/>
							<br/><small>You are successfully logged In and Identified</small>
						</h1>
						<br/>
					</center>
						<div class="row" >	
							<div class="col-md-4 col-md-offset-1" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
								<center>
									<div class="col-md-2">
										<div class="user-info">
											<div class="user-image">
												<a href="Settings.xml">
													<!--xsl:variable name="vMAT" select="//dbquery[@id='MRN_USER']/rows/row/@employeeID"/
													<xsl:variable name="vMAT" select="'9180231'"/>
													<img src="http://hrnode.mil.intra/FotoProggie/output_foto150/{$vMAT}.jpg" width="50px" class="img-circle"/>
													-->
												</a>
											</div>
										</div>
									</div>
								</center>
								<div class="col-md-1">
									<div class="user-info">
										<div class="user-details">
											<h3>
												<a href="Settings.xml">
													<xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@displayName"/>
												</a>
											</h3>
											<p class="user-title"><xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@title"/></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-md-offset-2" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
								<h4>
									Quick Settings
								</h4>
								<h5>Default Language <small>for all reports</small></h5>
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
						<hr/>
						<div class="clearfix visible-xs"></div>
						<div class="row">	
							<div class="col-md-3 col-md-offset-1">
								<h2>LDAP<small> Informations</small></h2>
								<ul class="list-unstyled">
									<li>
										<label for="sp-chk1">
											Name : <xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@displayName"/>
										</label>
									</li>
									<li>
										<label for="sp-chk1">
											Unit : <xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@company"/>
											<xsl:text> </xsl:text>
											(<xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@department"/>)
										</label>
									</li>
									<li>
										<label for="sp-chk1">Phone : <xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@telephoneNumber"/></label>
									</li>
									<li>
										<label for="sp-chk1">EMail : <xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@Mail"/></label>
									</li>
									<li>
										<a target="_blank">
											<xsl:attribute name="href">https://www.google.be/maps/place/<xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@postalCode"/>+<xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@L"/>+<xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@streetAddress"/></xsl:attribute>
											<i class="fa-angle-right"></i>
											Loc : <xsl:value-of select="//dbquery[@id='MRN_USER']/rows/row/@physicalDeliveryOfficeName"/>
										</a>
									</li>
								</ul>
							</div>
							<div class="col-md-3 col-md-offset-1">
								<h2>ILIAS<small> Informations</small></h2>
								<ul class="list-unstyled">
									<li>
										<label for="sp-chk1">
											Name : <xsl:value-of select="//dbquery[@id='ILIAS_USER']/rows/row/@NAME"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="//dbquery[@id='ILIAS_USER']/rows/row/@FIRSTNAME"/>
										</label>
									</li>
									<li>
										<label for="sp-chk1">Phone : <xsl:value-of select="//dbquery[@id='ILIAS_USER']/rows/row/@TEL"/></label>
									</li>
									<li>
										<label for="sp-chk1">EMail : <xsl:value-of select="//dbquery[@id='ILIAS_USER']/rows/row/@EMAIL"/></label>
									</li>
									<li>
										<label for="sp-chk1">Group : <xsl:value-of select="distinct-values(//dbquery[@id='ILIAS_GROUP']/rows/row/@MENU_GROUP)"/></label>
									</li>
								</ul>
							</div>
							<!--
							<div class="col-md-3 col-md-offset-1">
								<h2>Connexion<small> To Databases</small></h2>
								<ul class="list-unstyled">
									
									<li>
										<span class="status green"></span> MR Node
									</li>
									<xsl:if test="count(//dbquery[@id='ILIAS_IREP_VER'])=1">
										<li>
											<xsl:choose>
												<xsl:when test="count(//dbquery[@id='ILIAS_IREP_VER']/error)>0"><span class="status red"></span></xsl:when>
												<xsl:otherwise><span class="status green"></span></xsl:otherwise>
											</xsl:choose>
											 IREP (ILIAS Near Real-Time)
										</li>
									</xsl:if>
									<li>
										<span class="status green"></span> ILIAS Wiki
									</li>
								</ul>
							</div>
							-->
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
