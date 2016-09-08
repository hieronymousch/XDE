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
<xsl:variable name="vRepDic" select="document('../../IL_MR_MRN_RepDic.xml')" />
<xsl:variable name="vGenRepDic" select="document('../../../COMMON/IL_MR_RepDic.xml')" />
								
<!-- For This Report -->
<xsl:variable name="vSTATUS" select="//dbquery[1]/descriptor/parameters/param[@name='pSTATUS']/@value"/>
<xsl:variable name="vTABLE" select="//dbquery[1]/descriptor/parameters/param[@name='pTABLE']/@value"/>
<xsl:variable name="vSOURCE" select="//dbquery[1]/descriptor/parameters/param[@name='pSOURCE']/@value"/>
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
      <!-- Load Std Head from From CPN + Local (Require include Node_Config.xsl and Report_Components.xsl in Common Folder -->
      <xsl:call-template name="Node_Std_Head"/>
    </head>
	<title>
		<xsl:value-of select='$vNodeName'/> Status
	</title>
		<body>	
			<!-- Headers and So on -->
			<xsl:if test="$vMODE='Main'">
				<xsl:call-template name="Body_Start">
					<xsl:with-param name="tRepDic" select="$vRepDic"/> 	<!-- Dictionary ? Type relative Path or No (Default) -->
				</xsl:call-template>

			</xsl:if>

			<!-- KPI Report Start -->
			<!-- This Report is a self Drill-Down Based Report  (contains Main and Drill-Down Blocs) -->
			<!-- Main Bloc visible on report openning  -->
			<xsl:if test="$vMODE='Main'">	
				<xsl:call-template name="Report_NavBar"/>
				<center>
					<h1>
						<xsl:call-template name="FromDic2Rep">
							<xsl:with-param name="Title2S" select="'PAGE_TITLE_MRN_STATUS'"/>
							<xsl:with-param name="Lang" select="$vLANG"/>
							<xsl:with-param name="dictionary" select="$vRepDic"/>
						</xsl:call-template>
					</h1>
				</center>
				<div>
					<!-- This Div allows to Hide the complete Report in KPI Dashboard -->
					<xsl:attribute name="id">KPIDETREP<xsl:value-of select='$vKPI'/>_<xsl:value-of select='$vVKEYD'/></xsl:attribute>
					<!-- Based on criteria XTable and XGraph Hidden/in Tab/Table Blocs -->
					<xsl:choose>
						<!-- Explore Mode Yes but few record -->
						<xsl:when test="count(//dbquery[@id='MRN_STATUS_SUMMARY']/rows/row)&lt;=0">	
							<!-- Don't Generate XTable and XGraph -->
						</xsl:when>
						<xsl:otherwise>
							<!-- Début de la partie Tabs -->
							<div class="container">
								<ul class="nav nav-tabs">
								  <li class="active">
								  	<a data-toggle="tab" href="#PanelA">
								  		<xsl:call-template name="FromDic2Rep">
											<xsl:with-param name="Title2S" select="'XTAB_TITLE'"/>
											<xsl:with-param name="Lang" select="$vLANG"/>
											<xsl:with-param name="dictionary" select="$vGenRepDic"/>
										</xsl:call-template>
								  	</a>
								  </li>
								  <li>
								  	<a data-toggle="tab" href="#PanelB">
								  		<xsl:call-template name="FromDic2Rep">
											<xsl:with-param name="Title2S" select="'XGRAPH_TITLE'"/>
											<xsl:with-param name="Lang" select="$vLANG"/>
											<xsl:with-param name="dictionary" select="$vGenRepDic"/>
										</xsl:call-template>
								  	</a>
								  </li>
								  <li>
								  	<a data-toggle="tab" href="#PanelC">
								  		<font color="red">
								  			Uncollapse
								  		</font>
								  	</a>
								  </li>
								</ul>
								<div class="tab-content">
								  <div id="PanelA" class="tab-pane fade in active">
								    <h3>
										<xsl:call-template name="FromDic2Rep">
											<xsl:with-param name="Title2S" select="'XTAB_TITLE'"/>
											<xsl:with-param name="Lang" select="$vLANG"/>
											<xsl:with-param name="dictionary" select="$vGenRepDic"/>
										</xsl:call-template>
								    </h3>
								    <p>
								    	<xsl:variable name="TName">TAB_XTAB_XT_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
										<xsl:apply-templates select="//dbquery[@id='TEMPLATE']/rows">		
											<xsl:with-param name="DBWEB_Name" select="'MRN_STATUS_SUMMARY'"/>
											<xsl:with-param name="UdTN" select="$TName"/>
											<xsl:with-param name="Lang" select="$vLANG"/>
											<xsl:with-param name="RepDic" select="'Y'"/>
											<xsl:with-param name="dictionary" select="$vRepDic"/>								
											<xsl:with-param name="Detail_Data" select="'SPE_01_XTAB'"/> 		
										</xsl:apply-templates>
								    </p>
								  </div>
								  <div id="PanelB" class="tab-pane fade">
								    <h3>
								    	<xsl:call-template name="FromDic2Rep">
											<xsl:with-param name="Title2S" select="'XGRAPH_TITLE'"/>
											<xsl:with-param name="Lang" select="$vLANG"/>
											<xsl:with-param name="dictionary" select="$vGenRepDic"/>
										</xsl:call-template>
									</h3>
								    <p>
								    	<div style="width:100%; height:500px;">
											<xsl:variable name="TName">TAB_XTAB_XG_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
											<xsl:apply-templates select="//dbquery[@id='TEMPLATE']/rows">		
												<xsl:with-param name="DBWEB_Name" select="'MRN_STATUS_SUMMARY'"/>
												<xsl:with-param name="UdTN" select="$TName"/>
												<xsl:with-param name="Lang" select="$vLANG"/>
												<xsl:with-param name="RepDic" select="'Y'"/>
												<xsl:with-param name="dictionary" select="$vRepDic"/>								
												<xsl:with-param name="Detail_Data" select="'SPE_01_XGRAPH'"/> 		
											</xsl:apply-templates>
											<br/>
										</div>
									</p>
								  </div>
								  <div id="PanelC" class="tab-pane fade">
								    <h3>
										<b>
											<font color="red">
												<xsl:call-template name="FromDic2Rep">
													<xsl:with-param name="Title2S" select="'TAB_COLLAPSE'"/>
													<xsl:with-param name="Lang" select="$vLANG"/>
													<xsl:with-param name="dictionary" select="$vGenRepDic"/>
												</xsl:call-template>
											</font>
										</b>
								    </h3>
								    <p></p>
								  </div>
								</div>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Div For Drill-Down Section. Use of this Div with LoadDiv by XTable and XGraph -->
					<center>
						<div>
							<xsl:attribute name="id">DD_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:attribute>
						</div>
					</center>
				</div>
			</xsl:if>
			<xsl:if test="$vMODE='Drill-Down'">
				<!-- Drill-Down Bloc : Dont Use Force Title but RepDic id=KPI_DETAILS -->
				<xsl:variable name="TName">DD_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'MRN_STATUS_DETAILS'"/>
					<xsl:with-param name="UdTN" select="$TName"/>
					<xsl:with-param name="Show_Empty" select="'N'"/> 
					<xsl:with-param name="Lang" select="$vLANG"/>
					<xsl:with-param name="RepDic" select="'Y'"/> 
					<xsl:with-param name="dictionary" select="$vRepDic"/>
					<xsl:with-param name="Col_Sorting" select="'2-asc'"/>
					<xsl:with-param name="Col_Hidden" select="'9'"/>
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YO'"/>
					<xsl:with-param name="TableWidth" select="'90%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
					<xsl:with-param name="DDURL" select="'CPN_STATUS.xml?pTABLE='"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="$vMODE='Drill-Down2'">
				<xsl:variable name="TableNameDD">STATUS_INDEXES_DD_<xsl:value-of select="$vTABLE"/></xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'STATUS_INDEXES_DETAILS'"/>
					<xsl:with-param name="UdTN" select="$TableNameDD"/>
					<xsl:with-param name="Show_Empty" select="'Y'"/> 
					<xsl:with-param name="Lang" select="$vLANG"/>
					<xsl:with-param name="RepDic" select="'Y'"/> 
					<xsl:with-param name="dictionary" select="$vRepDic"/> 
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YC'"/> 
					<xsl:with-param name="Col_Hidden" select="'2,6,7'"/>
					<xsl:with-param name="TableWidth" select="'90%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
				</xsl:call-template>
				<xsl:variable name="TableNameDD">STATUS_FIELDS_MR_DD_<xsl:value-of select="$vTABLE"/></xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'FIELDS_MR'"/>
					<xsl:with-param name="UdTN" select="$TableNameDD"/>
					<xsl:with-param name="Show_Empty" select="'Y'"/> 
					<xsl:with-param name="Lang" select="$vLANG"/>
					<xsl:with-param name="RepDic" select="'Y'"/> 
					<xsl:with-param name="dictionary" select="$vRepDic"/> 
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YC'"/> 
					<xsl:with-param name="TableWidth" select="'90%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
				</xsl:call-template>
				<xsl:variable name="TableNameDD">STATUS_LISTREPORT_DD_<xsl:value-of select="$vTABLE"/></xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'REPORT'"/>
					<xsl:with-param name="UdTN" select="$TableNameDD"/>
					<xsl:with-param name="Show_Empty" select="'Y'"/> 
					<xsl:with-param name="Lang" select="$vLANG"/>
					<xsl:with-param name="RepDic" select="'Y'"/> 
					<xsl:with-param name="dictionary" select="$vRepDic"/> 
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YC'"/> 
					<xsl:with-param name="TableWidth" select="'90%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
				</xsl:call-template>
			</xsl:if>
			<!-- Report Layout Template (Bottom) -->
		    <xsl:call-template name="Body_End">
		        <xsl:with-param name="tRepDic" select="$vRepDic"/>  <!-- Dictionary ? Type relative Path or No (Default) -->
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
			
			<xsl:variable name="vXMLFileParamName">CPN_STATUS.xml?pLANG=<xsl:value-of select="$vLANG"/></xsl:variable>
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
				<xsl:with-param name="DBWEB" select="'MRN_STATUS_SUMMARY'"/>
				<xsl:with-param name="XMLFileParamName" select="$vXMLFileParamName"/>
				<xsl:with-param name="vKPI" select="$vKPI"/>
				<xsl:with-param name="vVKEYD" select="$vVKEYD"/>
			</xsl:call-template>

		</xsl:when>
		<xsl:when test="$Detail_Data='SPE_01_XGRAPH'">
			<div style="width:100%; height:500px;">
				<xsl:variable name="vXMLFileParamName">MRN_REP_LIST.xml?pLANG=<xsl:value-of select="$vLANG"/></xsl:variable>
				<!-- Call Dynamic Graph -->
				<xsl:variable name="XGRAPHTName">XGRAPH_SUM_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
				<xsl:call-template name="DynamicGraph">
					<xsl:with-param name="XTable_Name" select="$XGRAPHTName"/>
					<xsl:with-param name="vR1" select="$vR1"/>
					<xsl:with-param name="vR2" select="$vR2"/>
					<xsl:with-param name="vC1" select="$vC1"/>
					<xsl:with-param name="DBWEB" select="'MRN_STATUS_SUMMARY'"/>
					<xsl:with-param name="XMLFileParamName" select="$vXMLFileParamName"/>
					<xsl:with-param name="vKPI" select="$vKPI"/>
					<xsl:with-param name="vVKEYD" select="$vVKEYD"/>
				</xsl:call-template>				
				<br/>
			</div>
		</xsl:when>
		<xsl:when test="$Detail_Data='SPE_REPORT_LIST'"> 		<!-- KPI details -->
			<xsl:variable name="UniqdTN">MRN_LIST</xsl:variable>
			<xsl:variable name="TableClass">display</xsl:variable>
			<xsl:variable name="TableClass" select="//dbquery[1]/descriptor/parameters/param[@name='pSUMMARY']/@value"/>

			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<xsl:attribute name="id">dT_<xsl:value-of select="$UniqdTN"/></xsl:attribute>
				<xsl:attribute name="class"><xsl:value-of select="$TableClass"/></xsl:attribute>
				<thead>			
					<tr>
						<xsl:for-each select = "//dbquery[@id='MRN_STATUS_DETAILS']/rows/row[1]">
							<th width="5%">
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'DD'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th width="5%">
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'DB'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th>
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'alias'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th>
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'name'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th  width="5%">
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'Ref_Status'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
						</xsl:for-each>						
					</tr>
				</thead>						
				<tbody>
					<xsl:for-each select = "//dbquery[@id='MRN_STATUS_DETAILS']/rows/row">
						<tr>
							<td align='Left'>
								<xsl:variable name="DDValue">MRN_SPE05#TAB01_<xsl:value-of select="@dbn_rep_id"/>#<xsl:value-of select="@dbn_rep_id"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$DDValue"/>
								</xsl:call-template>
							</td>							
							<td align='left'>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="@DB"/>
								</xsl:call-template>
							</td>
							<td align='left'>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="@alias"/>
								</xsl:call-template>
							</td>
							<td align='left'>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="@name"/>
								</xsl:call-template>
							</td>
							<td align='center'>
								<xsl:choose>
									<xsl:when test="@STATUS='OK'">
										<xsl:element name='img'>
											<xsl:attribute name='src'>/Default2/MRN_Prod/img/RepOK.png</xsl:attribute>
											<xsl:attribute name='width'>17px</xsl:attribute>
											<xsl:attribute name='alt'>All Extractions used are Up-To-Date</xsl:attribute>
											<xsl:attribute name='style'>vertical-align:middle</xsl:attribute>
											<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP2/DBN_POPUP_Rep_Status_Extrac.xml?repid=<xsl:value-of select="@dbn_rep_id"/>&amp;XXX='+Math.floor(Math.random()*1001),500);</xsl:attribute>
											<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
											<font size="1" color="white">O</font>
										</xsl:element>
									</xsl:when>
									<xsl:when test="@STATUS='Not OK'">
										<xsl:element name='img'>
											<xsl:attribute name='src'>/Default2/MRN_Prod/img/RepNOK.png</xsl:attribute>
											<xsl:attribute name='width'>17px</xsl:attribute>
											<xsl:attribute name='alt'>All Extractions used are Not Up-To-Date</xsl:attribute>
											<xsl:attribute name='style'>vertical-align:middle</xsl:attribute>
											<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP2/DBN_POPUP_Rep_Status_Extrac.xml?repid=<xsl:value-of select="@dbn_rep_id"/>&amp;XXX='+Math.floor(Math.random()*1001),500);</xsl:attribute>
											<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
											<font size="1" color="white">N</font>
										</xsl:element>	
									</xsl:when>
									<xsl:otherwise>
										<xsl:element name='img'>
											<xsl:attribute name='src'>/Default2/MRN_Prod/img/RepUNK.png</xsl:attribute>
											<xsl:attribute name='width'>17px</xsl:attribute>
											<xsl:attribute name='alt'>All Extractions used are Not Up-To-Date</xsl:attribute>
											<xsl:attribute name='style'>vertical-align:middle</xsl:attribute>
											<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP2/DBN_POPUP_Rep_Status_Extrac.xml?repid=<xsl:value-of select="@dbn_rep_id"/>&amp;XXX='+Math.floor(Math.random()*1001),500);</xsl:attribute>
											<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
											<font size="1" color="white">U</font>
										</xsl:element>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
				<xsl:if test="count(//dbquery[@id='MRN_STATUS_DETAILS']/rows/row)>=20">
					<tfoot>			
						<tr>
							<xsl:for-each select = "//dbquery[@id=$DBWEB_Name]/rows/row[1]">
							<th width="5%">
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'DD'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th width="5%">
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'DB'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th>
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'alias'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th>
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'name'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							<th  width="5%">
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'STATUS'"/>
									<xsl:with-param name="Lang" select="$Lang"/>
									<xsl:with-param name="dictionary" select="$dictionary"/>
								</xsl:call-template>
							</th>
							</xsl:for-each>								
						</tr>
					</tfoot>
				</xsl:if>
			</table>
			<!-- Call Template 2 Transform Table in DataTable -->
			<xsl:variable name="ColHidden">2,3</xsl:variable>
			<xsl:variable name="SortingCol">3-asc</xsl:variable>

			<xsl:call-template name="Node_Std_Table">
				<xsl:with-param name="Table_Name" select="'MRN_LIST'"/>
				<xsl:with-param name="Records" select="count(//dbquery[@id='MRN_STATUS_DETAILS']/rows/row)"/>
				<xsl:with-param name="Node_Conf" select="$Node_Conf"/>
				
				<xsl:with-param name="Col_Hidden" select="$ColHidden"/>
				<xsl:with-param name="Col_Sorting" select="$SortingCol"/>
				
				<xsl:with-param name="dT_Type" select="'99'"/>
				
				<xsl:with-param name="DDURL" select="concat('MRN_REP_LIST.xml?pLANG=',$Lang,'&amp;pMODE=Drill-Down2&amp;pIDRID=')"/>
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