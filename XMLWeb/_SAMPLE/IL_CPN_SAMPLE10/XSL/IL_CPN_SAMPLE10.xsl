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
<xsl:variable name="vORGANISM" select="//dbquery[1]/descriptor/parameters/param[@name='pORGANISM']/@value"/>
<xsl:variable name="vSTATUS" select="//dbquery[1]/descriptor/parameters/param[@name='pSTATUS']/@value"/>
<xsl:variable name="vR1" select="//dbquery[1]/descriptor/parameters/param[@name='pR1']/@value"/>
<xsl:variable name="vR2" select="//dbquery[1]/descriptor/parameters/param[@name='pR2']/@value"/>
<xsl:variable name="vC1" select="//dbquery[1]/descriptor/parameters/param[@name='pC1']/@value"/>
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
	      SAMPLE 10
	    </title>
    </head>
    
		<body>
			<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>
						
			<!-- Main Bloc - Affiche le Tableau Croisé et l'explication en Drill-Down cette partie n'est pas exécutée -->
			<xsl:if test="$vMODE='Main'">
				<center>
					<h1>Sample 10</h1>
				</center>		
				
				<br/>			
				<div class="col-md-10 col-md-offset-1">
					<!-- La variable permet de définir quel rapport sera appelé pour le Drill-Down. En principe, ce sera le même rapport -->
					<xsl:variable name="vXMLFileParamName">IL_CPN_SAMPLE10.xml?XXX=000</xsl:variable>
					
					<!-- Determine Which LLOOK Code is associated with values for XTAB. L'utilisation du NONE aura pour conséquence de NE pas ACTIVER de mode Pop-Up. Logiquement, il faudra faire cela pour pR1, pR2 et pC1 -->
					<xsl:variable name="vCodeR1">
						<xsl:choose>
							<!-- la valeur AS est ici le code Lookup telle que reprise dans la table mrqr_lookup_code -->
							<xsl:when test="$vR1='STATUS'">AS</xsl:when>
							<xsl:otherwise>NONE</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="vCodeR2">
						<xsl:choose>
							<xsl:when test="$vR2='STATUS'">AS</xsl:when>
							<xsl:otherwise>NONE</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="vCodeC1">
						<xsl:choose>
							<xsl:when test="$vC1='STATUS'">AS</xsl:when>
							<xsl:otherwise>NONE</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<!-- Call Dynamic CrossTab. Ici commence la Génération du XTAB à proprement parlé. -->
					<xsl:call-template name="DynamicXTable">
						<xsl:with-param name="XTable_Name" select="'XTAB_SUM_ASSET'"/>
						<!-- vR1, vR2 et vC1 permettent de savoir quels sont les champs qui seront utilisés pour le Tableau croisé -->
						<xsl:with-param name="vR1" select="$vR1"/>
						<xsl:with-param name="vR2" select="$vR2"/>
						<xsl:with-param name="vC1" select="$vC1"/>
						<!-- vCodeR1, vCodeR2 et vCodeC1 permettent de savoir quels sont les paramètres LLOOK des champs qui seront utilisés pour le Tableau croisé -->
						<xsl:with-param name="vCodeR1" select="$vCodeR1"/>
						<xsl:with-param name="vCodeR2" select="$vCodeR2"/>
						<xsl:with-param name="vCodeC1" select="$vCodeC1"/>
						<!-- Nom du DB Web qui servira de base -->
						<xsl:with-param name="DBWEB" select="'SUMMARY'"/>
						<!-- Appel de la variable qui défini le rapport qui sera utilisé pour le Drill-Down -->
						<xsl:with-param name="XMLFileParamName" select="$vXMLFileParamName"/>
						<!-- Ces paramètres ne sont pas toujours utilisés mais permettront d'avoir une unicité de l'Id du tableau croisé -->
						<xsl:with-param name="vKPI" select="$vKPI"/>
						<xsl:with-param name="vVKEYD" select="$vVKEYD"/>
					</xsl:call-template>
				</div>
				<div class="row"/>
				<!-- Drill-Down Bloc -->
				<div class="col-md-12">
					<xsl:attribute name="id">DD_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:attribute>
				</div>
			</xsl:if>
			
			
			<!-- Drill-Down Bloc -->
			<xsl:if test="$vMODE='Drill-Down'">
				<xsl:variable name="TNameDD">ASSET_DETAILS</xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'DETAILS'"/>
					<xsl:with-param name="UdTN" select="$TNameDD"/>
					<xsl:with-param name="Show_Empty" select="'N'"/> 
					<xsl:with-param name="Col_Hidden" select="'4,6'"/>
					<xsl:with-param name="Col_Total" select="'8'"/>				
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YO'"/>
					<xsl:with-param name="TableWidth" select="'95%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
				</xsl:call-template>
			</xsl:if>
						
			<!-- Report Layout Template (Bottom) -->
	      	<xsl:call-template name="Body_End"/>
	    </body>
    </body>
  	<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>
<!-- Include FW2 Templates - This is the CPN Core -->
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
