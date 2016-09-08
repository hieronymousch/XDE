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
<!-- Variable Declaration Classical for KPI Reports -->
<xsl:variable name="vRepDic" select="document('../IL_MR_KPI_SAMPLE01_RepDic.xml')" />
<xsl:variable name="vKPIRepDic" select="document('../IL_MR_KPI_RepDic.xml')" />
								
<!-- For Template XTable/XGraph with Drill-Down -->
<xsl:variable name="dTColHidden">4,6</xsl:variable>
<xsl:variable name="dtSortingCol">0-asc</xsl:variable>

<!-- For This Report -->
<xsl:variable name="vTYPE" select="//dbquery[1]/descriptor/parameters/param[@name='pTYPE']/@value"/>
<xsl:variable name="vSTATUS" select="//dbquery[1]/descriptor/parameters/param[@name='pSTATUS']/@value"/>
<xsl:variable name="vORGANISM" select="//dbquery[1]/descriptor/parameters/param[@name='pORGANISM']/@value"/>
<xsl:variable name="vLATEST_CATEGORY" select="//dbquery[1]/descriptor/parameters/param[@name='pLATEST_CATEGORY']/@value"/>
<xsl:variable name="vR1" select="//dbquery[1]/descriptor/parameters/param[@name='pR1']/@value"/>
<xsl:variable name="vR2" select="//dbquery[1]/descriptor/parameters/param[@name='pR2']/@value"/>
<xsl:variable name="vC1" select="//dbquery[1]/descriptor/parameters/param[@name='pC1']/@value"/>

