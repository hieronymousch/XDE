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
<xsl:variable name="dT_Type" select="'99'"/>
<xsl:variable name="vRepDic" select="document('../fuel_consom_RepDic.xml')" />

<xsl:variable name="vYear" select='//dbquery[1]/descriptor/parameters/param[@name="pYear"]/@value'/>
<xsl:variable name="vOrganism" select='//dbquery[1]/descriptor/parameters/param[@name="pORGANISM"]/@value'/>
<xsl:variable name="vTreshold" select='//dbquery[1]/descriptor/parameters/param[@name="pTreshold"]/@value'/>

<!-- Variable Declaration End -->
<xsl:template match='/'>	
	<!-- Generate HTML5 WebPage -->
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text> 
	<!-- Par défaut, IE utilise le mode de compatibilité - Ici on désactive ce compatibility mode pour IE 9 et 10 -->
	<meta http-equiv="x-ua-compatible" content="IE=edge"/>
	<html>
		<head>
		
			<script src="http://localhost/Default2/MRN_Prod/js/jquery.js"></script>
			<script src="http://code.highcharts.com/highcharts.js"></script>
			
			<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
			<xsl:call-template name="Node_Std_Head">
				<xsl:with-param name="Node_Conf" select="$RepConf"/>
			</xsl:call-template>
				
		<!-- 2. Add the JavaScript to initialize the chart on document ready -->
		<script type="text/javascript">
		$(document).ready(function() {
			var options = {
				chart: {
					renderTo: 'container',
					type: 'column'
				},
				title: {
					text: 'Fuel consumption for <xsl:value-of select="$vOrganism"/> in <xsl:value-of select="$vYear"/> for WSC by month &gt;<xsl:value-of select="$vTreshold"/>L'
				},
				xAxis: {
					categories: []
				},
				yAxis: {
					title: {
						text: 'Litres'
					}
				},
				series: []
			};
			
			// Load the data from the XML file 
			
			$.get('http://localhost/LRF/XMLWeb/ProcessDescriptor/descriptor/MT/fuel_consom.xml?pYear=<xsl:value-of select="$vYear"/>&amp;pORGANISM=<xsl:value-of select="$vOrganism"/>&amp;pTreshold=<xsl:value-of select="$vTreshold"/>', function(xml) {
				
				// Split the lines
				var $xml = $(xml);
				
				// push categories
				$xml.find('categories item').each(function(i, category) {
					options.xAxis.categories.push($(category).text());
				});
				
				// push series
				$xml.find('series').each(function(i, series) {
					var seriesOptions = {
						name: $(series).find('name').text(),
						data: []
					};
					
					// push data points
					$(series).find('data point').each(function(i, point) {
						seriesOptions.data.push(
							parseInt($(point).text())
						);
					});
					
					// add it to the options
					options.series.push(seriesOptions);
				});
				var chart = new Highcharts.Chart(options);
			});
		});
		</script>
		
		</head>
		<!-- Nom de la page web généré via le DataDic -->
		<title>
			<xsl:call-template name="FromDic2Rep">
				<xsl:with-param name="Title2S" select="'REPORT_TITLE_MAIN'"/>
				<xsl:with-param name="Lang" select="$vLANG"/>
				<xsl:with-param name="dictionary" select="$vRepDic"/>
			</xsl:call-template>
		</title>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start">
				<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
				<xsl:with-param name="tRepDic" select="$vRepDic"/> 	<!-- Dictionary ? Type relative Path or No (Default) -->
				<xsl:with-param name="tLocal" select="'YES'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
				<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
			</xsl:call-template>
		
			<!-- Cet appel à Template permet de générer le Titre du rapport en fonction de la langue (RepDic) -->
			<center>
				<h1>
					<xsl:call-template name="FromDic2Rep">
						<xsl:with-param name="Title2S" select="'REPORT_TITLE_MAIN'"/>
						<xsl:with-param name="Lang" select="$vLANG"/>
						<xsl:with-param name="dictionary" select="$vRepDic"/>
					</xsl:call-template> 

					<xsl:call-template name="FromDic2Rep">
						<xsl:with-param name="Title2S" select="'REPORT_EXPLAIN'"/>
						<xsl:with-param name="Lang" select="$vLANG"/>
						<xsl:with-param name="dictionary" select="$vRepDic"/>
					</xsl:call-template>
				</h1>
			</center>		
						
			<!-- Report Layout Template (Bottom) -->
			<xsl:call-template name="Body_End">
				<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
				<xsl:with-param name="tRepDic" select="$vRepDic"/> 	<!-- Dictionary ? Type relative Path or No (Default) -->
				<xsl:with-param name="tLocal" select="'YES'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
				<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
			</xsl:call-template>
			
			<!-- 3. Add the container -->
			<div id="container" style="width: 90%; height: 80%; margin: 0 auto"></div>			
		</body>
	</html>
</xsl:template>

<xsl:include href='../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
