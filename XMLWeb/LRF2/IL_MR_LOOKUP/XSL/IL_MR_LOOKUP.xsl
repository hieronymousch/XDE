<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<!-- Variable Declaration -->	
<xsl:variable name="RepConf">MRN_Prod</xsl:variable>	
<xsl:variable name="dT_Type">99</xsl:variable>
<xsl:variable name="vRepDic" select="document('../IL_MR_LOOKUP_RepDic.xml')" />
<xsl:variable name="vASSET" select="//dbquery[1]/descriptor/parameters/param[@name='pASSET']/@value"/>
<!-- Variable Declaration End -->
<xsl:template match='/'>	
<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
	<!-- Check Display Mode -->
	<xsl:choose>
		<!-- Pop-Up Version -->
		<xsl:when test="$vMODE='Pop-Up'">
			<center>
				<h2>
				<center>
					<u>
						LLOOK Explanation
					</u>
				</center>
			</h2>

			<table border="0" width="100%" align="center" class="tablelist">
				<thead class="MRHead">
					<tr>
						<TH width='10%'>Type (Code)</TH>
						<TH width='30%'>Description (En)</TH>
						<TH width='30%'>Beschrijving (Nl)</TH>
						<TH width='30%'>Description (Fr)</TH>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select = "//dbquery[@id='LOOKUP_CODE_Info']/rows/row">
						<tr>
							<td align='left'><xsl:value-of select='@TYPE_DESCRIPTION'/></td>
							<td align='left'><xsl:value-of select='@DESCRIPTION'/></td>
							<td align='left'><xsl:value-of select='@DESCRIPTION_NL'/></td>
							<td align='left'><xsl:value-of select='@DESCRIPTION_FR'/></td>						
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
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
					<title>
						<xsl:call-template name="FromDic2Rep">
							<xsl:with-param name="Title2S" select="'REPORT_TITLE'"/>
							<xsl:with-param name="Lang" select="$vLANG"/>
						</xsl:call-template>
						<xsl:value-of select="$vASSET"/>
					</title>
					<body>
						<!-- Report Layout Template (Top) -->
						<xsl:call-template name="Body_Start">
							<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
							<xsl:with-param name="tLocal" select="'NO'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
							<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
						</xsl:call-template>
						
						<xsl:if test="$vMODE='Main'">
							<center>
								<h1>Soon Available</h1>
								<br/>
								<h1>
									<xsl:call-template name="FromDic2Rep">
										<xsl:with-param name="Title2S" select="'REPORT_TITLE'"/>
										<xsl:with-param name="Lang" select="$vLANG"/>
									</xsl:call-template>
									<xsl:value-of select="$vASSET"/>
								</h1>
							</center>
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
