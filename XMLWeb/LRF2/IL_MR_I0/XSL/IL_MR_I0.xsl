<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<!-- Variable Declaration -->	
<xsl:variable name="RepConf">MRN_Prod</xsl:variable>	
<xsl:variable name="dT_Type">99</xsl:variable>
<xsl:variable name="vRepDic" select="document('../IL_MR_I0_RepDic.xml')" />
<!-- Variable Declaration End -->
<xsl:template match='/'>	
<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
	<!-- Check Display Mode -->
	<xsl:choose>
		<!-- Pop-Up Version -->
		<xsl:when test="$vMODE='Pop-Up'">
			<center>
				<h2>I0 - Defense Person Id Card</h2>
			</center>
			<center>
				<xsl:choose>
					<xsl:when test="count(//dbquery[@id='IL_MR_I0G_LDAP']/rows/row)>0">
						<h2><xsl:value-of select="//dbquery[@id='IL_MR_I0G_LDAP']/rows/row[1]/@displayName"/></h2>
						<img width='60px'>
							<xsl:attribute name="src">http://hrnode.mil.intra/FotoProggie/output_foto150/<xsl:value-of select="//dbquery[@id='IL_MR_I0G_LDAP']/rows/row[1]/@employeeID"/>.jpg</xsl:attribute>
						</img>
					</xsl:when>
					<xsl:when test="count(//dbquery[@id='IL_MR_I0G_MPERS']/rows/row)>0">
						<h2><xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@NAME"/></h2>
						<img width='60px'>
							<xsl:attribute name="src">http://hrnode.mil.intra/FotoProggie/output_foto150/<xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@ARMY_NUMBER"/>.jpg</xsl:attribute>
						</img>
					</xsl:when>	
					<xsl:when test="count(//dbquery[@id='IL_MR_I0G_MUSER']/rows/row)>0">
						<h2><xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@NAME"/></h2>
						<img width='60px'>
							<xsl:attribute name="src">http://hrnode.mil.intra/FotoProggie/output_foto150/<xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@ARMY_NUMBER"/>.jpg</xsl:attribute>
						</img>
					</xsl:when>
					<xsl:otherwise>
						<h2>User Not Found. Please Contact MR Node Administrators</h2>
					</xsl:otherwise>
				</xsl:choose>
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
					<title>I0 Sample</title>
					<body>
						<!-- Report Layout Template (Top) -->
						<xsl:call-template name="Body_Start">
							<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
							<xsl:with-param name="tLocal" select="'NO'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
							<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
						</xsl:call-template>
						
						<xsl:if test="$vMODE='Main'">
							<center>
								<h1>I0 Sample</h1>
							
								<xsl:choose>
									<xsl:when test="count(//dbquery[@id='IL_MR_I0G_LDAP']/rows/row)>0">
										<h2><xsl:value-of select="//dbquery[@id='IL_MR_I0G_LDAP']/rows/row[1]/@displayName"/></h2>
										<img width='60px'>
											<xsl:attribute name="src">http://hrnode.mil.intra/FotoProggie/output_foto150/<xsl:value-of select="//dbquery[@id='IL_MR_I0G_LDAP']/rows/row[1]/@employeeID"/>.jpg</xsl:attribute>
										</img>
									</xsl:when>
									<xsl:when test="count(//dbquery[@id='IL_MR_I0G_MPERS']/rows/row)>0">
										<h2><xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@NAME"/></h2>
										<img width='60px'>
											<xsl:attribute name="src">http://hrnode.mil.intra/FotoProggie/output_foto150/<xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@ARMY_NUMBER"/>.jpg</xsl:attribute>
										</img>
									</xsl:when>	
									<xsl:when test="count(//dbquery[@id='IL_MR_I0G_MUSER']/rows/row)>0">
										<h2><xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@NAME"/></h2>
										<img width='60px'>
											<xsl:attribute name="src">http://hrnode.mil.intra/FotoProggie/output_foto150/<xsl:value-of select="//dbquery[@id='IL_MR_I0G_MPERS']/rows/row[1]/@ARMY_NUMBER"/>.jpg</xsl:attribute>
										</img>
									</xsl:when>
									<xsl:otherwise>
										<h2>Person not Found</h2>
									</xsl:otherwise>
								</xsl:choose>
							</center>
						</xsl:if>
							<xsl:for-each select = "//dbquery[contains(@id,'IL_MR_I0G_')]"> <!-- Generic Rest -->
								<xsl:variable name="dTColHidden">
									<xsl:choose>
										<xsl:when test="@id='xxx'">12</xsl:when>
										<xsl:otherwise>None</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="dtSortingCol">
									<xsl:choose>
										<xsl:when test="@id='xxx'">0-desc</xsl:when>
										<xsl:otherwise>0-asc</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="dtDetailData">
									<xsl:choose>
										<xsl:when test="@id='xxx'">SPE_I1_READ</xsl:when>
										<xsl:otherwise>Generic</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:call-template name="Generic_Table_DBWEB">
									<xsl:with-param name="DBWEB_Name" select="@id"/>
									<xsl:with-param name="Show_Empty" select="'N'"/> 
									<xsl:with-param name="Node_Conf" select="$RepConf"/>
									<xsl:with-param name="dT_Type" select="'99'"/>
									<xsl:with-param name="Lang" select="$vLANG"/>
									<xsl:with-param name="TableClass" select="'display cell-border'"/> 
									<xsl:with-param name="RepDic" select="'Y'"/> 
									<xsl:with-param name="dictionary" select="$vRepDic"/> 
									<xsl:with-param name="MaxRecords" select="9999"/>
									<xsl:with-param name="Col_Hidden" select="$dTColHidden"/>
									<xsl:with-param name="Col_Sorting" select="$dtSortingCol"/>
									<xsl:with-param name="Frame" select="'YC'"/>
									<xsl:with-param name="TableWidth" select="'95%'"/>
									<xsl:with-param name="Detail_Data" select="$dtDetailData"/>
								</xsl:call-template>
							</xsl:for-each>
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
		<xsl:when test="$Detail_Data='TBD'">
			
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
