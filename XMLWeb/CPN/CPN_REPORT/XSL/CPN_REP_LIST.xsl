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
<!-- Variable Declaration Classical for KPI Reports -->
<xsl:variable name="vRepDic" select="document('../../IL_MR_MRN_RepDic.xml')" />
<xsl:variable name="vGenRepDic" select="document('../../../COMMON/IL_MR_RepDic.xml')" />

<!-- For This Report -->
<xsl:variable name="vIDRID" select="//dbquery[1]/descriptor/parameters/param[@name='pIDRID']/@value"/>

<xsl:template match='/'>	
	<xsl:if test="$vMODE='Main'">		
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
			<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1"/>
			<meta name="description" content="Bootstrap Sidebar Template for CPN HomePage"/>
			<meta name="author" content="Ibanez Crescencio"/>
				<head>
					<xsl:call-template name="Node_Std_Head"/>
					<title>
						<xsl:value-of select='$vNodeName'/> Reports List
					</title>
				</head>
				<body>
					<xsl:call-template name="Body_Start"/>
		
					<center>
						<h1>
							<xsl:call-template name="FromDic2Rep">
								<xsl:with-param name="Title2S" select="'PAGE_TITLE_REPORT_LIST'"/>
								<xsl:with-param name="Lang" select="$vLANG"/>
								<xsl:with-param name="dictionary" select="$vRepDic"/>
							</xsl:call-template>
						</h1>
					</center>
					<xsl:variable name="ColHidden">
						<xsl:choose>
							<xsl:when test="$vLANG='FR'">
								4,5,10
							</xsl:when>
							<xsl:when test="$vLANG='NL'">
								3,5,9
							</xsl:when>
							<xsl:otherwise>
								3,4
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="TName">DD_REPORT_LIST</xsl:variable>
					<xsl:call-template name="Generic_Table_DBWEB">
						<xsl:with-param name="DBWEB_Name" select="'REP_LIST'"/>
						<xsl:with-param name="UdTN" select="$TName"/>
						<xsl:with-param name="Show_Empty" select="'N'"/> 
						<xsl:with-param name="Lang" select="$vLANG"/>
						<xsl:with-param name="RepDic" select="'Y'"/> 
						<xsl:with-param name="Col_Hidden" select="$ColHidden"/>
						<xsl:with-param name="Col_Sorting" select="'1-asc'"/>
						<xsl:with-param name="dictionary" select="$vRepDic"/>
						<xsl:with-param name="MaxRecords" select="9999"/>
						<xsl:with-param name="Frame" select="'YO'"/>
						<xsl:with-param name="TableWidth" select="'80%'"/>
						<xsl:with-param name="Detail_Data" select="'Generic'"/>
						<xsl:with-param name="DDURL" select="'CPN_REP_LIST.xml?pIDRID='"/>
					</xsl:call-template>
		
					<xsl:call-template name="Body_End"/>	
				</body>
		<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>		
	</xsl:if>
	<xsl:if test="$vMODE='Drill-Down2'">
		<xsl:variable name="TableNameDD">REP_DETAILS_DD_<xsl:value-of select="$vIDRID"/></xsl:variable>
		<xsl:call-template name="Generic_Table_DBWEB">
			<xsl:with-param name="DBWEB_Name" select="'REP_DETAILS'"/>
			<xsl:with-param name="UdTN" select="$TableNameDD"/>
			<xsl:with-param name="Show_Empty" select="'Y'"/> 
			<xsl:with-param name="Lang" select="$vLANG"/>
			<xsl:with-param name="RepDic" select="'Y'"/> 
			<xsl:with-param name="dictionary" select="$vRepDic"/> 
			<xsl:with-param name="MaxRecords" select="9999"/>
			<xsl:with-param name="Frame" select="'YO'"/> 
			<xsl:with-param name="TableWidth" select="'90%'"/>
			<xsl:with-param name="Detail_Data" select="'SPE_REP_DETAILS_DD'"/>
		</xsl:call-template>
		<xsl:variable name="TableNameDD">REP_VIEWS_DD_<xsl:value-of select="$vIDRID"/></xsl:variable>
		<xsl:call-template name="Generic_Table_DBWEB">
			<xsl:with-param name="DBWEB_Name" select="'REP_VIEWS'"/>
			<xsl:with-param name="UdTN" select="$TableNameDD"/>
			<xsl:with-param name="Show_Empty" select="'N'"/> 
			<xsl:with-param name="MaxRecords" select="9999"/>
			<xsl:with-param name="Frame" select="'YC'"/> 
			<xsl:with-param name="TableWidth" select="'90%'"/>
			<xsl:with-param name="Detail_Data" select="'Generic'"/>
		</xsl:call-template>
		<xsl:variable name="TableNameDD">REP_PARAMS_DD_<xsl:value-of select="$vIDRID"/></xsl:variable>
		<xsl:call-template name="Generic_Table_DBWEB">
			<xsl:with-param name="DBWEB_Name" select="'REP_PARAMS'"/>
			<xsl:with-param name="UdTN" select="$TableNameDD"/>
			<xsl:with-param name="Show_Empty" select="'N'"/> 
			<xsl:with-param name="Lang" select="$vLANG"/>
			<xsl:with-param name="RepDic" select="'Y'"/> 
			<xsl:with-param name="dictionary" select="$vRepDic"/> 
			<xsl:with-param name="MaxRecords" select="9999"/>
			<xsl:with-param name="Frame" select="'YC'"/> 
			<xsl:with-param name="Col_Hidden" select="'0'"/>
			<xsl:with-param name="TableWidth" select="'90%'"/>
			<xsl:with-param name="Detail_Data" select="'Generic'"/>
		</xsl:call-template>
		<xsl:variable name="TableNameDD">REP_KPI_DD_<xsl:value-of select="$vIDRID"/></xsl:variable>
		<xsl:call-template name="Generic_Table_DBWEB">
			<xsl:with-param name="DBWEB_Name" select="'REP_KPI'"/>
			<xsl:with-param name="UdTN" select="$TableNameDD"/>
			<xsl:with-param name="Show_Empty" select="'N'"/> 
			<xsl:with-param name="Lang" select="$vLANG"/>
			<xsl:with-param name="RepDic" select="'Y'"/> 
			<xsl:with-param name="dictionary" select="$vRepDic"/> 
			<xsl:with-param name="MaxRecords" select="9999"/>
			<xsl:with-param name="Frame" select="'YC'"/>
			<xsl:with-param name="TableWidth" select="'90%'"/>
			<xsl:with-param name="Detail_Data" select="'Generic'"/>
		</xsl:call-template>
		<xsl:variable name="TableNameDD">REP_KPI_DATADIC_<xsl:value-of select="$vIDRID"/></xsl:variable>
		<xsl:call-template name="Generic_Table_DBWEB">
			<xsl:with-param name="DBWEB_Name" select="'REP_DD'"/>
			<xsl:with-param name="UdTN" select="$TableNameDD"/>
			<xsl:with-param name="Show_Empty" select="'N'"/> 
			<xsl:with-param name="ForcedTitle" select="'Report Data Dictionary'"/> 
			<xsl:with-param name="Lang" select="$vLANG"/>
			<xsl:with-param name="RepDic" select="'Y'"/> 
			<xsl:with-param name="dictionary" select="$vRepDic"/> 
			<xsl:with-param name="MaxRecords" select="9999"/>
			<xsl:with-param name="Frame" select="'YC'"/>
			<xsl:with-param name="TableWidth" select="'90%'"/>
			<xsl:with-param name="Detail_Data" select="'Generic'"/>
		</xsl:call-template>
	</xsl:if>
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
		<xsl:when test="$Detail_Data='SPE_REP_DETAILS_DD'"> 		<!-- KPI details -->
			<b><h1>Report : <xsl:value-of select="//dbquery[@id='REP_DETAILS']/rows/row/@dbn_rep_name"/></h1></b>
			<table align="center" class='MRNSF'>
				<thead>
					<tr>
						<TH colspan="3">Point Of Contact (POC)</TH>
					</tr>
					<tr>
						<TH>Name</TH>
						<TH>EMail</TH>
					</tr>	
				</thead>
				<xsl:for-each select = "//dbquery[@id='REP_DETAILS']/rows/row">
					<tbody>
						<tr>
							<td align='center'><xsl:value-of select="@dbn_rep_poc"/></td>	
							<td align='center'><xsl:value-of select="@dbn_rep_email"/></td>							
						</tr>
					</tbody>
				</xsl:for-each>
			</table>
			<br/>
			<table align="center" class='MRNSF'>
				<thead>
					<tr>
						<TH width="30%" >Fr</TH>
						<TH width="30%" >Nl</TH>
						<TH width="30%" >En</TH>
					</tr>	
				</thead>
				<xsl:for-each select = "//dbquery[@id='REP_DETAILS']/rows/row">
					<tbody>
						<tr>
							<td align='center'><xsl:value-of select="@dbn_rep_long_desc_fr"/></td>	
							<td align='center'><xsl:value-of select="@dbn_rep_long_desc_nl"/></td>							
							<td align='center'><xsl:value-of select="@dbn_rep_long_desc_en"/></td>							
						</tr>
						<tr>
							<td align='center'><xsl:value-of select="@dbn_rep_remarks_fr"/></td>	
							<td align='center'><xsl:value-of select="@dbn_rep_remarks_nl"/></td>	
							<td align='center'><xsl:value-of select="@dbn_rep_remarks_en"/></td>						
						</tr>
					</tbody>
				</xsl:for-each>
			</table>
		</xsl:when>
		<xsl:otherwise>
			<!-- No Specfic Content defined -->
			No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match="@View_Used" mode="genericTableCel">                  
    <td align="center">
    	<xsl:choose>
			<xsl:when test=".=0"><span class="label label-warning">No Views ?</span></xsl:when>
			<xsl:otherwise><span class="label label-info"><xsl:value-of select="."/></span></xsl:otherwise>
		</xsl:choose>
    </td>
</xsl:template>
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>