<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<!-- Variable Declaration -->	
<xsl:variable name="RepConf">MRN_Prod</xsl:variable>	
<xsl:variable name="dT_Type">99</xsl:variable>
<xsl:variable name="vTBD" select="//dbquery[1]/descriptor/parameters/param[@name='pASSET']/@value"/>
<!-- Variable Declaration End -->
<xsl:template match='/'>	
<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
	<!-- Check Display Mode -->
	<xsl:choose>
		<!-- Pop-Up Version -->
		<xsl:when test="$vMODE='Pop-Up'">
			<center>
				<h1>ILIAS Organism Id Card Sample</h1>
				<!-- Récupération du Id du Pop-Up -->
				<xsl:apply-templates select="//dbquery[@id='TEMPLATE']/rows">		
					<xsl:with-param name="Detail_Data" select="'SPE_ORG_ID'"/> 		
				</xsl:apply-templates>
			</center>
		</xsl:when>
		<!-- Main or Drill-Down Version -->
		<xsl:otherwise>
			<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
				<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text> 
				<meta http-equiv="x-ua-compatible" content="IE=edge"/>
				<html>
					<head>
						<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
						<xsl:call-template name="Node_Std_Head">
							<xsl:with-param name="Node_Conf" select="$RepConf"/>
						</xsl:call-template>
					</head>
					<title>I4 Sample</title>
					<body>
						<!-- Report Layout Template (Top) -->
						<xsl:call-template name="Body_Start">
							<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
							<xsl:with-param name="tLocal" select="'NO'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
							<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
						</xsl:call-template>
						
						<xsl:if test="$vMODE='Main'">
							<center>
								<h1>I4</h1>
							</center>
							<xsl:call-template name="Generic_Table_DBWEB">
								<xsl:with-param name="DBWEB_Name" select="@id"/>
								<xsl:with-param name="UdTN" select="'OrganismId'"/>
								<xsl:with-param name="Show_Empty" select="'Y'"/> 
								<xsl:with-param name="Node_Conf" select="$RepConf"/>
								<xsl:with-param name="dT_Type" select="'99'"/>
								<xsl:with-param name="Lang" select="$vLANG"/>
								<xsl:with-param name="TableClass" select="'display cell-border'"/> 
								<xsl:with-param name="RepDic" select="'Y'"/> 
								<xsl:with-param name="NRT" select="'NRT'"/> 
								<xsl:with-param name="MaxRecords" select="9999"/>
								<xsl:with-param name="Frame" select="'YO'"/>
								<xsl:with-param name="TableWidth" select="'80%'"/>
								<xsl:with-param name="Detail_Data" select="'SPE_ORG_ID'"/>
							</xsl:call-template>
						</xsl:if>
						<!-- Report Layout Template (Bottom) -->
						<xsl:call-template name="Body_End">
							<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
							<xsl:with-param name="tLocal" select="'NO'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
							<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
						</xsl:call-template>
					</body>
				</html>
		</xsl:otherwise>
	</xsl:choose>
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
		<xsl:when test="$Detail_Data='SPE_ORG_ID'">
			<table align="center" width="950px">
				<tbody>
					<tr>
						<td align='center' rowspan="2">
							<b>Resp Org</b><br/>
							<table class="tablelist">
								<tr>
									<xsl:for-each select = "//dbquery[@id='ORG_Info']/rows/row">
										<xsl:variable name="vPICMAT"><xsl:value-of select="@ARMY_NUMBER"/></xsl:variable>
										<td align='center'>
										<img border="0" src="http://hrnode.mil.intra/FotoProggie/output_foto150/{$vPICMAT}.jpg" width="50px" alt="HR Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/Flat/contact-icon.png'"/><br/>
										</td>
									</xsl:for-each>	
								</tr>
								<tr>
									<xsl:for-each select = "//dbquery[@id='ORG_Info']/rows/row">
									<td align='center'>
										<small>
										<xsl:value-of select='@FNAME'/><br/>
										<xsl:value-of select='@TEL'/><br/>
										<xsl:value-of select='@EMAIL'/><br/>
										</small>
									</td>
									</xsl:for-each>
								</tr>
							</table>
						</td>
						<td align='center' width="75%">
							<!-- LORG Info's -->
							<table border="1" align="center" width="100%" class="tablelist">
								<xsl:for-each select = "//dbquery[@id='ORG_Info']/rows/row">
									<thead>
										<tr>
											<th align='center' width="100%" colspan="6"><big><xsl:value-of select='@DESCRIPTION'/> (From LORG)</big></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th align='center' width="50%" colspan="3">Fr : <xsl:value-of select='@HEADING_FR'/></th>
											<th align='center' width="50%" colspan="3">Nl : <xsl:value-of select='@HEADING_NL'/></th>
										</tr>
									</tbody>
								</xsl:for-each>
							</table>
							<table border="1" align="center" width="100%" class="tablelist">
								<xsl:for-each select = "//dbquery[@id='ORG_Info']/rows/row">
									<thead>
										<tr>
											<TH>Address</TH>
											<TH>Street</TH>
											<TH>City</TH>
											<TH>Country</TH>					
											<TH>Phone</TH>
											<TH>Fax</TH>
										</tr>
									</thead>
									<tbody>				
										<tr>
											<td align='left'>
												<xsl:if test="@ADDRESS=''">
													<xsl:attribute name="style">background:#DE4040</xsl:attribute>
												</xsl:if>
												<xsl:value-of select="if(@ADDRESS='') then '???' else @ADDRESS"/>
											</td>
											<td align='left'>
												<xsl:if test="@STREET=''">
													<xsl:attribute name="style">background:#DE4040</xsl:attribute>
												</xsl:if>
												<xsl:value-of select="if(@STREET='') then '???' else @STREET"/>
											</td>
											<td align='left'>
												<xsl:if test="@CITY=''">
													<xsl:attribute name="style">background:#DE4040</xsl:attribute>
												</xsl:if>
												<xsl:value-of select="if(@CITY='') then '???' else @CITY"/>
											</td>
											<td align='left'>
												<xsl:if test="@COUNTRY=''">
													<xsl:attribute name="style">background:#DE4040</xsl:attribute>
												</xsl:if>
												<xsl:value-of select="if(@COUNTRY='') then '???' else @COUNTRY"/>
											</td>						
											<td align='left'>
												<xsl:if test="@PHONE=''">
													<xsl:attribute name="style">background:#DE4040</xsl:attribute>
												</xsl:if>
												<xsl:value-of select="if(@PHONE='') then '???' else @PHONE"/>
											</td>
											<td align='left'><xsl:value-of select='@FAX'/></td>
										</tr>
									</tbody>
								</xsl:for-each>
							</table>
							
							<!-- STORED Info's -->
							<xsl:if test="count(//dbquery[@id='STORES_Info']/rows/row)>0">
								<hr/>
								<table border="1" align="center" width="100%" class="tablelist">
									<xsl:for-each select = "//dbquery[@id='STORES_Info']/rows/row">
										<thead>
											<tr>
												<th align='center' width="100%" colspan="6"><big><xsl:value-of select='@DESCRIPTION'/> (From STORED)</big></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th align='center' width="50%" colspan="3">Type : <xsl:value-of select='@TYPE'/> - Supervised : <xsl:value-of select='@SUPERVISED'/></th>
												<th align='center' width="50%" colspan="3">HS: <xsl:value-of select='@HIGHER_STORE'/> - HL: <xsl:value-of select='@AUTH_LEVEL'/> - VIA: <xsl:value-of select='@VIA_STORE'/></th>
											</tr>
										</tbody>
									</xsl:for-each>
								</table>
								<table border="1" align="center" width="100%" class="tablelist">
									<xsl:for-each select = "//dbquery[@id='STORES_Info']/rows/row">
										<thead>
											<tr>
												<TH>Address (Line 1)</TH>
												<TH>Address (Line 2)</TH>
												<TH>Address (Line 3)</TH>
												<TH>Address (Line 4)</TH>					
											</tr>
										</thead>
										<tbody>				
											<tr>
												<td align='left'><xsl:value-of select='@ADDRESS1'/></td>
												<td align='left'><xsl:value-of select='@ADDRESS2'/></td>
												<td align='left'><xsl:value-of select='@ADDRESS3'/></td>
												<td align='left'><xsl:value-of select='@ADDRESS4'/></td>						
											</tr>
										</tbody>
									</xsl:for-each>
								</table>
							</xsl:if>
						</td>
					</tr>
				</tbody>
			</table>
			<hr/>
		</xsl:when>
		<xsl:otherwise>
			<!-- No Specfic Content defined -->
			No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
