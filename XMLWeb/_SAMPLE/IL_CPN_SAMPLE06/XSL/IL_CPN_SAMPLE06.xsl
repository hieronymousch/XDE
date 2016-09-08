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
<xsl:variable name="vASSET" select="//dbquery[1]/descriptor/parameters/param[@name='pASSET']/@value"/>
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
				SAMPLE 06
			</title>
		</head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>

			<!-- Cet appel à Template permet de générer le Titre du rapport en fonction de la langue (RepDic) -->
			<center>
				<h1>Sample 06</h1>
			</center>		
			<br/>	

			<!-- DG Block - Specific Layout NOT GENERIC -->
			<xsl:call-template name="Generic_Table_DBWEB">					
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_I1_ASSET_DG'"/>
				<xsl:with-param name="UdTN" select="concat('IL_MR_I1_ASSET_DG_',$vASSET)"/>	
				<xsl:with-param name="Show_Empty" select="'N'"/>
				<xsl:with-param name="ForcedTitle" select="'This Asset is considered as Dangerous Goods'"/>
				<xsl:with-param name="TableWidth" select="'95%'"/>
				<xsl:with-param name="Frame" select="'YC'"/>
				<!-- call Specific Layout in Template row (fin du xsl) -->
				<xsl:with-param name="Detail_Data" select="'SPE_I1_DG'"/>
			</xsl:call-template>			
			<!-- ID ASSET - ASSET Main NOT GENERIC -->
			<xsl:call-template name="Generic_Table_DBWEB"> 					
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_I1_ASSETA'"/>
				<xsl:with-param name="UdTN" select="concat('IL_MR_I1_ASSET_ID_BLOCK_',$vASSET)"/>	
				<xsl:with-param name="Show_Empty" select="'N'"/>
				<!-- Ici on ne frame pas le résultat. Il sera donc toujours visible si rempli et non collapsable -->
				<xsl:with-param name="Frame" select="'N'"/>
				<xsl:with-param name="TableWidth" select="'95%'"/>
				<!-- call Specific Layout in Template row (fin du xsl) -->
				<xsl:with-param name="Detail_Data" select="'SPE_I1_ASSETA_INFOS'"/>
			</xsl:call-template>
			<br/>
			<!-- Traitement générique des DBWeb commencant par IL_MR_I1G_ -->
			<xsl:for-each select = "//dbquery[contains(@id,'IL_MR_I1G_')]"> 
				<!--<xsl:value-of select="@id"/><br/>-->
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="@id"/>
					<xsl:with-param name="UdTN" select="concat(@id,'_',$vASSET)"/>	
					<xsl:with-param name="Show_Empty" select="'N'"/> 
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YC'"/>
					<xsl:with-param name="TableWidth" select="'95%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
				</xsl:call-template>
			</xsl:for-each>
			
			<!-- Report Layout Template (Bottom) -->
			<xsl:call-template name="Body_End"/>
		</body>
	<xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>
