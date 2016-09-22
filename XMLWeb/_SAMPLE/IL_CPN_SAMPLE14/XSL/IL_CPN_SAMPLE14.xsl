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
<!-- Variable Declaration End -->

<xsl:template match='/'>	
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
		<head>
			<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1"/>
			<meta name="description" content="Sample 15"/>
			<meta name="author" content="Ibanez Crescencio, Drijkoningen Dirk"/>
			<!-- Load Std Head from From CPN + Local (Require include Node_Config.xsl and Report_Components.xsl in Common Folder -->
			<xsl:call-template name="Node_Std_Head"/>
			<!-- Titre 'manuel' de la Page/Onglet -->
			<title>
				SAMPLE 14
			</title>
		</head>
		
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>
			<!-- Cet appel à Template permet de générer le Titre du rapport en fonction de la langue (RepDic) -->
			<center>
				<h1>Sample 14</h1>
						
				<p style="text-align:center;font-weight:bold;font-style:italic;">Demo for Date Picker and Dynamic Drop Down parameters</p>
				<div style="width:90%;display:inline-block;">
					<div style="width:50%;float:left;text-align:left;">
						<strong>Date Picker</strong><br/>
						In table dbn_report_parameters:<br/>
						dbn_repp_param_format = datepicker<br/>
						dbn_repp_param_validation = months or years (empty for default days)<br/>
						dbn_repp_param_mandatory = Y or N
					</div>
					<div style="width:50%;float:left;text-align:left;">
						<strong>Dynamic Drop Down</strong><br/>
						This is a drop down created by a query! This query must create records with 2 fields. A DATA and DISPLAY field. Data will be used as value and Display is the text shown in the drop down.<br/>
						In table dbn_report_parameters:<br/>
						dbn_repp_param_type = Dynamic-Drop-Down<br/>
						dbn_repp_param_type_detail = the queryID to use<br/>
						dbn_repp_param_validation = singleselect or multiselect
					</div>
				</div>
			</center>
			
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
				<xsl:with-param name="UdTN" select="'IL_MR_SAMPLE_14'"/>
				<xsl:with-param name="ForcedTitle" select="'Sample 14 - Date Picker &amp; Dynamic Drop Down'"/>	
				<!-- Ligne permettant de déterminer le lien du Drill-Down. Ce paramètre doit toujours être associé à un SPE_05 avec la clé d'interrogation du paramètre. Ici le nr de Asset ATTENTION le paramètre PLANG est automatiquement ajouté ainsi que pMODE=Drill-Down2, donc ne pas les mentionner -->
				<!--xsl:with-param name="DDURL" select="'../IL_CPN_SAMPLE07/IL_CPN_SAMPLE07.xml?pRID=1007&amp;pFUNCTION='"/-->
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
