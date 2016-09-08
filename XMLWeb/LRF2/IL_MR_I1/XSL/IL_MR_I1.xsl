<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<!-- Variable Declaration -->	
<xsl:variable name="RepConf">MRN_Prod</xsl:variable>	
<xsl:variable name="dT_Type">99</xsl:variable>
<xsl:variable name="vRepDic" select="document('../IL_MR_I1_RepDic.xml')" />
<xsl:variable name="vASSET" select="//dbquery[1]/descriptor/parameters/param[@name='pASSET']/@value"/>
<!-- Variable Declaration End -->
<xsl:template match='/'>	
<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
	<!-- Check Display Mode -->
	<xsl:choose>
		<!-- Pop-Up Version -->
		<xsl:when test="$vMODE='Pop-Up'">
			<h1>I1 in Pop-Up Mode</h1>
			<center>
				<xsl:choose>
					<xsl:when test="$vLANG='FR'"><h3><xsl:value-of select="//dbquery[@id='NSN']/rows/row/@DESCRIPTION_FR"/></h3></xsl:when>
					<xsl:when test="$vLANG='NL'"><h3><xsl:value-of select="//dbquery[@id='NSN']/rows/row/@DESCRIPTION_NL"/></h3></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
				<table border="0" align="center">
					<tbody>
						<xsl:for-each select="//dbquery[@id='NSN']/rows/row">
							<xsl:variable name="xP2"><xsl:value-of select="@NIIN"/></xsl:variable>
							<tr>
								<td colspan="4" align="center">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-1" width="200px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/NOPIC2.png'"/>
								</td>
							</tr>
							<tr>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-2" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-3" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-4" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-5" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
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
					<title>I1</title>
					<body>
						<!-- Report Layout Template (Top) -->
						<xsl:call-template name="Body_Start">
							<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
							<xsl:with-param name="tLocal" select="'NO'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
							<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
						</xsl:call-template>
						
						<xsl:if test="$vMODE='Main'">
							<center>
								<h1>I1 Sample</h1>
								<center>
									<xsl:choose>
										<xsl:when test="$vLANG='FR'"><h3><xsl:value-of select="//dbquery[@id='NSN']/rows/row/@DESCRIPTION_FR"/></h3></xsl:when>
										<xsl:when test="$vLANG='NL'"><h3><xsl:value-of select="//dbquery[@id='NSN']/rows/row/@DESCRIPTION_NL"/></h3></xsl:when>
										<xsl:otherwise></xsl:otherwise>
									</xsl:choose>
									<table border="0" align="center">
										<tbody>
											<xsl:for-each select="//dbquery[@id='NSN']/rows/row">
												<xsl:variable name="xP2"><xsl:value-of select="@NIIN"/></xsl:variable>
												<tr>
													<td colspan="4" align="center">
														<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-1" width="200px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/NOPIC2.png'"/>
													</td>
												</tr>
												<tr>
													<td align="center" width="20%">
														<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-2" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
													</td>
													<td align="center" width="20%">
														<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-3" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
													</td>
													<td align="center" width="20%">
														<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-4" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
													</td>
													<td align="center" width="20%">
														<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-5" width="50px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</center>
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
			...
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
