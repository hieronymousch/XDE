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

<!-- Several Golbal Variables used in CPN are declared in Node_Config (example : vRID,vLANG,vMODE,...) --> 
<!-- Variable Declaration Classical and for THIS Report  -->
<xsl:variable name="vRepDic" select="document('../../SAMPLE_RepDic.xml')" />
<!--
<xsl:variable name="dTColHidden">'NONE'</xsl:variable>
<xsl:variable name="dtSortingCol">1-asc</xsl:variable>
-->
<!-- Récupération de la valeur du Prompt pour utilisation ultérieure -->
<xsl:variable name="vASSET" select="//dbquery[1]/descriptor/parameters/param[@name='pASSET']/@value"/>
<xsl:variable name="vSampleNBR" select="'05'" />
<!-- Variable Declaration End -->

<xsl:template match='/'>	
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
	<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<meta name="description" content="Bootstrap Sidebar Template for CPN HomePage"/>
	<meta name="author" content="Ibanez Crescencio"/>
		<head>
			<!-- Load Std Head from From CPN + Local (Require include Node_Config.xsl and Report_Components.xsl in Common Folder -->
			<xsl:call-template name="Node_Std_Head"/>
			<!-- Titre 'manuel' de la Page/Onglet -->
			<title>
				SAMPLE 05
			</title>
		</head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>

			<center>
				<h1>Sample 05 <small>Asset info on <xsl:value-of select="$vASSET"/></small></h1>
			</center>
			
			<br/>
			
			<center>
				<h2>All Settings for Generic will be applied on all QueryId</h2>
			
				<xsl:for-each select = "//dbquery[contains(@id,'IL_MR_I1G_')]"> <!-- Generic Rest -->
					<h3>Generic based on DBQueryId : <xsl:value-of select="@id"/></h3>
					<xsl:call-template name="Generic_Table_DBWEB">
						<xsl:with-param name="DBWEB_Name" select="@id"/>
						<xsl:with-param name="Show_Empty" select="'N'"/> 
						<xsl:with-param name="MaxRecords" select="9999"/>
						<xsl:with-param name="Frame" select="'YC'"/>
						<xsl:with-param name="TableWidth" select="'95%'"/>
					</xsl:call-template>
				</xsl:for-each>

				<br/><br/><br/>
				
				<h2>All Settings for Generic will be NOT applied on all QueryId</h2>

				<xsl:for-each select = "//dbquery[contains(@id,'IL_MR_I1G_')]"> <!-- Generic Rest -->
					<h3>Generic based on DBQueryId : <xsl:value-of select="@id"/></h3>
					<!-- Définition d'une variable collapse avec un Choose pour définir sa valeur. Cette valeur sera utilisée dans le paramètre Frame -->
					<xsl:variable name="vCollapse">
						<xsl:choose>
							<!-- Si AOSAC alors bloc doit être ouvert -->
							<xsl:when test="@id='IL_MR_I1G_AOSAC'">YO</xsl:when>
							<!-- Dans tous les autres cas visible mais fermé -->
							<xsl:otherwise>YC</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<!-- Utilisation du if pour une condition sans else -->
						<xsl:if test="@id='IL_MR_I1G_FUNCTION'">
							<font color="red">Le bloc fonction est juste en-dessous</font>
						</xsl:if>
					<xsl:call-template name="Generic_Table_DBWEB">
						<xsl:with-param name="DBWEB_Name" select="@id"/>
						<!-- Paramètre utiliser pour donner un nom unique à la variable qui sera utilisée par DataTable. Technique sans passer par une variable -->
						<xsl:with-param name="UdTN" select="concat(@id,'_Ver2')"/>	
						<xsl:with-param name="Show_Empty" select="'N'"/> 
						<xsl:with-param name="MaxRecords" select="9999"/>
						
						<!-- Utilisation de la variable vCollapse -->
						<xsl:with-param name="Frame" select="$vCollapse"/>
						
						<xsl:with-param name="TableWidth" select="'95%'"/>
						<xsl:with-param name="Detail_Data" select="'Generic'"/>
					</xsl:call-template>
				</xsl:for-each>
				
			</center>
			
			<!-- Report Layout Template (Bottom) -->
			<xsl:call-template name="Body_End"/>

		</body>
	<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>
<!-- Include FW2 Templates - This is the CPN Core -->
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>