<xsl:template match='/'>	
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
  	<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
  	<meta charset="utf-8"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  	<meta name="description" content="Bootstrap Sidebar Template for CPN HomePage"/>
  	<meta name="author" content="Ibanez Crescencio"/>
		<head>
			<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
			<xsl:call-template name="Node_Std_Head"/>
			<title>KPI<xsl:value-of select='$vKPI'/> Exploration</title>
		</head>
		
		<body>	
			<!-- Headers and So on -->
			<xsl:call-template name="Body_Start">
				<xsl:with-param name="tRepDic" select="$vRepDic"/> 	<!-- Dictionary ? Type relative Path or No (Default) -->
			</xsl:call-template>
			<!-- KPI Report Start -->
			<!-- This Report is a self Drill-Down Based Report  (contains Main and Drill-Down Blocs) -->
			<!-- Main Bloc visible on report openning  -->
			<xsl:if test="$vMODE='Main'">	
				<xsl:call-template name="Report_NavBar"/>
				
				<!-- Generate Dynamic Tabs for KPI -->
				<xsl:call-template name="Generic_Tab">
					<xsl:with-param name="tTAB_UnId" select="concat('KPIDETREP_',$vKPI,'_',$vVKEYD)"/>
					<xsl:with-param name="tDD_UnId" select="concat('DD_',$vKPI,'_',$vVKEYD)"/>
					<xsl:with-param name="tTabNbr" select="3"/>
					<xsl:with-param name="tRowId" select="'SPE_01_XTAB;SPE_01_XGRAPH;COLLAPSE'"/>
					<xsl:with-param name="tSeparator" select="';'"/>
				</xsl:call-template>	

			</xsl:if>
			
			<!-- Drill-Down Bloc : Dont Use Force Title but RepDic id=KPI_DETAILS -->
			<xsl:variable name="TName">DD_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'KPI_DETAILS'"/>
				<xsl:with-param name="UdTN" select="$TName"/>
				<xsl:with-param name="Show_Empty" select="'N'"/> 
				<xsl:with-param name="dictionary" select="$vRepDic"/>
				<xsl:with-param name="Col_Hidden" select="$dTColHidden"/>
				<xsl:with-param name="Col_Sorting" select="$dtSortingCol"/>
				<xsl:with-param name="Col_Filtering" select="'Y'"/>
				<xsl:with-param name="MaxRecords" select="9999"/>
				<xsl:with-param name="Frame" select="'YO'"/>
				<xsl:with-param name="TableWidth" select="'95%'"/>
				<xsl:with-param name="Detail_Data" select="'Generic'"/> 
			</xsl:call-template>

			<!-- Report Layout Template (Bottom) -->
			<xsl:call-template name="Body_End">
				<xsl:with-param name="tRepDic" select="$vRepDic"/> 	<!-- Dictionary ? Type relative Path or No (Default) -->
			</xsl:call-template>
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
		<xsl:when test="$Detail_Data='SPE_01_XTAB'">
			
			<xsl:variable name="vXMLFileParamName">IL_MR_KPI_SAMPLE01.xml?pLANG=<xsl:value-of select="$vLANG"/></xsl:variable>
			<!-- Determine Which LLOOK Code is associated with values for XTAB -->
			<xsl:variable name="vCodeR1">
				<xsl:choose>
					<xsl:when test="$vR1='TYPE'">C</xsl:when>
					<xsl:when test="$vR1='STATUS'">S</xsl:when>
					<xsl:otherwise>NONE</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="vCodeR2">
				<xsl:choose>
					<xsl:when test="$vR2='TYPE'">C</xsl:when>
					<xsl:when test="$vR2='STATUS'">S</xsl:when>
					<xsl:otherwise>NONE</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="vCodeC1">
				<xsl:choose>
					<xsl:when test="$vC1='TYPE'">C</xsl:when>
					<xsl:when test="$vC1='STATUS'">S</xsl:when>
					<xsl:otherwise>NONE</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<!-- Call Dynamic CrossTab -->
			<xsl:variable name="XTABName">XTAB_SUM_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
			<xsl:call-template name="DynamicXTable">
				<xsl:with-param name="XTable_Name" select="$XTABName"/>
				<xsl:with-param name="vR1" select="$vR1"/>
				<xsl:with-param name="vR2" select="$vR2"/>
				<xsl:with-param name="vC1" select="$vC1"/>
				<xsl:with-param name="vCodeR1" select="$vCodeR1"/>
				<xsl:with-param name="vCodeR2" select="$vCodeR2"/>
				<xsl:with-param name="vCodeC1" select="$vCodeC1"/>
				<xsl:with-param name="DBWEB" select="'KPI_SUMMARY'"/>
				<xsl:with-param name="XMLFileParamName" select="$vXMLFileParamName"/>
				<xsl:with-param name="vKPI" select="$vKPI"/>
				<xsl:with-param name="vVKEYD" select="$vVKEYD"/>
			</xsl:call-template>

		</xsl:when>
		<xsl:when test="$Detail_Data='SPE_01_XGRAPH'">
			<div style="width:100%; height:500px;">
				<xsl:variable name="vXMLFileParamName">IL_MR_KPI_SAMPLE01.xml?pLANG=<xsl:value-of select="$vLANG"/></xsl:variable>
				<!-- Call Dynamic Graph -->
				<xsl:variable name="XGRAPHTName">XGRAPH_SUM_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
				<xsl:call-template name="DynamicGraph">
					<xsl:with-param name="XTable_Name" select="$XGRAPHTName"/>
					<xsl:with-param name="vR1" select="$vR1"/>
					<xsl:with-param name="vR2" select="$vR2"/>
					<xsl:with-param name="vC1" select="$vC1"/>
					<xsl:with-param name="DBWEB" select="'KPI_SUMMARY'"/>
					<xsl:with-param name="XMLFileParamName" select="$vXMLFileParamName"/>
					<xsl:with-param name="vKPI" select="$vKPI"/>
					<xsl:with-param name="vVKEYD" select="$vVKEYD"/>
				</xsl:call-template>				
				<br/>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<!-- No Specfic Content defined -->
			No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<!-- Include FW2 Templates - This is the CPN Core -->
<xsl:include href='../../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>