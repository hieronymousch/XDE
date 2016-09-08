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
			<title>Sample 04</title>
		</head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>

			<!-- Cet appel à Template permet de générer le Titre du rapport en fonction de la langue (RepDic) -->
			<center>
				<h1>
					<xsl:call-template name="FromDic2Rep">
						<xsl:with-param name="Title2S" select="'REPORT_TITLE'"/>
						<xsl:with-param name="dictionary" select="$vRepDic"/>
					</xsl:call-template>
				</h1>
			</center>		
			
			<br/>
			
				<!-- Generic Sample Nbr 4.1 -->
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
					<xsl:with-param name="dictionary" select="$vRepDic"/>
					<!-- Force Title for DBWeb Repdic because DBWeb name is same for all Bloc Infos -->
					<xsl:with-param name="ForcedTitle" select="'Sample 4.1'"/>
					<!--xsl:with-param name="Col_Total" select="'10'"/-->
					<!-- Unique dT Name (usefull if use several times same DBWEB -->
					<xsl:with-param name="UdTN" select="'SAMPLE4_1'"/>
				</xsl:call-template>	
				<br/>
				
				<!-- Generic Sample Nbr 4.2 -->
				<center>In Sample 4.2 DataDic has been desactivated</center>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
					<!-- Unique Table Name for DataTable construction -->
					<xsl:with-param name="UdTN" select="'SAMPLE04_2'"/>	
					<!-- Force Title for DBWeb Repdic because DBWeb name is same for all Bloc Infos -->
					<xsl:with-param name="ForcedTitle" select="'Sample 4.2'"/>
					<!-- Don't Use Data Dictionnary -->
					<xsl:with-param name="RepDic" select="'N'"/>
					<!-- Block Closed per default value YO (framed Open)** - YC (Framed Close) - ? -->
					<xsl:with-param name="Frame" select="'YC'"/>
					<!-- No Global Filter -->
					<xsl:with-param name="dT_Filter" select="'N'"/>
					<!-- Table Width in % -->
					<xsl:with-param name="TableWidth" select="'65%'"/>
					<!-- Indicate Nbr of records found in DBWEB and add Warning if number is equal to this value (exp Limit in mysql). If no limit use 99999 if no indication use -1 (*).To visualize limit type 50 in this example -->
					<xsl:with-param name="MaxRecords" select="99999"/>
				</xsl:call-template>
			
				<!-- Generic Sample Nbr 4.3 -->
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
					<xsl:with-param name="UdTN" select="'SAMPLE04_3'"/>	
					<!-- Force Title for DBWeb Repdic because DBWeb name is same for all Bloc Infos -->
					<xsl:with-param name="ForcedTitle" select="'Sample 4.3'"/>
					<xsl:with-param name="Frame" select="'YC'"/>
					<xsl:with-param name="TableWidth" select="'75%'"/>
					<xsl:with-param name="MaxRecords" select="50"/>
					<!-- Show block if no rows found in DBWEB (Y* or N)-->
					<xsl:with-param name="Show_Empty" select="'Y'"/>
					<!-- Data Type : Datamart use NRT* (Grey Block Color) for Real Time use RT (blue block color) -->
					<xsl:with-param name="NRT" select="'RT'"/>	
					<!--  Hide Columns but these are search enable. First column is O. In this example col 5=Function is hidden. Multiple values allowed but separated by a comma exp 2,4,7. if columns not exist an error will raised. -->
					<xsl:with-param name="Col_Hidden" select="'5,7'"/>		
					<!-- Column sorting. Only one column is allowed and sorting type must be mentioned. Example '1-asc' or '2-desc'. Per default and if not metionned is column 0 ascending applied -->
					<xsl:with-param name="Col_Sorting" select="'2-desc'"/>
					<!-- Force a Class for Table and Table Details. Default is cell-border another possibilty is display. This Modif requires CSS class entry -->
					<xsl:with-param name="TableClass" select="'display'"/>
					<xsl:with-param name="TableDetClass" select="'cell-border'"/>
				</xsl:call-template>

				<!-- Generic Sample Nbr 4.4 -->
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
					<xsl:with-param name="Lang" select="'NL'"/>
					<xsl:with-param name="UdTN" select="'SAMPLE04_4'"/>	
					<!-- Force Title for DBWeb Repdic because DBWeb name is same for all Bloc Infos -->
					<xsl:with-param name="ForcedTitle" select="'Sample 4.4'"/>
					<xsl:with-param name="Frame" select="'YC'"/>
					<xsl:with-param name="TableWidth" select="'85%'"/>
					<xsl:with-param name="MaxRecords" select="99999"/>
					<xsl:with-param name="Show_Empty" select="'Y'"/>
					<xsl:with-param name="NRT" select="'NRT'"/>	
					<xsl:with-param name="Col_Hidden" select="'5'"/>		
					<xsl:with-param name="Col_Sorting" select="'3-desc'"/>
				</xsl:call-template>

				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'REPDIC'"/>
					<xsl:with-param name="ForcedTitle" select="'Repdic'"/>	
					<xsl:with-param name="Col_Hidden" select="'0'"/>
					<xsl:with-param name="Col_Sorting" select="'5-asc'"/>		
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
