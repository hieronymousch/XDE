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
	      SAMPLE 15
	    </title>
    </head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>
						
			<!-- Main Bloc - Affiche le Tableau Croisé et l'explication en Drill-Down cette partie n'est pas exécutée -->
			<xsl:if test="$vMODE='Main'">
				<center>
					<h1>Sample 15</h1>
				</center>		
				<div class="col-md-12">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#XTABLE">XTable</a></li>
						<li><a data-toggle="tab" href="#FLOT">Flot Graph</a></li>
						<li><a data-toggle="tab" href="#DHTMLX">DHTMLX Graph</a></li>
						<li><a data-toggle="tab" href="#HIGHCHARTS">HighCharts Graph</a></li>
						<li><a data-toggle="tab" href="#PIVOT">Pivot Table</a></li>
						<li><a data-toggle="tab" href="#UNCOLLAPSE"><font color="red">Uncollapse</font></a></li>
					</ul>
					<div class="tab-content">
					  	<div id="XTABLE" class="tab-pane fade in active">
						    <h3>
								This tab shows Result in XTable
						    </h3>
						    <p>
						    	<xsl:variable name="TNameDD">XTAB_SAMPLE</xsl:variable>
								<xsl:call-template name="Generic_Table_DBWEB">
									<xsl:with-param name="DBWEB_Name" select="'SUMMARY'"/>
									<xsl:with-param name="UdTN" select="$TNameDD"/>
									<xsl:with-param name="Show_Empty" select="'N'"/> 
									<xsl:with-param name="MaxRecords" select="-1"/>
									<xsl:with-param name="ForcedTitle" select="'Summary'"/>
									<xsl:with-param name="Frame" select="'N'"/> 
									<xsl:with-param name="TableWidth" select="'70%'"/>
									<xsl:with-param name="Detail_Data" select="'SPE_01_XTAB_ASS'"/> 
								</xsl:call-template>
						    </p>
					  	</div>
					  	<div id="FLOT" class="tab-pane fade">
						    <h3>
						    	This Tab shows Flot Graph (only Stacked Bar is available).
						    </h3>
						    	<div style="width:100%; height:500px;">
									<br/>
									<xsl:variable name="vXMLFileName">IL_CPN_SAMPLE15.xml</xsl:variable>
									<!-- Determine Which LLOOK Code is associated with values for XTAB -->
									<xsl:variable name="vCodeGR1">
										<xsl:choose>
											<xsl:when test="$vGR1='STATUS'">AS</xsl:when>
											<xsl:otherwise>NONE</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="vCodeGR2">
										<xsl:choose>
											<xsl:when test="$vGR2='STATUS'">AS</xsl:when>
											<xsl:otherwise>NONE</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="vCodeGC1">
										<xsl:choose>
											<xsl:when test="$vGC1='STATUS'">AS</xsl:when>
											<xsl:otherwise>NONE</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!-- Call Dynamic Graph -->
									<xsl:variable name="TNameDD">GRTAB_SAMPLE</xsl:variable>
									<xsl:call-template name="DynamicGraph">
										<xsl:with-param name="XTable_Name" select="$TNameDD"/>
										<xsl:with-param name="vR1" select="$vGR1"/>
										<xsl:with-param name="vR2" select="$vGR2"/>
										<xsl:with-param name="vC1" select="$vGC1"/>
										<xsl:with-param name="vCodeR1" select="$vCodeGR1"/>
										<xsl:with-param name="vCodeR2" select="$vCodeGR2"/>
										<xsl:with-param name="vCodeC1" select="$vCodeGC1"/>
										<xsl:with-param name="DBWEB" select="'SUMMARY'"/>
										<xsl:with-param name="XMLFileName" select="$vXMLFileName"/>
										<xsl:with-param name="vKPI" select="$vKPI"/>
										<xsl:with-param name="vVKEYD" select="$vVKEYD"/>
									</xsl:call-template>
								</div>
					  		</div>
					  	<div id="DHTMLX" class="tab-pane fade">
						    <p>
						    			
						    	<center>
						    		<h1>DHTML Samples</h1>
						    	</center>
									<p>
						    			<ul>
						    				<li>
							    				Advantage : Licence bought by MR C&amp;I. Considered as Std Graph Functionnality
							    			</li>
							    			<li>
							    				Disadvantages : 
							    			</li>
							    			<li>
							    				Limitations : Works not in Tab and Drill-Down Not Available (Will be solved in 1.0.5)
							    			</li>
							    			<li>
							    				Bugs : See Limitation --> <b>Use Sample 16 to see possibilities in DHTMLX</b>
							    			</li>
						    			</ul>
						    		</p>
						    	
						    	
						    	
						    	<xsl:call-template name="DynamicGraph">
									<xsl:with-param name="DBWEB" select="'SUMMARY'"/>
									<xsl:with-param name="tLibrary" select="'DHTMLX'"/>
									<xsl:with-param name="XTable_Name" select="'Sample15_dhtmlx_Tab_00'"/>
									<xsl:with-param name="tview" select="'pie'"/>
									<xsl:with-param name="vR1" select="'FUNCTION'"/>
									<xsl:with-param name="vR2" select="'FUNCTION'"/>
									<xsl:with-param name="vC1" select="'FUNCTION'"/>
									<xsl:with-param name="tVals" select="'NBR'"/>
									<xsl:with-param name="XMLFileName" select="'IL_CPN_SAMPLE15.xml'"/>
									<xsl:with-param name="InTab" select="'YES'"/>
								</xsl:call-template>
								
								<!--ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#DHTMLX0">0</a></li>
									<li><a data-toggle="tab" href="#DHTMLX1">1</a></li>
									<li><a data-toggle="tab" href="#DHTMLX2">2</a></li>
								</ul>
								<div class="tab-content">
								  	<div id="DHTMLX0" class="tab-pane fade in active">
								  		
									</div>
									<div id="DHTMLX1" class="tab-pane fade in">
										d1
									</div>
									<div id="DHTMLX2" class="tab-pane fade in">
										d2
									</div>
								</div-->
						    	
						    </p>
					  	</div>
					  	<div id="HIGHCHARTS" class="tab-pane fade">
						    <p>
						    	<center>
						    		<h1>HighCharts Samples</h1>
						    	</center>
						    		<p>
						    			<ul>
						    				<li>
							    				Advantage : A lot of possibilities
							    			</li>
							    			<li>
							    				Disadvantages : Licence limitation (below). Drill-Down Not Available (1.0.5 ?) 
							    			</li>
							    			<li>
							    				Limitations : cannot be used outside BeDef Network (CDN) for Licence. Use DHTML	
							    			</li>
							    			<li>
							    				Bugs : Export to png 
							    			</li>
						    			</ul>
						    		</p>
						    	<center>
						    		<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#HIGH0">Area</a></li>
										<li><a data-toggle="tab" href="#HIGH1">Line</a></li>
										<li><a data-toggle="tab" href="#HIGH2">Columns</a></li>
									</ul>
									<div class="tab-content">
									  	<div id="HIGH0" class="tab-pane fade in active">
									  		<xsl:call-template name="DynamicGraph">
												<xsl:with-param name="DBWEB" select="'SUMMARY'"/>
												<xsl:with-param name="tLibrary" select="'HighCharts'"/>
												<xsl:with-param name="XTable_Name" select="'Sample15_High_00'"/>
												<xsl:with-param name="tview" select="'area'"/>
												<xsl:with-param name="vR1" select="'ORGANISM'"/>
												<xsl:with-param name="vR2" select="'ORGANISM'"/>
												<xsl:with-param name="vC1" select="'FUNCTION'"/>
												<xsl:with-param name="tVals" select="'NBR'"/>
												<xsl:with-param name="XMLFileName" select="'IL_CPN_SAMPLE15.xml'"/>
												<xsl:with-param name="InTab" select="'YES'"/>
											</xsl:call-template>
											
										</div>
										<div id="HIGH1" class="tab-pane fade in">
											<xsl:call-template name="DynamicGraph">
												<xsl:with-param name="DBWEB" select="'SUMMARY'"/>
												<xsl:with-param name="tLibrary" select="'HighCharts'"/>
												<xsl:with-param name="XTable_Name" select="'Sample15_High_01'"/>
												<xsl:with-param name="tview" select="'line'"/>
												<xsl:with-param name="vR1" select="'ORGANISM'"/>
												<xsl:with-param name="vR2" select="'ORGANISM'"/>
												<xsl:with-param name="vC1" select="'STATUS'"/>
												<xsl:with-param name="tVals" select="'NBR'"/>
												<xsl:with-param name="XMLFileName" select="'IL_CPN_SAMPLE15.xml'"/>
												<xsl:with-param name="InTab" select="'YES'"/>
											</xsl:call-template>
											
										</div>
										<div id="HIGH2" class="tab-pane fade in">
											<xsl:call-template name="DynamicGraph">
												<xsl:with-param name="DBWEB" select="'SUMMARY'"/>
												<xsl:with-param name="tLibrary" select="'HighCharts'"/>
												<xsl:with-param name="XTable_Name" select="'Sample15_High_02'"/>
												<xsl:with-param name="tview" select="'column'"/>
												<xsl:with-param name="vR1" select="'ORGANISM'"/>
												<xsl:with-param name="vR2" select="'ORGANISM'"/>
												<xsl:with-param name="vC1" select="'STATUS'"/>
												<xsl:with-param name="tVals" select="'NBR'"/>
												<xsl:with-param name="XMLFileName" select="'IL_CPN_SAMPLE15.xml'"/>
												<xsl:with-param name="InTab" select="'YES'"/>
											</xsl:call-template>
											
										</div>
									</div>
								</center>
						    </p>
					  	</div>
					  	<div id="PIVOT" class="tab-pane fade">
						    <!-- Bootstrap Positionning -->
						    <div class="col-md-10 col-md-offset-1">
							    <p>
							    	<!-- Creation of a Dynamic Pivot Table -->
							    	<xsl:call-template name="PivotTable">
							    		<xsl:with-param name="tRows" select="'STATUS'"/>
										<xsl:with-param name="tCols" select="'ORGANISM'"/>
										<xsl:with-param name="tAgg" select="'Count'"/>
										<xsl:with-param name="tRender" select="'Table Barchart'"/>
									</xsl:call-template>
							    </p>
							</div>
					  	</div>
					  	<div id="menu2A" class="tab-pane fade">
					    	<p/>
					  	</div>
					</div>
				</div>
			</xsl:if>
			<!-- Force Page Break Layout in BootStrap See Web for more details or remove this line to see effect-->
			<div class="row"/>
			<!-- Drill-Down Bloc -->
			<div>
				<xsl:attribute name="id">DD_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:attribute>
				<!--<xsl:if test="$vMODE='Drill-Down'">-->
					<xsl:call-template name="Generic_Table_DBWEB">
						<xsl:with-param name="DBWEB_Name" select="'DETAILS'"/>
						<xsl:with-param name="UdTN" select="Sample_15_ASSET_DETAILS"/>
						<xsl:with-param name="Show_Empty" select="'N'"/> 
						<xsl:with-param name="ForceFooter" select="'Y'"/>
						<xsl:with-param name="Col_Hidden" select="'4,6'"/>
						<xsl:with-param name="Col_Sorting" select="'None'"/>
						<xsl:with-param name="Col_Filtering" select="'Y'"/>
						<!--xsl:with-param name="Col_Total" select="'13'"/-->				
						<xsl:with-param name="MaxRecords" select="9999"/>
						<xsl:with-param name="Frame" select="'YO'"/>
						<xsl:with-param name="TableWidth" select="'95%'"/>
						<xsl:with-param name="Detail_Data" select="'Generic'"/>
					</xsl:call-template>
				<!--</xsl:if>-->
			</div>
			
			<!-- Report Layout Template (Bottom) -->
	      	<xsl:call-template name="Body_End"/>
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
		<xsl:when test="$Detail_Data='SPE_01_XTAB_ASS'">
			
			<xsl:variable name="vXMLFileName">IL_CPN_SAMPLE15.xml</xsl:variable>
			<!-- Determine Which LLOOK Code is associated with values for XTAB -->
			<xsl:variable name="vCodeR1">
				<xsl:choose>
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
			<!-- Call Dynamic CrossTab -->
			<xsl:variable name="XTABName01">XTAB_SUM_ASSET</xsl:variable>
			<xsl:call-template name="DynamicXTable">
				<xsl:with-param name="XTable_Name" select="$XTABName01"/>
				<xsl:with-param name="vR1" select="$vR1"/>
				<xsl:with-param name="vR2" select="$vR2"/>
				<xsl:with-param name="vC1" select="$vC1"/>
				<xsl:with-param name="vCodeR1" select="$vCodeR1"/>
				<xsl:with-param name="vCodeR2" select="$vCodeR2"/>
				<xsl:with-param name="vCodeC1" select="$vCodeC1"/>
				<xsl:with-param name="DBWEB" select="'SUMMARY'"/>
				<xsl:with-param name="XMLFileName" select="$vXMLFileName"/>
				<xsl:with-param name="vKPI" select="$vKPI"/>
				<xsl:with-param name="vVKEYD" select="$vVKEYD"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<!-- No Specfic Content defined -->
			No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
