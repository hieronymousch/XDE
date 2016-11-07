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
<!-- END : Use this to avoid error illegal characters html --> 	

<!-- Variables vVKEYD,vRID,vKPI,vLANG,vMODE,vEXPLORE already Declared in Report_Components --> 
<!-- Variable Declaration Classical  -->
<xsl:variable name="RepConf" select="'MRN_Prod'"/>
<xsl:variable name="vRepDic" select="document('../IL_MR_SAMPLE_RepDic.xml')" />
<xsl:variable name="dtSortingCol">1-asc</xsl:variable>
<!--
<xsl:variable name="dTColHidden">'NONE'</xsl:variable>
<xsl:variable name="dtSortingCol">1-asc</xsl:variable>
-->
<xsl:variable name="dT_Type" select="'99'"/>
<xsl:variable name="vSampleNBR" select="'03'" />
<!-- Variable Declaration End -->

<xsl:template match='/'>	
<!-- Generate HTML5 WebPage -->
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text> 
	<!-- Par défaut, IE utilise le mode de compatibilité - Ici on désactive ce compatibility mode pour IE 9 et 10 -->
	<meta http-equiv="x-ua-compatible" content="IE=edge"/>
	<html>
		<head>
			<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
			<xsl:call-template name="Node_Std_Head">
				<xsl:with-param name="Node_Conf" select="$RepConf"/>
			</xsl:call-template>
			<title>Products with SDS</title>
		</head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start">
				<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
				<xsl:with-param name="tRepDic" select="$vRepDic"/> 	<!-- Dictionary ? Type relative Path or No (Default) -->
				<xsl:with-param name="tLocal" select="'YES'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
				<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
			</xsl:call-template>

			<!-- Ce xsl:if permet de controler si l'extraction MRQR_ASSETS est présente et affiche un message dans le cas contraire -->
			<xsl:if test="count(//dbquery[@id='IL_MR_PRODUCTS']/rows/row)=0">
				<center>
					<h2>This Report Requires the MRQR documents Extraction in your Local DB Node.</h2>
				</center>
			</xsl:if>

			<!-- Cet appel à Template permet de générer un Div montrant les objectifs du rapport en fonction de la langue. Ces objectifs sont repris dans le RepDic 
			<xsl:call-template name="RepObjective_InfoBox">
				<xsl:with-param name="Title2S" select="concat('REPORT',$vSampleNBR,'_TITLE')"/>
				<xsl:with-param name="Lang" select="$vLANG"/>
				<xsl:with-param name="dictionary" select="$vRepDic"/>
			</xsl:call-template> -->
			
			<!-- Cet appel à Template permet de générer le Titre du rapport en fonction de la langue (RepDic) 
			<center>
				<h1>
					<xsl:call-template name="FromDic2Rep">
						<xsl:with-param name="Title2S" select="concat('REPORT',$vSampleNBR,'_TITLE')"/>
						<xsl:with-param name="Lang" select="$vLANG"/>
						<xsl:with-param name="dictionary" select="$vRepDic"/>
					</xsl:call-template>
				</h1>
			</center>		-->
			<center> 
				<h1>Products with SDS</h1>
			</center>	
			
			<br/>
			
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_PRODUCTS'"/>
				<xsl:with-param name="UdTN" select="'IL_MR_PRODUCTS'"/>
				<xsl:with-param name="Node_Conf" select="$RepConf"/>
				<xsl:with-param name="dT_Type" select="'99'"/>
				<xsl:with-param name="Lang" select="$vLANG"/>
				<xsl:with-param name="RepDic" select="'N'"/> 
				<xsl:with-param name="dictionary" select="$vRepDic"/> 	
				<xsl:with-param name="ForcedTitle" select="'MSDS'"/>	
				<xsl:with-param name="DDURL" select="'../IL_MR_PRODUCTS/IL_MR_PRODUCTS_STOCK.xml?Mode=Drill-Down&amp;pNSN='"/>
			</xsl:call-template>
			
			<!-- Report Layout Template (Bottom) -->
			<xsl:call-template name="Body_End">
				<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
				<xsl:with-param name="tRepDic" select="$vRepDic"/> 	<!-- Dictionary ? Type relative Path or No (Default) -->
				<xsl:with-param name="tLocal" select="'YES'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
				<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
			</xsl:call-template>
		</body>
	</html>
</xsl:template>
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
