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
<xsl:variable name="dTColHidden">0</xsl:variable>
<xsl:variable name="dtSortingCol">7-desc</xsl:variable>
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
				SAMPLE 08
			</title>
		</head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>

			<center>
				<h1>Sample 08</h1>
			</center>		
			
			<br/>
	
			<!-- Début de la partie Tabs - Typiquement du Bootstrap -->
			<div class="container">
				<xsl:attribute name="id">TAB_SAMPLE08</xsl:attribute>
				
				<ul class="nav nav-tabs">
				  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
				  <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
				  <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
				</ul>

				<div class="tab-content">
				  <div id="home" class="tab-pane fade in active">
				    <h3>HOME</h3>
				    <p>Some content.</p>
				  </div>
				  <div id="menu1" class="tab-pane fade">
				    <h3>Menu 1</h3>
				    <p>Some content in menu 1.</p>
				  </div>
				  <div id="menu2" class="tab-pane fade">
				    <h3>Menu 2</h3>
				    <p>Some content in menu 2.</p>
				  </div>
				</div>

				<hr/><hr/>

				<ul class="nav nav-tabs">
				  <li class="active"><a data-toggle="tab" href="#homeA">A/C List</a></li>
				  <li><a data-toggle="tab" href="#menu1A">Syntaxe</a></li>
				  <li><a data-toggle="tab" href="#menu2A"><font color="red">Uncollapse</font></a></li>
				</ul>
				<div class="tab-content">
				  <div id="homeA" class="tab-pane fade in active">
				    <h3>
						<xsl:call-template name="FromDic2Rep">
							<xsl:with-param name="Title2S" select="'TAB01'"/>
						</xsl:call-template>
				    </h3>
				    <p>
				    	<xsl:call-template name="Generic_Table_DBWEB">
							<xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
							<xsl:with-param name="TableWidth" select="'80%'"/>
							<xsl:with-param name="Col_Hidden" select="$dTColHidden"/>
							<xsl:with-param name="Col_Sorting" select="$dtSortingCol"/>
							<xsl:with-param name="MaxRecords" select="30"/>
						</xsl:call-template>
				    </p>
				  </div>
				  <div id="menu1A" class="tab-pane fade">
				    <h3>
				    	<xsl:call-template name="FromDic2Rep">
							<xsl:with-param name="Title2S" select="'TAB02'"/>
						</xsl:call-template></h3>
				    <p>
				    	<h1>Titre Niveau 1</h1>
						<h2>Titre Niveau 2</h2>
						<h3>Titre Niveau 3</h3>
						<center>Centrage</center><br/>
						Texte en <b>gras</b>-<u>souligné</u>-<i>italique</i>-<b><u><i>tout ensemble</i></u></b><br/>
						une image :
						<img border="0px" src="/Default2/CPN/img/Logo/MRN_Prod/logo.png" width="100px" alt="MR Node" style="vertical-align:middle"/>
						<br/>
						une image avec un hyperlien : <a href="http://mrnode.mil.intra"><img border="0px" src="/Default2/CPN/img/Logo/MRN_Prod/logo.png" width="100px" alt="MR Node" style="vertical-align:middle"/></a>
						<br/>
						un Hyperlien de 'texte' : <a href="http://mrnode.mil.intra">Le MR Node</a>
						un tableau basique 
						<table border="1">
							<thead>
								<tr>
									<th>Header 1</th>
									<th>Header 2</th>
									<th>Header 3</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Value 1.1</td>
									<td>Value 1.2</td>
									<td>Value 1.3</td>
								</tr>
								<tr>
									<td>Value 2.1</td>
									<td>Value 2.2</td>
									<td>Value 2.3</td>
								</tr>
							</tbody>
						</table>
					</p>
				  </div>
				  <div id="menu2A" class="tab-pane fade">
				    <h3>
						<b>
							<font color="red">
								<xsl:call-template name="FromDic2Rep">
									<xsl:with-param name="Title2S" select="'TAB_COLLAPSE'"/>
								</xsl:call-template>
							</font>
						</b>
				    </h3>
				    <p>Some content in menu 2.</p>
				  </div>
				</div>
				
				<hr/><hr/>
				
					<xsl:call-template name="Generic_Tab">
						<xsl:with-param name="tTAB_UnId" select="'Sample08'"/> 		<!-- Unique String for Id generation -->
						<xsl:with-param name="tDD_UnId" select="'Other_Sample08'"/> 	<!-- Unique String for Id generation -->
						<xsl:with-param name="tRowId" select="'SPE_01_AA#SPE_01_BB#SPE_01_CC'"/>
						<xsl:with-param name="tTabNbr" select="3"/>
						<!--xsl:with-param name="tTabType" select="'pills'"/--> 		<!-- Tabulation type in Bootstrap tabs/pills -->
						<xsl:with-param name="tWidth" select="8"/> 				<!-- Width For Tab Bloc in Bootstrap 0-12 -->
						<xsl:with-param name="tOffset" select="1"/> 				<!-- Offset For Tab Bloc in Bootstrap 0-12 -->
					</xsl:call-template>
				
				<div class="row"/>
				
				<hr/><hr/>

				<ul class="nav nav-pills">
				  <li class="active"><a data-toggle="pill" href="#homeB">Home</a></li>
				  <li><a data-toggle="pill" href="#menu1B">Menu 1</a></li>
				  <li><a data-toggle="pill" href="#menu2B">Menu 2</a></li>
				</ul>

				<div class="tab-content">
				  <div id="homeB" class="tab-pane fade in active">
				    <h3>HOME</h3>
				    <p>Some content.</p>
				  </div>
				  <div id="menu1B" class="tab-pane fade">
				    <h3>Menu 1</h3>
				    <p>Some content in menu 1.</p>
				  </div>
				  <div id="menu2B" class="tab-pane fade">
				    <h3>Menu 2</h3>
				    <p>Some content in menu 2.</p>
				  </div>
				</div>

				<div class="row"/>
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
		<xsl:when test="$Detail_Data='SPE_01_AA'">
			Text1
		</xsl:when>
		<xsl:when test="$Detail_Data='SPE_01_BB'">
			Text1
		</xsl:when>
		<xsl:when test="$Detail_Data='SPE_01_CC'">
			Text1
		</xsl:when>
		<xsl:otherwise>
			<!-- No Specfic Content defined -->
			No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Include FW2 Templates - This is the CPN Core -->
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
