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
<xsl:variable name="vRepDic" select="document('../IL_CPN_SAMPLE_RepDic.xml')" />
<!-- On cache les colonne 4,5 et 9. Attention la première colonne est 0 -->
<xsl:variable name="dTColHidden">3,4,8</xsl:variable>
<!-- On force le sorting sur la 2ème colonne en Ascending car la première contient la boule de Drill-Down ... le sorting peut donc être mauvais -->
<xsl:variable name="dtSortingCol">1-asc</xsl:variable>
<xsl:variable name="vSampleNBR" select="'07'" />
<!-- Retrieve Function queried and place it in a variable for UdTN --> 
<xsl:variable name="vFUNCTION" select="//dbquery[1]/descriptor/parameters/param[@name='pFUNCTION']/@value"/>
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
				SAMPLE 07
			</title>
		</head>
		
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>
			
			<!-- Cet appel à Template permet de générer le Titre du rapport en fonction de la langue (RepDic) -->
			<center>
				<h1>Sample 07</h1>
			</center>		
			
			<br/>
			
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
				<!-- Dynamic UdTN because this report will be used in Drill-Down2 in Sample 15 -->
				<xsl:with-param name="UdTN" select="concat('IL_MR_SAMPLE_07',$vFUNCTION)"/>
				<!-- Hide Columns Nbr in dT. Default is 'None' / Example '2,3'. Done via variable declared at beginning of xsl-->
				<xsl:with-param name="Col_Hidden" select="$dTColHidden"/>		
				<!-- Table Sorting on Column Nbr in dT. Default 'None' / Example '1-asc' or '2-desc'. Done via variable declared at beginning of xsl -->				
				<xsl:with-param name="Col_Sorting" select="$dtSortingCol"/>		
				<xsl:with-param name="ForcedTitle" select="'Generic_with_DD2'"/>	
				<!-- Ligne permettant de déterminer le lien du Drill-Down. Ce paramètre doit toujours être associé à un SPE_05 avec la clé d'interrogation du paramètre. Ici le nr de Asset ATTENTION le paramètre PLANG est automatiquement ajouté ainsi que pMODE=Drill-Down2, donc ne pas les mentionner -->
				<xsl:with-param name="DDURL" select="'../IL_CPN_SAMPLE06/IL_CPN_SAMPLE06.xml?pRID=100006&amp;pASSET='"/>
			</xsl:call-template>
			
			<!-- Report Layout Template (Bottom) -->
			<xsl:call-template name="Body_End"/>
		</body>
	<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>
<!-- Include FW2 Templates - This is the CPN Core -->
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
