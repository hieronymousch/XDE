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
<xsl:variable name="vGR1" select="//dbquery[1]/descriptor/parameters/param[@name='pGR1']/@value"/>
<xsl:variable name="vGR2" select="//dbquery[1]/descriptor/parameters/param[@name='pGR2']/@value"/>
<xsl:variable name="vGC1" select="//dbquery[1]/descriptor/parameters/param[@name='pGC1']/@value"/>
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
	      Effectiveness 
	    </title>
		<script src="/{$vHtDocsConfig}/CPN/extras/Highcharts-4.1.9/js/highcharts.js"></script>
				<script src="/{$vHtDocsConfig}/CPN/extras/Highcharts-4.1.9/js/modules/exporting.js"></script>
		
			<script type="text/javascript">
			$(function () {
				$('#line').highcharts({
					chart: {
						
					},
					title: {
						text: 'Effectiveness for <xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pFUNCTION']/@value"/> and organism <xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pORGANISM']/@value"/> '
					},
					xAxis: {
						categories: [<xsl:for-each select = "//dbquery[@id='SUMMARY']/rows/row/@*[local-name() = 'DATE_FIELD']">
											'<xsl:value-of select='.'/>',
										</xsl:for-each>]
					
					},
					
					yAxis: {
						min: 0,
						title: {
							text: 'Nr of assets'
						},
						stackLabels: {
							enabled: true,
							style: {
								fontWeight: 'bold',
								color: (Highcharts.theme &amp;&amp; Highcharts.theme.textColor) || 'white'
							}
						}
					},
					legend: {
						align: 'right',
						x: -30,
						verticalAlign: 'top',
						y: 25,
						floating: true,
						backgroundColor: (Highcharts.theme &amp;&amp; Highcharts.theme.background2) || 'white',
						borderColor: '#CCC',
						borderWidth: 1,
						shadow: true
					},
					tooltip: {
					shared:true,
						headerFormat: '<b>{point.x}</b><br/>',
									
					
					},
					plotOptions: {
						NIETACTIEF_column: {
							stacking: 'normal',
							dataLabels: {
								enabled: true,
								color: (Highcharts.theme &amp;&amp; Highcharts.theme.dataLabelsColor) || 'white',
								style: {
									textShadow: '0 0 3px black'
								}
							}
						}
					},
					
					series: [
							{
							type:'area',
							color:'#009900',
							name: 'Total Assets',
							data : [
							    <xsl:for-each select = "//dbquery[@id='SUMMARY']/rows/row/@*[local-name() = 'ASSETS_THEO']">
											<xsl:value-of select='.'/>,
										</xsl:for-each>]
							},
							{
							type:'line',
							lineWidth:0,
							color:'#009900',
							name: '<b>#Assets Available</b>',
							data : [
							    <xsl:for-each select = "//dbquery[@id='SUMMARY']/rows/row/@*[local-name() = 'ASSETS_AVAILABLE']">
											<xsl:value-of select='.'/>,
										</xsl:for-each>]
							},
							{
							type:'line',
							name: 'Assets YrAvg Operational',
							data : [
							    <xsl:for-each select = "//dbquery[@id='SUMMARY']/rows/row/@*[local-name() = 'ASSETS_AVG_OPS']">
											<xsl:value-of select='.'/>,
										</xsl:for-each>]
							},
							{
							type:'line',
							name: 'Assets PrevMaint',
							data : [
							    <xsl:for-each select = "//dbquery[@id='SUMMARY']/rows/row/@*[local-name() = 'ASSETS_REAL']">
											<xsl:value-of select='.'/>,
										</xsl:for-each>]}
							,
							{
							type:'line',
							color:'orange',
							name: 'Assets CorrMaint',
							data : [
							    <xsl:for-each select = "//dbquery[@id='SUMMARY']/rows/row/@*[local-name() = 'ASSETS_OPS']">
											<xsl:value-of select='.'/>,
										</xsl:for-each>]},		
							{
							type:'area',
							color: '#FF0000',
							name: 'Assets Planned and in Ops',
							data : [
							    <xsl:for-each select = "//dbquery[@id='SUMMARY']/rows/row/@*[local-name() = 'ASSETS_PLAN']">
											<xsl:value-of select='.'/>,
										</xsl:for-each>]}
										
							]		
				});
			});
		</script>
		
    </head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>
<div class='row'>				
				<div id="line" style="min-width: 310px; height: 700px; margin: 0 auto"/></div>			
				
		
Legend:
<UL>
				<LI>Total assets: number of assets in unit or Defense (filter organism) </LI>
				<LI>Assets YrAvg Operational: average number of assets that is operational (AOSAC O&amp;Q) for a unit of Defense (filter organism) </LI>
				<LI>Assets Prev Maint: Number of assets that haven't got preventive Maint planned for a date. This can be adapted by the MRC and is planning</LI>
				<LI>Assets Corr Maint: Number of assets that aren't getting corrective Maint. Assets in corrective Maint are taken in account when AOSAC impact for the TopAsset in the Work is different from O&amp;Q (so work is considered to resolve an issue that causes the TopAsset to be InOps. End date for corrective Maint is estimaded based on the average immobilisation of all past works for an asset. </LI>
				<LI> Assets Planned and in Ops: number of assets that are permanenty used in Ops (Org Parent 0Z) or are planned in OMIPLA by units</LI>
		</UL>				
			
			
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'SUMMARY'"/>
				<xsl:with-param name="UdTN" select="'TABLE'"/>
				
				<xsl:with-param name="ForcedTitle" select="'Effectiveness data'"/>	
								
			</xsl:call-template>			
					
	      	<xsl:call-template name="Body_End"/>
	    </body>
  	<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
