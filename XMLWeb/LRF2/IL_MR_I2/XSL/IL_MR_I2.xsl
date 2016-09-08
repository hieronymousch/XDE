<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>
<!-- Variable Declaration -->	
<xsl:variable name="RepConf">MRN_Prod</xsl:variable>	
<xsl:variable name="dT_Type">99</xsl:variable>
<xsl:variable name="vNSN"><xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pNSN']/@value"/></xsl:variable>

<!-- Variable Declaration End -->
<xsl:template match='/'>	
	<!-- Check Display Mode -->
	<xsl:choose>
		<!-- Pop-Up Version -->
		<xsl:when test="$vMODE='Pop-Up'">
			<center>
				<h1>I2 in Pop-Up Mode</h1>
				<h2><xsl:value-of select="//dbquery[@id='NSN']/rows/row/@DESCRIPTION"/></h2>
				<xsl:choose>
					<xsl:when test="$vLANG='FR'"><h3><xsl:value-of select="//dbquery[@id='NSN']/rows/row/@DESCRIPTION_FR"/></h3></xsl:when>
					<xsl:when test="$vLANG='NL'"><h3><xsl:value-of select="//dbquery[@id='NSN']/rows/row/@DESCRIPTION_NL"/></h3></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
				<table border="0" align="center">
					<tbody>
						<xsl:for-each select="//dbquery[@id='NSN']/rows/row">
							<xsl:variable name="xP2"><xsl:value-of select="@NIIN"/></xsl:variable>
							<tr>
								<td colspan="4" align="center">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-1" width="400px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/NOPIC2.png'"/>
								</td>
							</tr>
							<tr>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-2" width="100px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-3" width="100px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-4" width="100px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
								<td align="center" width="20%">
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP2}-5" width="100px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/nothing.png'"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</center>
		</xsl:when>
		<!-- Main or Drill-Down Version -->
		<xsl:otherwise>
			<!-- Generate HTML5 WebPage : Not good for Layout Reasons -->
				<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text> 
				<meta http-equiv="x-ua-compatible" content="IE=edge"/>
				<html>
					<head>
						<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
						<xsl:call-template name="Node_Std_Head">
							<xsl:with-param name="Node_Conf" select="$RepConf"/>
						</xsl:call-template>
					</head>
					<title>I2 Sample</title>
					<body>
						<!-- Report Layout Template (Top) -->
						<xsl:call-template name="Body_Start">
							<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
							<xsl:with-param name="tLocal" select="'NO'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
							<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
						</xsl:call-template>
						
						<xsl:if test="$vMODE='Main'">
							<center>
								<h1>I2 Sample</h1>
							</center>
							
						</xsl:if>		
						<!-- ID NSN - SPART Main -->
						<xsl:variable name="TName">NSN_MAIN_<xsl:value-of select="replace($vNSN,'-','')"/></xsl:variable>	
						<xsl:call-template name="Generic_Table_DBWEB"> 					
							<xsl:with-param name="DBWEB_Name" select="'IL_MR_I2_SPART'"/>
							<xsl:with-param name="UdTN" select="$TName"/>	
							<xsl:with-param name="Node_Conf" select="$RepConf"/>
							<xsl:with-param name="dT_Type" select="'99'"/>
							<xsl:with-param name="Show_Empty" select="'Y'"/>
							<xsl:with-param name="Lang" select="$vLANG"/>
							<xsl:with-param name="ForcedTitle" select="'IL_MR_I2_NSN_ID_BLOCK'"/>
							<xsl:with-param name="RepDic" select="'Y'"/> 
							<xsl:with-param name="Frame" select="'YO'"/>
							<xsl:with-param name="TableWidth" select="'95%'"/>
							<xsl:with-param name="Detail_Data" select="'SPE_I2_SPART_INFOS'"/>
						</xsl:call-template>
						
						<!-- Report Layout Template (Bottom) -->
						<xsl:call-template name="Body_End">
							<xsl:with-param name="tDebug" select="'NO'"/> 		<!-- YES or No (Default) -->
							<xsl:with-param name="tLocal" select="'NO'"/> 		<!-- Yes for Local and NO (Default) for MR Node -->
							<xsl:with-param name="tLanguage" select="$vLANG"/> 	<!-- EN (Default) - English/FR - Français/NL - Nederlands -->
						</xsl:call-template>
					</body>
				</html>
		</xsl:otherwise>
	</xsl:choose>
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
		<xsl:when test="$Detail_Data='SPE_I2_SPART_INFOS'">
			<!-- Specific Content for -->
			<table align="center" width="100%" bgcolor="#EBE8E7">
				<tbody>
					<xsl:for-each select="//dbquery[@id='IL_MR_I2_SPART']/rows/row">
						<tr>
							<TH colspan="22" bgcolor="#AA9F9B">GENERAL Infos  </TH>
						</tr>
						<tr>
							<td align="right" ><b>NSN:</b></td>
							<td align="center" colspan="2" bgcolor="#E2E0DE"><xsl:value-of select="@NSN"/></td>
							<td align="left">
								<xsl:variable name="SPEVAL">MRN_SPE01#SPART&amp;arg1=<xsl:value-of select="@NSN"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$SPEVAL"/>
								</xsl:call-template>
							</td>
							<td align="right"><b>Description:</b></td>
							<td align="center" colspan="3" bgcolor="#E2E0DE">
									<a class="tooltip" href="#"><xsl:value-of select='@DESCRIPTION'/><span class="custom info"><img border="0" src="/Default2/MRN_Prod/img/Info.png" alt="Information" height="48" width="48" /><em>Description</em> Fr : <xsl:value-of select='@DESCRIPTION_FR'/><br/>Nl : <xsl:value-of select='@DESCRIPTION_NL'/></span></a>
							</td>
							<td align="right"><b>Alt.Desc:</b></td>
							<td align="center" colspan="5" bgcolor="#E2E0DE">
									<xsl:value-of select="@ALB"/>
							</td>
							<td align="right"><b>Status:</b></td>
							<td align="center" bgcolor="#E2E0DE">
								<xsl:variable name="SPEVAL">MRN_SPE10#US#<xsl:value-of select="@UTIL_STATUS"/></xsl:variable>
								<xsl:call-template name="SPE_Feature">
									<xsl:with-param name="FieldVal" select="$SPEVAL"/>
								</xsl:call-template>
							</td>
							<td align="right"><b>Reap Type:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:element name='a'>
										<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
										<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP/IL_MR_LLOOK.xml?pCODE=<xsl:value-of select="@REAP_TYPE"/>&amp;pTYPE=AL',300);</xsl:attribute>
										<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
										<xsl:value-of select='@REAP_TYPE'/>
									</xsl:element>
							</td>
							<td align="right"><b>Macode:</b></td>
							<td align="center" colspan="3" bgcolor="#E2E0DE">
									<xsl:value-of select="@MACODE"/>
							</td>
						</tr>
						<tr>
							<td align="right"><b>UM:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:element name='a'>
										<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
										<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP/IL_MR_LLOOK.xml?pCODE=<xsl:value-of select="@UM"/>&amp;pTYPE=UM',300);</xsl:attribute>
										<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
										<xsl:value-of select='@UM'/>
									</xsl:element>
							</td>
							<td align="right"><b>Conv Indic:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@CONVERSION_INDICATOR"/>
							</td>
							<td align="right"><b>Conv Factor:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@CONVERSION_FACTOR"/>
							</td>
							<td align="right"><b>US:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:element name='a'>
										<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
										<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP/IL_MR_LLOOK.xml?pCODE=<xsl:value-of select="@US"/>&amp;pTYPE=UM',300);</xsl:attribute>
										<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
										<xsl:value-of select='@US'/>
									</xsl:element>
							</td>
							<td align="right"><b>MUDIS Qty:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@MUDIS_QTY"/>
							</td>
							<td align="right"><b>Last price:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@LAST_PRICE"/>
							</td>
							<td align="right"><b>Avg price:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@AVG_PRICE"/>
							</td>
							<td align="right"><b>VAT:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@VAT"/>
							</td>
							<td align="right"><b>Year Price:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@YEAR_PRICE"/>
							</td>
							<td align="right"><b>Entry Point:</b></td>
							<td align="center" bgcolor="#E2E0DE">
									<xsl:value-of select="@ENTRY_POINT"/>
							</td>
						</tr>
						<table align="center" width="100%" bgcolor="#EBE8E7" class="display">
							<tbody>
								<tr>
									<xsl:variable name="xP1"><xsl:value-of select="@NIIN"/></xsl:variable>
									<xsl:variable name="xP2"><xsl:value-of select="@NSN"/></xsl:variable>
									<td align="center" width="10%" colspan="22"><b>Picture and Stocks</b><br/><br/>
									<img border="0" src="http://tim.mil.intra/picture//ILIAS/{$xP1}-1" width="200px" alt="TIM Picture" style="vertical-align:Top" onerror="this.src='/Default2/MRN_Prod/img/NOPIC2.png'"/><br/>
									<br/>
									<xsl:choose>
										<xsl:when test="@SERIALISED = 'Y' ">
											<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_STK_S/IL_MR_STK_S_NSN.xml?pRID=6&amp;pNSN={$xP2}"><img border="0" src="/Default2/MRN_Prod/img/Stockmaptext.png" width="200px" alt="Stock for Serial" style="vertical-align:middle"/></a>
										</xsl:when>
										<xsl:otherwise>
										<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_STK_NS/IL_MR_STK_NS_NSN.xml?pRID=4&amp;pNSN={$xP2}"><img border="0" src="/Default2/MRN_Prod/img/Stockmaptext.png" width="200px" alt="Stock for Non-Serial" style="vertical-align:middle"/></a>
										</xsl:otherwise>
									</xsl:choose>
									</td>
									<td>
										<table align="center" width="100%" >
											<thead>
												<tr>
													<TH colspan="13" bgcolor="#AA9F9B">Properties</TH>
												</tr>	
												<tr bgcolor="#BBB4B0">
													<TH>Asset</TH>
													<TH>Repair</TH>
													<TH>Lot</TH>
													<TH>Attract.</TH>
													<TH>Strat.</TH>
													<TH>All Book</TH>
													<TH>Disposal Class</TH>
													<TH>Maint Level</TH>
													<TH>Demil Class</TH>
													<TH>Denial</TH>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="//dbquery[@id='IL_MR_I2_SPART']/rows/row">
													<tr>
														<xsl:choose>
															<xsl:when test="@SERIALISED = 'Y' ">
																<td align="center">
																	<img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/>
																</td>
															</xsl:when>
															<xsl:otherwise>
																<td align="center">
																	<img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/>
																</td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@REPAIRABLE = 'Y' ">
																<td align="center">
																	<img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/>
																</td>
															</xsl:when>
															<xsl:otherwise>
																<td align="center">
																	<img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/>
																</td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@LOT = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@ATTRACTIVE = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@STRATEGIC = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@ALLOWANCE_BOOK = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:otherwise>
														</xsl:choose>
														<td align="center"><xsl:value-of select="@REFORM"/></td>
														<td align="center"><xsl:value-of select="@MAINT_LEVEL"/></td>
														<td align="center">
															<xsl:element name='a'>
															<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
															<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP/IL_MR_LLOOK.xml?pCODE=<xsl:value-of select="@DEMIL_CLASS"/>&amp;pTYPE=DEMCLA',300);</xsl:attribute>
															<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
															<xsl:value-of select='@DEMIL_CLASS'/>
															</xsl:element>
														</td>
														<td align="center">
															<xsl:element name='a'>
															<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
															<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP/IL_MR_LLOOK.xml?pCODE=<xsl:value-of select="@DENIAL"/>&amp;pTYPE=DE',300);</xsl:attribute>
															<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
															<xsl:value-of select='@DENIAL'/>
															</xsl:element>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
											<thead>
												<tr bgcolor="#BBB4B0">
													<TH>Tech Degree</TH>
													<TH>RF Kit</TH>
													<TH>Set</TH>
													<TH>Set Comp</TH>
													<TH>Pool Mgt</TH>
													<TH>Unit Pool Mgt</TH>
													<TH>Iss2Client</TH>
													<TH>Iss On WO</TH>
													<TH>Iss in Loan</TH>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="//dbquery[@id='IL_MR_I2_SPART']/rows/row">
													<tr>
														<td align="center"><xsl:value-of select="@DT"/></td>
														<td align="center"><xsl:value-of select="@RF"/></td>
														<xsl:choose><xsl:when test="@SETS = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@SETS = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td><xsl:value-of select="@SETS"/></td></xsl:otherwise>
														</xsl:choose>
														<td align="center">?</td>
														<td align="center">?</td>
														<td align="center">?</td>
														<xsl:choose><xsl:when test="@ISSUE_TO_CLIENT = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@ISSUE_TO_CLIENT = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td><xsl:value-of select="@ISSUE_TO_CLIENT"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@ISSUE_ON_WO = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@ISSUE_ON_WO = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td><xsl:value-of select="@ISSUE_ON_WO"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@LOAN = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@LOAN = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><td><xsl:value-of select="@LOAN"/></td></xsl:otherwise>
														</xsl:choose>
													</tr>
												</xsl:for-each>
											</tbody>
											<thead bgcolor="#BBB4B0">
												<tr>
													<TH>Clothing</TH>
													<TH>Cercopes</TH>
													<TH>Fuel</TH>
													<TH>Medical</TH>
													<TH>Pharma</TH>
													<TH>MRC Type</TH>
													<TH>Apply SEM</TH>
													<TH>Opp Visum</TH>
													<TH>Highest Blk Lev.</TH>
													<TH>Source M. Rec</TH>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="//dbquery[@id='IL_MR_I2_SPART']/rows/row">
													<tr>
														<xsl:choose><xsl:when test="@COLLISHOP = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@COLLISHOP = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><xsl:value-of select="@COLLISHOP"/></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@CERCOPES = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@CERCOPES = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><xsl:value-of select="@CERCOPES"/></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@FUEL = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@FUEL = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><xsl:value-of select="@FUEL"/></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@MEDICAL = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@MEDICAL = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><xsl:value-of select="@MEDICAL"/></xsl:otherwise>
														</xsl:choose>
														<xsl:choose><xsl:when test="@PHARMACEUTICAL = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@PHARMACEUTICAL = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><xsl:value-of select="@PHARMACEUTICAL"/></xsl:otherwise>
														</xsl:choose>
														<td align="center"><xsl:value-of select="@MRC"/></td>
														<xsl:choose><xsl:when test="@APPLY_SAFETY_MEASURES = 'Y' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/check-1-icon.png" alt="Yes" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:when test="@APPLY_SAFETY_MEASURES = 'N' "><td align="center"><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/close-2-icon.png" alt="No" style="vertical-align:middle"/></td></xsl:when>
																	<xsl:otherwise><xsl:value-of select="@APPLY_SAFETY_MEASURES"/></xsl:otherwise>
														</xsl:choose>
														<td align="center"><xsl:value-of select="@OPPORTUNITY_VISUM"/></td>
														<td align="center">?</td>
														<td align="center"><xsl:value-of select="@SMR"/></td>
													</tr>
												</xsl:for-each>
											</tbody>
											<thead bgcolor="#BBB4B0">
												<tr>
													<TH colspan="12" bgcolor="#AA9F9B">Metrics and TPT</TH>
												</tr>
												<tr>
													<TH>Weight</TH>
													<TH>Volume</TH>
													<TH>Height</TH>
													<TH>Lenght</TH>
													<TH>Width</TH>
													<TH>Pass. Code</TH>
													<TH>Pack Gp/Instr.</TH>
													<TH>SMR</TH>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="//dbquery[@id='IL_MR_I2_SPART']/rows/row">
													<tr>
														<xsl:choose>
															<xsl:when test="@WEIGHT = '0.00' or @WEIGHT=''">
																<td align="center">(<xsl:value-of select="@WEIGHT"/>)<br/><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/pen-icon.png" alt="Missing" style="vertical-align:middle"/></td>
															</xsl:when>
															<xsl:otherwise><td><xsl:value-of select="@WEIGHT"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@VOLUME = '0.00' or @VOLUME=''">
																<td align="center">(<xsl:value-of select="@VOLUME"/>)<br/><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/pen-icon.png" alt="Missing" style="vertical-align:middle"/></td>
															</xsl:when>
															<xsl:otherwise><td><xsl:value-of select="@VOLUME"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@HEIGHT = '0.00' or @HEIGHT = ''">
																<td align="center">(<xsl:value-of select="@HEIGHT"/>)<br/><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/pen-icon.png" alt="Missing" style="vertical-align:middle"/></td>
															</xsl:when>
															<xsl:otherwise><td><xsl:value-of select="@HEIGHT"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@LENGTH = '0.00' or @LENGTH = ''">
																<td align="center">(<xsl:value-of select="@LENGTH"/>)<br/><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/pen-icon.png" alt="Missing" style="vertical-align:middle"/></td>
															</xsl:when>
															<xsl:otherwise><td><xsl:value-of select="@LENGTH"/></td></xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="@WIDTH = '0.00' or @WIDTH = ''">
																<td align="center">(<xsl:value-of select="@WIDTH"/>)<br/><img border="0" width="27px" src="/Default2/MRN_Prod/img/Flat/pen-icon.png" alt="Missing" style="vertical-align:middle"/></td>
															</xsl:when>
															<xsl:otherwise><td><xsl:value-of select="@WIDTH"/></td></xsl:otherwise>
														</xsl:choose>
														<td align="center"><xsl:value-of select="@PASSENGER_CODE"/></td>
														<td align="center"><xsl:value-of select="@PACKING_GROUP"/>-<xsl:value-of select="@PACKING_INSTRUCTIONS"/></td>
														<td align="center">
															<xsl:element name='a'>
															<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
															<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF/IL_MR_POPUP/IL_MR_LLOOK.xml?pCODE=<xsl:value-of select="@SMR"/>&amp;pTYPE=SMR',300);</xsl:attribute>
															<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
															<xsl:value-of select='@SMR'/>
															</xsl:element>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>											
											<thead bgcolor="#BBB4B0">
												<tr>
													<TH colspan="12" bgcolor="#AA9F9B">REPLEN (Last Rev date : <xsl:value-of select="@LAST_REVIEW_DATE"/>)</TH>
												</tr>
												<tr>
													<TH>Th Qty</TH>
													<TH>Th Qty Date</TH>
													<TH>VV Qty</TH>
													<TH>VV Qty Date</TH>
													<TH>Avg Usage</TH>
													<TH>Avg Usg Date</TH>
													<TH>Var Usg</TH>
													<TH>Std Dev Usg</TH>
													<TH>Var Coef Usg</TH>
													<TH>Exp Period</TH>
												</tr>
											</thead>
											<tbody>
												<xsl:for-each select="//dbquery[@id='IL_MR_I2_SPART']/rows/row">
													<tr>
														<td align="center"><xsl:value-of select="@THEO_QTY"/></td>
														<td align="center"><xsl:value-of select="@THEO_QTY_DATE"/></td>
														<td align="center"><xsl:value-of select="@VV_QTY"/></td>
														<td align="center"><xsl:value-of select="@VV_QTY_DATE"/></td>
														<td align="center"><xsl:value-of select="@AVG_USAGE"/></td>
														<td align="center"><xsl:value-of select="@AVG_USAGE_DATE"/></td>
														<td align="center"><xsl:value-of select="@VAR_USAGE"/></td>
														<td align="center"><xsl:value-of select="@STDDEV_USAGE"/></td>
														<td align="center"><xsl:value-of select="@VAR_COEFF_USAGE"/></td>
														<td align="center"><xsl:value-of select="@EXP_PERIOD"/></td>
													</tr>
												</xsl:for-each>
											</tbody>											
										</table>
									</td>
								</tr>
							</tbody>
						</table>
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
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
