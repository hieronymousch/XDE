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
<xsl:variable name="vRepDic" select="document('../../IL_MR_SAMPLE_RepDic.xml')" />
<xsl:variable name="vASSET"><xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pASSET']/@value"/></xsl:variable>
<!--
<xsl:variable name="dTColHidden">'NONE'</xsl:variable>
<xsl:variable name="dtSortingCol">1-asc</xsl:variable>
-->
<!-- Variable Declaration End -->

<xsl:template match='/'>	
	<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text> 
	<meta http-equiv="x-ua-compatible" content="IE=9"/>
	<html>
		<head>
			<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
			<xsl:call-template name="Node_Std_Head">
				<xsl:with-param name="Node_Conf" select="$RepConf"/>
			</xsl:call-template>
		</head>
		<title>
			I1 : <xsl:value-of select="$vASSET"/>
		</title>
		<body>
			<center>
				<h1>
					Drill-Down I1 for Asset<xsl:value-of select="$vASSET"/>
				</h1>
			</center>		
			<!-- Variable ajoutée pour rendre unique le tableau qui sera appelé plusieurs fois via un Drill-Down (ajout de l'asset) -->
			<xsl:variable name="TNameDD">IL_MR_I1_ASSET_DG_<xsl:value-of select="$vASSET"/></xsl:variable>
			<xsl:call-template name="Generic_Table_DBWEB">					
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_I1_ASSET_DG'"/>
				<!-- Paramètre utiliser pour donner un nom unique à la variable qui sera utilisée par DataTable -->
				<xsl:with-param name="UdTN" select="$TNameDD"/>
				<xsl:with-param name="Node_Conf" select="$RepConf"/>
				<xsl:with-param name="dT_Type" select="'99'"/>
				<xsl:with-param name="Show_Empty" select="'N'"/>
				<xsl:with-param name="Lang" select="$vLANG"/>
				<xsl:with-param name="RepDic" select="'Y'"/> 
				<xsl:with-param name="dictionary" select="$vRepDic"/> 
				<xsl:with-param name="ForcedTitle" select="'This Asset is considered as Dangerous Goods'"/>
				<xsl:with-param name="TableWidth" select="'95%'"/>
				<xsl:with-param name="Frame" select="'YC'"/>
				<xsl:with-param name="Detail_Data" select="'SPE_I1_DG'"/>
			</xsl:call-template>			
			<xsl:call-template name="Generic_Table_DBWEB"> 					<!-- ID ASSET - ASSET Main -->
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_I1_ASSETA'"/>
				<!-- Paramètre utiliser pour donner un nom unique à la variable qui sera utilisée par DataTable. Technique sans passer par une variable -->
				<xsl:with-param name="UdTN" select="concat('IL_MR_I1_ASSET_ID_BLOCK_',$vASSET)"/>	
				<xsl:with-param name="Node_Conf" select="$RepConf"/>
				<xsl:with-param name="dT_Type" select="'99'"/>
				<xsl:with-param name="Show_Empty" select="'N'"/>
				<xsl:with-param name="Lang" select="$vLANG"/>
				<xsl:with-param name="RepDic" select="'Y'"/> 
				<xsl:with-param name="dictionary" select="$vRepDic"/> 
				<xsl:with-param name="Frame" select="'N'"/>
				<xsl:with-param name="TableWidth" select="'95%'"/>
				<xsl:with-param name="Detail_Data" select="'SPE_I1_ASSETA_INFOS'"/>
			</xsl:call-template>
			<br/>
			<xsl:for-each select = "//dbquery[contains(@id,'IL_MR_I1G_')]"> <!-- Generic Rest -->
				<!--<xsl:value-of select="@id"/><br/>-->
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="@id"/>
					<!-- Paramètre utiliser pour donner un nom unique à la variable qui sera utilisée par DataTable. Technique sans passer par une variable et en utilisant la valeur dynamique du QueryId -->
					<xsl:with-param name="UdTN" select="concat(@id,'_',$vASSET)"/>	
					<xsl:with-param name="Show_Empty" select="'N'"/> 
					<xsl:with-param name="Node_Conf" select="$RepConf"/>
					<xsl:with-param name="dT_Type" select="'99'"/>
					<xsl:with-param name="Lang" select="$vLANG"/>
					<xsl:with-param name="TableClass" select="'display cell-border'"/> 
					<xsl:with-param name="RepDic" select="'Y'"/> 
					<xsl:with-param name="dictionary" select="$vRepDic"/> 
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YC'"/>
					<xsl:with-param name="TableWidth" select="'95%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/>
				</xsl:call-template>
			</xsl:for-each>
		</body>
	</html>
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
		<xsl:when test="$Detail_Data='SPE_I1_DG'">
			<table border="0" class="display" align="center"  width="95%" >
				<thead class="MRHead">
					<th align="left"  width="5%"></th>
					<TH colspan="6" width="100%"><big><big><font COLOR="red">Dangerous Goods</font></big></big></TH>
				</thead>
				<tbody>
					<tr style="display:block">
						<td colspan="1"><img border="0" src="/Default/img/DG.jpg" width="100px" align="center" valign="center" alt="Dangerous Goods" style="vertical-align:middle"/></td>
						<td colspan="7" style="background-color:#ffffff;">
							<table align="center" width="100%" class="display">
								<tbody>
									<xsl:for-each select="//dbquery[@id='IL_MR_I1_ASSET_DG']/rows/row">
										<tr>
											<td width="10%" align="left"><big><big>UN Code :<xsl:text>  </xsl:text><xsl:value-of select="@un_code"/></big></big></td>
											<td width="30%" align="left"><xsl:value-of select="@UNCD"/></td>
											<td width="30%" align="left"><xsl:value-of select="@UNCDF"/></td>
											<td width="30%" align="left"><xsl:value-of select="@UNCDN"/></td>
										</tr>
										<tr>							
											<td width="10%" align="left"><big><big>Hazard Class:<xsl:text>  </xsl:text><xsl:value-of select="@hazard"/></big></big></td>
											<td width="30%" align="left"><xsl:value-of select="@HAZD"/></td>
											<td width="30%" align="left"><xsl:value-of select="@UNCDF"/></td>
											<td width="30%" align="left"><xsl:value-of select="@UNCDN"/></td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table align="center" width="100%" class="display">
								<tbody>
									<xsl:for-each select="//dbquery[@id='IL_MR_I1_ASSET_DG']/rows/row">
										<tr>
											<td colspan="2" width="50%" align="center"><big><big>Proper Shipping Name :<xsl:text>  </xsl:text><xsl:value-of select="@shipping_name"/></big></big></td>
											<td colspan="2" width="50%" align="center"><big><big>Net Explosive Weight :<xsl:text>  </xsl:text><xsl:value-of select="@net_expl_weight"/></big></big></td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>	
						</td>
					</tr>
				</tbody>
			</table>		
			<br/>
		</xsl:when>
		<xsl:when test="$Detail_Data='SPE_I1_ASSETA_INFOS'">
			<!-- Specific Layout for ASSETA Infos -->
			<table align="center" width="95%" bgcolor="#EBE8E7">
				<tbody>
					<xsl:for-each select="//dbquery[@id='IL_MR_I1_ASSETA']/rows/row">
						<tr>
							<TH colspan="17" bgcolor="#AA9F9B">General Infos on ASSET </TH>
						</tr>
						<tr>
							<td align="right">ASSET:</td>
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
							<td align="right">UII:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@UII"/>
							</td>
							<td align="right">TYPE:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@TYPE"/>
							</td>
							<td align="right">NSN:</td>
							<td align="right" colspan="2" bgcolor="#E2E0DE">
								<xsl:value-of select="@NSN"/>
							</td>
							<td align="left">
								<xsl:variable name="SPEVAL">MRN_SPE01#spart&amp;arg1=<xsl:value-of select="@NSN"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$SPEVAL"/>
								</xsl:call-template>							
							</td>
							<td align="right">PN:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@PN"/>
							</td>
							<td align="right">MFR:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@MFR"/>
							</td>					
						</tr>
						<tr>		
							<td align="right">Serial:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@SERIAL"/>
							</td>
							<td align="left">Function:</td>
							<td align="right" bgcolor="#E2E0DE">
								<xsl:value-of select="@FUNCTION"/>
							</td>						
							<td/>
							<td align="left">ORG:</td>
							<td align="center" bgcolor="#E2E0DE">
								<xsl:variable name="SPEVAL">MRN_SPE11#<xsl:value-of select="@ORGANISM"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$SPEVAL"/>
								</xsl:call-template>
							</td>
							<td align="right">Width:</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:value-of select="@WIDTH"/>
							</td>
							<td align="right">Lenght:</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:value-of select="@LENGTH"/>
							</td>
							<td align="right">Height:</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:value-of select="@HEIGHT"/>
							</td>
							<td align="right">Weight:</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:value-of select="@WEIGHT"/>
							</td>
							<td align="right">Volume:</td>
							<td align="left" bgcolor="#E2E0DE">
								<xsl:value-of select="@VOLUME"/>
							</td>
						</tr>
						<tr>
							<td align="left">Latest Categ:</td>
								<td align="right" bgcolor="#E2E0DE">
									<xsl:value-of select="@LATEST_CATEGORY"/>
								</td>
							<td align="left">Position:</td>
							<td align="left" colspan = "3" bgcolor="#E2E0DE">
								<xsl:value-of select="@LOCALISATION"/>
							</td>
							<td align="left">Limitations:</td>
							<td align="left" colspan = "4" bgcolor="#E2E0DE">
								<xsl:value-of select="@LIMITATIONS"/>
							</td>
							<td align="left">Comments:</td>
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
			<br/>
			<table align="center" width="60%" bgcolor="#EBE8E7">
				<tbody>
					<tr>
						<td align='center' width="50%">
							<!-- ASSET STATUS -->
							<div id="IL_MR_AI2_STATE" style="background-color: rgb(255,255,255); display:block">
								<xsl:variable name="NBR_LinesST"><xsl:value-of select="count(//dbquery[@id='IL_MR_I1_STATE']/rows/row)"/></xsl:variable>
								<xsl:choose>
									 <xsl:when test="$NBR_LinesST = '0' ">
										<xsl:attribute name="style">background-color: rgb(255,255,255); display:none</xsl:attribute>
									 </xsl:when>
									 <xsl:otherwise>
										<xsl:attribute name="style">background-color: rgb(255,255,255); display:block</xsl:attribute>
									 </xsl:otherwise>
								</xsl:choose>
								<table border="0" align="center" width="100%">
									<tr id="STATE" style="display:block">
										<td colspan="8" style="background-color:#ffffff;">
										<table align="center" width="100%">
											<thead>
												<tr>
													<TH colspan="5" bgcolor="#AA9F9B"><big>Asset Status</big></TH>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="//dbquery[@id='IL_MR_I1_STATE']/rows/row">
													<tr>
														<xsl:choose>
															<xsl:when test="@ESSENTIAL = 'GOOD' ">
																<td width="20%" bgcolor="#00FF00" align='center'><big>ESSENTIAL</big></td>
															</xsl:when>
															<xsl:otherwise>
																<td width="20%" bgcolor="#FF0000" align='center'><big>ESSENTIAL</big></td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@STATUS = 'GOOD' ">
																<td width="20%" bgcolor="#00FF00" align='center'><big>STATUS</big></td>
															</xsl:when>
															<xsl:otherwise>
																<td width="20%" bgcolor="#FF0000" align='center'><big>STATUS</big></td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@LOGISTIC = 'GOOD' ">
																<td width="20%" bgcolor="#00FF00" align='center'><big>LOGISTIC</big></td>
															</xsl:when>
															<xsl:otherwise>
																<td width="20%" bgcolor="#FF0000" align='center'><big>LOGISTIC</big></td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@MAINTENANCE = 'GOOD' ">
																<td width="20%" bgcolor="#00FF00" align='center'><big>MAINTENANCE</big></td>
															</xsl:when>
															<xsl:otherwise>
																<td width="20%" bgcolor="#FF0000" align='center'><big>MAINTENANCE</big></td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@OPERATIONAL = 'GOOD' ">
																<td width="20%" bgcolor="#00FF00" align='center'><big>OPERATIONAL</big></td>
															</xsl:when>
															<xsl:otherwise>
																<td width="20%" bgcolor="#FF0000" align='center'><big>OPERATIONAL</big></td>
															</xsl:otherwise>
														</xsl:choose>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
										</td>
									</tr>
								</table>
							</div>
						</td>
						<td align='center' width="20%">
							<img width="30px" src="/Default/img/IRT.png" alt="Real Time Report" style="vertical-align:middle"/> 
						</td>
						<td align='left' width="30%">
							<a href="http://qrnode.mil.intra/LRF/XMLWeb/ProcessDescriptor/descriptor/ILIAS/asset_tree_structure/asset_tree_structure.xml?@ASSET={$vASSET}&amp;define_set=&amp;execute=TRUE">IRT Asset Tree Structure</a>
						</td>
					</tr>
				</tbody>
			</table>
		</xsl:when>
		<xsl:otherwise>
			<!-- No Specfic Content defined -->
			No specific Content for '<xsl:value-of select="$DBWEB_Name"/>' Detail data : '<xsl:value-of select="$Detail_Data"/>' defined
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:include href='../../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