<!-- C'est dans ce template que l'on va définir les layouts particuliers. Notez l'emplacement (après le template principal et avant les include) -->
<xsl:template match="row">
	<!-- Les paramètres sont passé depuis le template générique défini plus haut -->
	<xsl:param name="DBWEB_Name"/>						<!-- Mandatory : DBWeb Query Name -->
	<xsl:param name="Node_Conf"/>						<!-- Mandatory default N -->
	<xsl:param name="dT_Type" select="'99'"/>			<!-- Not mandatory default N -->
	<xsl:param name="RepDic" select="'Y'"/>				<!-- Not mandatory default N -->
	<xsl:param name="Lang" select="$vLANG"/>				<!-- Not mandatory default EN -->
	<xsl:param name="dictionary"/> 						<!-- Mandatory if RepDic is Y -->
	<xsl:param name="Detail_Data"/>
	<xsl:choose>
		<!-- DG Block - Specific Layout For Dangerous Goods -->
		<xsl:when test="$Detail_Data='SPE_I1_DG'">
			<center>
				<table border="0" class="display" align="center"  width="95%" >
					<thead class="MRHead">
						<th align="left"  width="5%"></th>
						<TH colspan="6" width="100%"><big><big><font COLOR="red">Dangerous Goods</font></big></big></TH>
					</thead>
				</table>
				<table width="80%">
					<tbody>
						<xsl:for-each select="//dbquery[@id='IL_MR_I1_ASSET_DG']/rows/row">
							<tr>
								<td width="30%" align="left"><big><big>UN Code :<xsl:text>  </xsl:text><xsl:value-of select="@un_code"/></big></big></td>
								<td width="20%" align="left"><xsl:value-of select="@UNCD"/></td>
								<td width="20%" align="left"><xsl:value-of select="@UNCDF"/></td>
								<td width="20%" align="left"><xsl:value-of select="@UNCDN"/></td>
							</tr>
							<tr>							
								<td width="30%" align="left"><big><big>Hazard Class:<xsl:text>  </xsl:text><xsl:value-of select="@hazard"/></big></big></td>
								<td width="20%" align="left"><xsl:value-of select="@HAZD"/></td>
								<td width="20%" align="left"><xsl:value-of select="@UNCDF"/></td>
								<td width="20%" align="left"><xsl:value-of select="@UNCDN"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<table align="center" width="50%" class="display">
					<tbody>
						<xsl:for-each select="//dbquery[@id='IL_MR_I1_ASSET_DG']/rows/row">
							<tr>
								<td colspan="2" width="50%" align="center"><big><big>Proper Shipping Name :<xsl:text>  </xsl:text><xsl:value-of select="@shipping_name"/></big></big></td>
								<td colspan="2" width="50%" align="center"><big><big>Net Explosive Weight :<xsl:text>  </xsl:text><xsl:value-of select="@net_expl_weight"/></big></big></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>			
				<br/>
			</center>
		</xsl:when>
		<!-- DG Block - Specific Layout For ASSET Infos -->
		<xsl:when test="$Detail_Data='SPE_I1_ASSETA_INFOS'">
			<!-- Specific Layout for ASSETA Infos -->
			<table align="center" width="95%" bgcolor="#EBE8E7">
				<tbody>
					<xsl:for-each select="//dbquery[@id='IL_MR_I1_ASSETA']/rows/row">
						<tr>
							<TH colspan="17" bgcolor="#AA9F9B">General Infos on ASSET </TH>
						</tr>
						<tr>
							<td align="right" style="font-weight:bold">ASSET:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@ASSET"/>
							</td>
							<td align="left">
								<xsl:variable name="SPEVAL">MRN_SPE01#ASSETA&amp;arg1=<xsl:value-of select="@ASSET"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$SPEVAL"/>
								</xsl:call-template>							
							</td>
							<td align="left" colspan="2" bgcolor="#E2E0DE">
								<a class="tooltip" href="#"><xsl:value-of select='@DESCRIPTION'/><span class="custom info"><img border="0" src="/Default/img/Info.png" alt="Information" height="48" width="48" /><em>Description</em> Fr : <xsl:value-of select='@DESCRIPTION_FR'/><br/>Nl : <xsl:value-of select='@DESCRIPTION_NL'/></span></a>
							</td>
							<td align="right" style="font-weight:bold">UII:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@UII"/>
							</td>
							<td align="right" style="font-weight:bold">TYPE:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@TYPE"/>
							</td>
							<td align="right" style="font-weight:bold">NSN:</td>
							<td align="right" colspan="2" bgcolor="#E2E0DE">
								<xsl:value-of select="@NSN"/>
							</td>
							<td align="left">
								<xsl:variable name="SPEVAL">MRN_SPE01#spart&amp;arg1=<xsl:value-of select="@NSN"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$SPEVAL"/>
								</xsl:call-template>							
							</td>
							<td align="right" style="font-weight:bold">PN:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@PN"/>
							</td>
							<td align="right" style="font-weight:bold">MFR:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@MFR"/>
							</td>					
						</tr>
						<tr>		
							<td align="right" style="font-weight:bold">Serial:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@SERIAL"/>
							</td>
							<td align="right" style="font-weight:bold">Function:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@FUNCTION"/>
							</td>						
							<td/>
							<td align="right" style="font-weight:bold">Org:</td>
							<td align="center" bgcolor="#E2E0DE">
								<xsl:variable name="SPEVAL">MRN_SPE09#01##<xsl:value-of select="@ORGANISM"/>#1#<xsl:value-of select="@ORGANISM"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$SPEVAL"/>
								</xsl:call-template>
							</td>
							<td align="right" style="font-weight:bold">Width:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@WIDTH"/>
							</td>
							<td align="right" style="font-weight:bold">Lenght:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@LENGTH"/>
							</td>
							<td align="right" style="font-weight:bold">Height:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@HEIGHT"/>
							</td>
							<td align="right" style="font-weight:bold">Weight:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@WEIGHT"/>
							</td>
							<td align="right" style="font-weight:bold">Volume:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@VOLUME"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="font-weight:bold">Latest Categ:</td>
								<td align="right" bgcolor="#E2E0DE">
									<xsl:value-of select="@LATEST_CATEGORY"/>
								</td>
							<td align="right" style="font-weight:bold">Position:</td>
							<td align="left" colspan = "3" bgcolor="#E2E0DE">
								<xsl:value-of select="@LOCALISATION"/>
							</td>
							<td align="right" style="font-weight:bold">Limitations:</td>
							<td align="left" colspan = "4" bgcolor="#E2E0DE">
								<xsl:value-of select="@LIMITATIONS"/>
							</td>
							<td align="right" style="font-weight:bold">Comments:</td>
							<td align="left" colspan = "8" bgcolor="#E2E0DE">
								<xsl:value-of select="@COMMENTS"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
			<br/>
			<table align="center" width="60%" bgcolor="#EBE8E7">
				<tbody>
					<xsl:for-each select="//dbquery[@id='IL_MR_I1_TOP_ASSET']/rows/row">
						<tr>
							<TH colspan="16" bgcolor="#AA9F9B">Top Assets</TH>
						</tr>
						<tr>
							<td align="left">
								Top Asset :
							</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:value-of select="@TOP_ASSET"/>
							</td>
							<td width="20%"/>
							<td align="left">
								Latest Top Asset :
							</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:choose>
									<xsl:when test="@LATEST_TOP_ASSET =''">
										N/A
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="@LATEST_TOP_ASSET" />
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td width="20%"/>	
							<td align="left">
								Latest parent :
							</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:choose>
									<xsl:when test="@LATEST_PARENT_ASSET =''">
										N/A
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="@LATEST_PARENT_ASSET"/>
									</xsl:otherwise>
								</xsl:choose>								
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
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