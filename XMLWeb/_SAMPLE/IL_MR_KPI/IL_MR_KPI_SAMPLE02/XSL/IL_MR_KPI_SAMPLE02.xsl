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
<xsl:variable name="vKPIRepDic" select="document('../IL_MR_KPI_RepDic.xml')" />
<!-- Fin Declaration des variables -->
<xsl:template match='/'>	
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
  	<meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
  	<meta charset="utf-8"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  	<meta name="description" content="Bootstrap Sidebar Template for CPN HomePage"/>
  	<meta name="author" content="Ibanez Crescencio"/>
		<head>
			<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
			<xsl:call-template name="Node_Std_Head"/>
			<title>KPI<xsl:value-of select='$vKPI'/> Exploration</title>
		</head>
		<body>	
			<!-- Headers and So on -->
			<xsl:call-template name="Body_Start"/>
			<!-- KPI Report Start -->
			<!-- Main Bloc -->
			<xsl:if test="$vMODE='Main'">
				<xsl:variable name="TNameDD">ASSETS_ORG_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'ASSETS'"/>
					<xsl:with-param name="UdTN" select="$TNameDD"/>
					<xsl:with-param name="Show_Empty" select="'N'"/> 
					<xsl:with-param name="RepDic" select="'Y'"/> 
					<xsl:with-param name="Col_Hidden" select="'1,3,5,7,8,17'"/>
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="ForcedTitle" select="'Assets in Organism'"/>
					<xsl:with-param name="Frame" select="'YO'"/> 
					<xsl:with-param name="ForceFooter" select="'Y'"/>
					<xsl:with-param name="Col_Filtering" select="'Y'"/>
					<xsl:with-param name="TableWidth" select="'90%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/> 
				</xsl:call-template>
			</xsl:if>
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
	<xsl:param name="tPD1"/>
	<xsl:param name="tPD2"/>
	<xsl:param name="tPD3"/>
	<xsl:param name="tPD4"/>
	
	<xsl:choose>
		
		<xsl:when test="$Detail_Data='TBD'">
			<center>
					<form target="Roaddoc" action="http://mrnode.mil.intra/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF_DOC_GEN/IL_MR_DG_ROADDOC/IL_MR_DG_ROADDOC.xml">
					   <input type="hidden" name="pRID" value="172"/>
					   <input type="hidden" name="pLANG" value="FR"/>
					   
					   Tasked Unit: 
					   <input type="text" size="5" name="pORG">
					   	<xsl:attribute name="value"><xsl:value-of select='$vVKEYD'/></xsl:attribute>
					   </input>

					   <input type="hidden" name="pASSET" value=""/>
					   MTO: <input type="text" name="pMTO" value=""/>
					   Tpt Resp: <input type="text" name="pTPTResp" value=""/>
					   Annex: <input type="text" size="1" name="pANNEX" value="N"/>
					   Mission: <textarea  rows="2" cols="50" id="Pdf4MISSION" name="pMISSION"  value=""/>
					   <input type="submit" value="Generate Road Doc"/>
					</form> 
				</center>
		</xsl:when>
		<xsl:when test="$Detail_Data='REM_POT'">
			<small>
				<table align="center" class="display">
					<xsl:for-each select="//dbquery[@id='ASSET_REM_POT']/rows/row[(@meter='CD' or @meter='KM') and @TOP_ASSET=$tPD1]">
						<tr>
							<td><xsl:value-of select="@meter"/></td>
							<xsl:choose>
								<xsl:when test="position() = 1 and substring(@REM_POT,1,1)='-'">
									<td bgcolor="#F36100" align='center' width="30%"><b><xsl:value-of select="replace(@REM_POT,',','')"/></b></td>
								</xsl:when>
								<xsl:when test="position() = 1 and substring(@REM_POT,1,1)!='-'">
									<td bgcolor="#ACC742" align='center' width="30%"><b><xsl:value-of select="replace(@REM_POT,',','')"/></b></td>
								</xsl:when>
								<xsl:otherwise>
									<td align='center' width="30%"><xsl:value-of select="replace(@REM_POT,',','')"/></td>
								</xsl:otherwise>
							</xsl:choose>
							<td><xsl:value-of select="@PPM"/></td>
							<td>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="concat('MRN_SPE01#WPPM&amp;arg1=',@PPM)"/>
								</xsl:call-template>
							</td>
							<td>TOLERANCE: <xsl:value-of select="@TOLERANCE"/></td>
						</tr>
					</xsl:for-each>
				</table>
			</small>
		</xsl:when>
		<xsl:otherwise>
			<!-- No Specfic Content defined -->
			No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<!-- Include FW2 Templates - This is the CPN Core -->
<xsl:include href='../../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>