<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>		
<xsl:template match='/'>	
<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
	<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<head>	
		<xsl:call-template name="Node_Std_Head">
			<xsl:with-param name="Node_Conf" select="'MRN_Prod'"/>
		</xsl:call-template>
		<title>
			Input Form
		</title>
		<style>
			body {
				font: "Helvetica Neue", HelveticaNeue, Verdana, Arial, Helvetica, sans-serif;
				margin: 0;
				padding: 0;
				color: #333;
				padding-top:0px; 
				padding-bottom:0px;
			}
		</style>
		<script>
			
		</script>
	</head>
	<body>
		<xsl:variable name="vNode_URL" select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_node_url"/>
		<xsl:variable name="vReport_URL" select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_url"/>
		<center>
			<a href="/"><img src="/{$vHtDocsConfig}/CPN/img/logo/{$vNodeConfig}/Logo.png"/></a>
			<br/>
			<h1>Input Form for Report<br/><small><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_name"/></small></h1>
			<br/>
			<xsl:call-template name="BInputform">
				<xsl:with-param name="tIFLayout" select="'S'"/>
			</xsl:call-template>
			<xsl:if test="$vUseDataModel='Y'">
				<xsl:variable name="TName">Logging_<xsl:value-of select="$vRID"/></xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'Logging'"/>
					<xsl:with-param name="UdTN" select="$TName"/>
					<xsl:with-param name="Show_Empty" select="'N'"/> 
					<xsl:with-param name="Lang" select="$vLANG"/>
					<xsl:with-param name="TableClass" select="'display cell-border'"/> 
					<xsl:with-param name="RepDic" select="'N'"/> 
					<xsl:with-param name="MaxRecords" select="5"/>
					<xsl:with-param name="ForceFooter" select="'N'"/>
					<xsl:with-param name="Col_Filtering" select="'N'"/>
					<xsl:with-param name="Col_Sorting" select="'0-desc'"/>
					<xsl:with-param name="Frame" select="'YC'"/>
					<xsl:with-param name="TableWidth" select="'95%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
				</xsl:call-template>
			</xsl:if>
		</center>
		</body>
	<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>

<xsl:include href='../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../COMMON/Report_Components.xsl'/>
	
</xsl:stylesheet>