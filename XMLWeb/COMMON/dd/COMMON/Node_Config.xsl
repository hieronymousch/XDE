<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
<!-- Common Pillar Node FW - Components - By CPN Dev Core Team -->
	 
	 	<xsl:variable name="CPNVersion" select="'1.0.0 Beta 6'"/>
		<!-- Notification Counter=31 completed -->

	 	<!-- Common Pillar Std variable Declaration -->
	 	
		 	<!-- ILIAS Links -->
			 	<xsl:variable name="vURL_IOLP" select="'https://cdcwprdils40.idcn.mil.intra/forms/frmservlet?config=ilias_'"/>
			 	<xsl:variable name="vURL_ITOP" select="'https://cdcwaccils05.idcn.mil.intra:8890/forms/frmservlet?config=ilias_'"/>
			 	<xsl:variable name="vURL_IPAT" select="'https://cdcwaccils40.idcn.mil.intra/forms/frmservlet?config=ilias_'"/>
			 	<xsl:variable name="vURL_IVXX" select="'https://cdcwaccils20.idcn.mil.intra/forms/frmservlet?config=ilias_'"/>
			 	<xsl:variable name="vURL_PORTALIOLP" select="'https://cdcwprdils41.idcn.mil.intra:8890/portal/portal.htm#/dl'"/>
			 	<xsl:variable name="vURL_PORTALITOP" select="'http://cdcwaccils35.idcn.mil.intra/portal/portal.htm#/dl'"/>
			 	<xsl:variable name="vURL_PORTALIPAT" select="'https://cdcwaccils41.idcn.mil.intra:8890/portal/portal.htm#/dl'"/>
			 	<xsl:variable name="vURL_PORTALIVXX" select="'http://cdcwaccils20.idcn.mil.intra/portal/portal.htm#/dl'"/>
			 	<xsl:variable name="vURL_LIWSA_IOLP" select="'http://cdcwprdils46.idcn.mil.intra:8888/ilias/liwsa/#/login'"/>
			 	<xsl:variable name="vURL_LIWSA_ITOP" select="'http://cdcwaccils35.idcn.mil.intra:8888/ilias/liwsa/#/login'"/>
			 	<xsl:variable name="vURL_LIWSA_IPAT" select="'http://cdcwaccils43.idcn.mil.intra:8888/ilias/liwsa/#/login'"/>
			 	<xsl:variable name="vURL_LIWSA_IVXX" select="'http://cdcwaccils22.idcn.mil.intra:8888/ilias/liwsa/#/login'"/>
			 	<xsl:variable name="vURL_MRN" select="'http://mrnode.mil.intra'"/>
			 	<xsl:variable name="vURL_OPSN" select="'http://opsnode.mil.intra'"/>
			 	<xsl:variable name="vURL_QRN" select="'http://qrnode.mil.intra/ILIAS'"/>
			 	<xsl:variable name="vURL_WIKI" select="'http://icp.mil.intra/'"/>
	 		<!-- Global variables -->
			 	<xsl:variable name="vHtDocsConfig" select="'Default2'"/> 			<!-- Folder Name containing CPN Configuation Files -->
		 		<!-- Folder Name containing Node Configuation Files (MRN_Prod/MRN_Accept/OPSN_Prod/QRNI_Prod/Local)-->
			 	<xsl:variable name="vNodeConfig" select="'MRN_Accept'"/>
			 	<xsl:variable name="vNodedT" select="'99'"/> 		
			 	<xsl:variable name="vNodedTXLS" select="'Y'"/> 						<!-- Default XLS in dT (Y/N)-->
			 	<xsl:variable name="vNodedTPDF" select="'Y'"/> 						<!-- Default PDF in dT (Y/N)-->
				<xsl:variable name="vNodedTPaging" select="'Y'"/> 					<!-- Default Paging in dT (Y/N)-->
				<xsl:variable name="vShowDBWeb" select="'Y'"/> 						<!-- Show Queries Used (Y/N)-->
				<xsl:variable name="vNodeNRT" select="'NRT'"/> 		
			 	<xsl:variable name="vNodeName" select="'MR Node Acceptance'"/> 						<!-- Node Name MR Node/QR Node ILIAS/Ops Node/Local Node -->
			 	<xsl:variable name="vWebMaster" select="'Cdt IBANEZ C and Adjt DUBUS R'"/> 	<!-- Node POC (Administrators) -->
		 		<!-- Redirect Page -->
			 	<xsl:variable name="vNodeRedirect" select="'/LRF/XMLWeb/ProcessDescriptor/descriptor/HOME/Redir.xml'"/> 
			 	<xsl:variable name="vNodeInputFormType" select="'M'"/> 				<!-- Default Input Method -->
			 	<xsl:variable name="vListAdminCDN">'IBANEZ.C','DUBUS.R'</xsl:variable>
				<xsl:variable name="vListDevCDN">'NOURRY.N','MUES.F'</xsl:variable>
				<!-- Use CPN Report Data Model (Y or N). If No : Basic Prompt, no Info on Report, ... -->
				<xsl:variable name="vUseDataModel" select="'Y'"/>
			<!-- Mandatory Parameters -->
				<xsl:variable name="vRID" select="distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pRID']/@value)"/>
				<xsl:variable name="vLANG">
					<xsl:choose>
						<xsl:when test="substring(distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value),1,2)='FR'">FR</xsl:when>
						<xsl:when test="substring(distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value),1,2)='NL'">NL</xsl:when>
						<xsl:when test="substring(distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value),1,2)='EN'">EN</xsl:when>
						<xsl:otherwise>EN</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="vMODE" select="distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pMODE']/@value)"/>
				<xsl:variable name="vINFO" select="distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pINFO']/@value)"/>
				<xsl:variable name="vUSER" select="distinct-values(upper-case(//dbquery[1]/descriptor/parameters/param[@name='pUSER']/@value))"/>
				<xsl:variable name="vCDN" select="distinct-values(upper-case(//dbquery[1]/descriptor/parameters/param[@name='pcCDN']/@value))"/>
				<xsl:variable name="vPROFILE">
					<xsl:choose>
						<xsl:when test="contains($vListAdminCDN,$vCDN)">Node Admin</xsl:when>
						<xsl:when test="contains($vListDevCDN,$vCDN)">Node Dev</xsl:when>
						<xsl:when test="contains(//dbquery[@id='MRN_MISM_LOG']/rows/row[1]/@PermGroup,'MR-MGT')">MR-Mgt</xsl:when>
						<xsl:when test="contains(//dbquery[@id='Report_Info']/rows/row/@dbn_rep_responsible,$vCDN)">Rep Dev</xsl:when>
						<xsl:otherwise>User</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
			<!-- KPI (Only for MR Node)-->
				<xsl:variable name="vVKEYD" select="distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pVKEYD']/@value)"/>
				<xsl:variable name="vKPI" select="distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pKPI']/@value)"/>
				<xsl:variable name="vEXPLORE" select="distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pEXPLORE']/@value)"/>
				<xsl:variable name="vHIST" select="distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pHIST']/@value)"/>

		<!-- BEGIN NEEDED FOR SPECIAL FEATURE 51 -->
		<xsl:decimal-format name="Fmt_Curr_Euro" decimal-separator="," grouping-separator="."/>
		<!-- CPN Std Node Bootstrap Components -->
			<!-- Navigation Bar Node -->
			<xsl:template name="Report_NavBar">
				<!-- BOOTSTRAP NAVIGATION BAR -->
				<nav class="navbar navbar navbar-fixed-top" role="navigation">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/" target="_blank"><img src="/Default2/CPN/img/logo/{$vNodeConfig}/TextLogo.png" width="143" height="50" alt="{$vNodeName}" title="{$vNodeName} HomePage" style="margin-top:-14px;"/></a>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="CPN-navbar-collapse">
							<ul class="nav navbar-nav">
								<li class="active">
									<script type="text/javascript">
										<![CDATA[
										document.write('<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/CPN/CPN_REPORT/CPN_REP_LIST.xml?pLANG='+ localStorage['MRNLang'] +'"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>')
										]]>
									</script>
								</li>
								
								<xsl:if test="not($vLANG='EN' or $vLANG='FR' or $vLANG='NL')">
									<p class="navbar-text" style="color:#ff0;font-weight:bold">Missing pLANG</p>
								</xsl:if>
								<xsl:if test="$vUseDataModel='Y'">
									<xsl:if test="$vRID='' or not($vRID) or $vRID='0' or //dbquery[@id='Report_Info']/rows/row/@dbn_rep_id=''">
										<xsl:if test="$vKPI='' or not($vKPI)">
											<p class="navbar-text" style="color:#ff0;font-weight:bold">Bad pRID</p>
										</xsl:if>	
									</xsl:if>
								</xsl:if>
								<li>
									<xsl:choose>
										<xsl:when test="$vUseDataModel='Y'">
											<a href="#" data-toggle="modal" data-target="#CPN_Report_Infos" role="button">
												<b>Report : <xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_name"/></b> v.<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_version"/>
											</a> 
										</xsl:when>
										<xsl:when test="$vUseDataModel='N'">
											<p class="navbar-text">
												<xsl:value-of select="//dbqueries/label"/> - <xsl:value-of select="//dbqueries/description"/>
											</p>
										</xsl:when>
										<xsl:otherwise>
											<p class="navbar-text">
												'vUseDataModel' Param must be Y or N
											</p>
										</xsl:otherwise>
									</xsl:choose>
								</li>
								<li>
									<!-- Accuracy only if DataModel is Used -->
									<xsl:if test="$vUseDataModel='Y'">
										<p class="navbar-text">
											<xsl:variable name="DOK"><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/attribute::Extr_Status"/></xsl:variable>
											<xsl:variable name="EOK"><xsl:value-of select="count(//dbquery/error)"/></xsl:variable>
											<!-- Call template for flag generation -->
											<xsl:call-template name="Accuracy_Indic">
												<xsl:with-param name="tType" select="'Report'"/>
												<xsl:with-param name="tDOK" select="$DOK"/>
												<xsl:with-param name="tEOK" select="$EOK"/>
												<xsl:with-param name="tLanguage" select="$vLANG"/>		
											</xsl:call-template>
										</p> 
									</xsl:if>
								</li>
							</ul>
							<!-- Parameters -->
							<ul class="nav navbar-nav navbar-right">
								<xsl:choose>
									<!-- With DataModel -->
									<xsl:when test="$vUseDataModel='Y'">
										<xsl:if test="count(//dbquery[@id='Report_Prompt']/rows/row)>0">
											<li>
												<xsl:choose>
													<xsl:when test="$vNodeInputFormType='M'">
														<a href="#" style="color:#ff0;font-weight:bold" data-toggle="modal" data-target="#CPN_BInputform" role="button">
															<xsl:value-of select="count(//dbquery[@id='Report_Prompt']/rows/row)"/> Parameters
														</a>
													</xsl:when>
													<xsl:when test="$vNodeInputFormType='I'">
														<a href="#" style="color:#ff0;font-weight:bold" role="button">
															<xsl:attribute name="onclick">if(BListOfPrompts.style.display=='none'){$('#BListOfPrompts').slideDown('1000');} else {$('#BListOfPrompts').slideUp('1000');}</xsl:attribute>
															<xsl:value-of select="count(//dbquery[@id='Report_Prompt']/rows/row)"/> Parameters
														</a>
													</xsl:when>
													<xsl:otherwise>
														<a href="test.xml" style="color:#ff0;font-weight:bold" role="button">
															<xsl:value-of select="count(//dbquery[@id='Report_Prompt']/rows/row)"/> Parameters
														</a>
													</xsl:otherwise>
												</xsl:choose>
											</li>
										</xsl:if>
									</xsl:when>
									<xsl:when test="$vUseDataModel='N'">
										<xsl:if test="count(//dbquery[1]/descriptor/parameters/param)>0">
											<li>
												<xsl:choose>
													<xsl:when test="$vNodeInputFormType='M'">
														<a href="#" style="color:#ff0;font-weight:bold" data-toggle="modal" data-target="#CPN_BInputform" role="button">
															<xsl:value-of select="count(//dbquery[1]/descriptor/parameters/param[not(contains(@name,'pc'))])"/> Local Parameters
														</a>
													</xsl:when>
													<xsl:when test="$vNodeInputFormType='I'">
														<a href="#" style="color:#ff0;font-weight:bold" role="button">
															<xsl:attribute name="onclick">if(BListOfPrompts.style.display=='none'){$('#BListOfPrompts').slideDown('1000');} else {$('#BListOfPrompts').slideUp('1000');}</xsl:attribute>
															<xsl:value-of select="count(//dbquery[1]/descriptor/parameters/param)"/> Local Parameters
														</a>
													</xsl:when>
													<xsl:otherwise>
														<a href="test.xml" style="color:#ff0;font-weight:bold" role="button">
															<xsl:value-of select="count(//dbquery[1]/descriptor/parameters/param)"/> Parameters
														</a>
													</xsl:otherwise>
												</xsl:choose>
											</li>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<p class="navbar-text">
											'vUseDataModel' Param must be Y or N
										</p>
									</xsl:otherwise>
								</xsl:choose>


								<li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> Help <span class="caret"></span></a>
						          <ul class="dropdown-menu">
						            <li><a href="#" data-toggle="modal" data-target="#CPN_Report_Infos" role="button">Report Infos</a></li>
						            <xsl:choose>
						            	<xsl:when test="$vUseDataModel='Y' and count(//dbquery[@id='Report_Prompt']/rows/row)>0">
						            		<li><a target="_blank" href="/LRF/XMLWeb/ProcessDescriptor/descriptor/HOME/InputForm.xml?pRID={$vRID}&amp;pLANG={$vLANG}">Define Default Values</a></li>
						            	</xsl:when>
						            	<xsl:when test="$vUseDataModel='N' and count(//dbquery[1]/descriptor/parameters/param[not(contains(@name,'pc'))])>0">
						            		<li><a target="_blank" href="/LRF/XMLWeb/ProcessDescriptor/descriptor/HOME/InputForm.xml?pRID={$vRID}&amp;pLANG={$vLANG}">Define Default Values</a></li>
						            	</xsl:when>
						            	<xsl:otherwise/>
						            </xsl:choose>
						            <li role="separator" class="divider"></li>
						            <li>
					            		<a href="#" data-toggle="modal" data-target="#CPN_Report_Toolbox" role="button"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> ToolBox </a>
					            	</li>
						            <li><a href="#" data-toggle="modal" data-target="#CPN_Report_DBWebDescriptor" role="button"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> Queries Used</a></li>
						            <xsl:if test="$vNodeConfig!='Local'">
						            	<li role="separator" class="divider"></li>
						            	<li><a target="_blank" href="/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_REDIR/REDIR.xml?pRID=1064&amp;pVRID={$vRID}&amp;pLANG={$vLANG}"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Submit Feedback </a></li>
						            </xsl:if>
						            <xsl:if test="$vNodeConfig!='Local'">
						            	<li role="separator" class="divider"></li>
						            	<li><a target="_blank" href="/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_REDIR/REDIR.xml?pRID=1061&amp;pVRID={$vRID}&amp;pLANG={$vLANG}"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span> Data Dictionary </a></li>
						            </xsl:if>
						            <li role="separator" class="divider"></li>
										<xsl:variable name="vDoc">
											<xsl:choose>
												<xsl:when test="$vLANG='FR'">
													<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_url_doc_fr"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_url_doc_nl"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<li>
						            		<a target="_blank" href="{$vDoc}"><span class="glyphicon glyphicon-book" aria-hidden="true"></span> Documentation 
						            		</a>
						            	</li>
						            <li role="separator" class="divider"></li>
						            <li><a href="#" data-toggle="modal" data-target="#CPN_About" role="button">About</a></li>
						          </ul>
						        </li>
						        <li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
										<xsl:choose>
											<xsl:when test="not($vLANG='FR' or $vLANG='NL' or $vLANG='EN')">
												<font color="Red"><b>Select Language</b></font>
											</xsl:when>
											<xsl:otherwise>
												Lang (<xsl:value-of select="$vLANG"/>)
											</xsl:otherwise>
										</xsl:choose>
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<script>
											var MLang='';
											var Node='<xsl:value-of select="$vNodeConfig"/>';
											//switch(localStorage['MRNLang']) {
											switch('<xsl:value-of select="$vLANG"/>') {
											case 'FR':
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'FR\');" style="color:#ff0;font-weight:bold;cursor:pointer;">Francais</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'EN\');" style="cursor:pointer;">English</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'NL\');" style="cursor:pointer;">Nederlands</a></li>');
											break;
											case 'EN':
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'FR\');" style="cursor:pointer;">Francais</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'EN\');" style="color:#ff0;font-weight:bold;cursor:pointer;">English</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'NL\');" style="cursor:pointer;">Nederlands</a></li>');
											break;
											case 'NL':
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'FR\');" style="cursor:pointer;">Francais</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'EN\');" style="cursor:pointer;">English</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'FR\');" style="color:#ff0;font-weight:bold;cursor:pointer;">Nederlands</a></li>');
											break;
											default:
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'FR\');" style="cursor:pointer;">Francais</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'EN\');" style="cursor:pointer;">English</a></li>');
											document.write('<li><a href="#" onclick="SetNodeLang(Node,\'NL\');" style="cursor:pointer;">Nederlands</a></li>');
											break;
											}
										</script>
									</ul>
								</li>
						      </ul>
						</div><!-- /.navbar-collapse -->
					</div><!-- /.container-fluid -->
				</nav>
				<!-- Call_Report_Infos-->
			    <xsl:call-template name="CPN_Report_Infos"/>
			    <!-- Call_Report_Infos-->
			    <xsl:call-template name="CPN_Report_Toolbox"/>
			    <!-- Call Prompt -->
			    <xsl:call-template name="BInputform">
			    </xsl:call-template>
			</xsl:template>
			<!-- Report Info and about -->
			<xsl:template name='CPN_Report_Infos'>
				<div id="CPN_Report_Infos" class="modal fade">
			        <div class="modal-dialog modal-lg">
			            <!-- Modal content-->
			            <div class="modal-content">
			                <xsl:choose>
								<xsl:when test="$vUseDataModel='Y' and not($vRID='' or not($vRID) or $vRID='0' or //dbquery[@id='Report_Info']/rows/row/@dbn_rep_id='')">
									<div class="modal-header">
					                    <button type="button" class="close" data-dismiss="modal">X</button>
					                    <h4 class="modal-title">Report Information : '<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_name"/>'</h4>
					                </div>
					                <div class="modal-body">
					                    <div class="row">
					                        <div class="col-md-12">
					                            <p style="font-style:italic">This page summarize all <b>General</b> information about this Report.</p>
					                        </div>
					                    </div>
					                    <div class="row">
					                        <div class="col-md-5">
					                            <h4>General Data</h4>
					                            <p><b>Description : </b> <xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_long_desc_en"/></p>
					                            <ul>
					                                <li>
					                                	<b>Status : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_status"/>
					                                </li>
					                                <li>
					                                	<b>Node : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_node"/>
					                                </li>
					                                <li>
					                                	<b>Version : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_version"/> (<xsl:value-of select="substring(//dbquery[@id='Report_Info']/rows/row/@dbn_rep_date,1,10)"/>) 
					                                </li>
					                                <li>
					                                	<b>Point Of Contact : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_poc"/> (<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_email"/>)
					                                </li>
					                                <li>
					                                	<b>Show Queries Used : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_dbweb"/> (Node Config is '<xsl:value-of select="$vShowDBWeb"/>')
					                                </li>
					                                <li>
					                                	<b>Domain 1 : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_dom_lev1"/>
					                                </li>
					                                <li>
					                                	<b>Domain 2 : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_dom_lev2"/>
					                                </li>
					                                <li>
					                                	<b>Domain 3 : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_dom_lev3"/>
					                                </li>
					                                <li>
					                                	<b>Application : </b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_application"/>
					                                </li>
					                            </ul>
					                            <a class="btn btn-default" href="/LRF/XMLWeb/ProcessDescriptor/descriptor/CPN/CPN_REPORT/CPN_REP_LIST.xml?pIDRID={$vRID}&amp;pLANG={$vLANG}&amp;pMODE=Drill-Down2" data-toggle="modal" data-target="#Modal_ModalinfoReport_{$vRID}" role="button">More infos on this Report</a>
					                            <xsl:if test="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_remarks!=''">
					                            	<p><b>Remarks :</b> <xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_remarks"/></p>
					                            </xsl:if>

					                        </div>
					                        <div class="col-md-7">
					                            <xsl:if test="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_responsible!=''">
				                                	<h4>Shared Report</h4> 	
					                            	<p>
						                                This Report has NOT been developed by <xsl:value-of select="$vNodeName"/>. Errors, improvments, comments must be sent to Report Responsible <b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_responsible"/></b>
					                                </p>
					                            </xsl:if>
					                            <hr/>
					                            <xsl:if test="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_responsible!=''">
				                                	<h4>Accuracy</h4> 	
					                            	<p>
						                                This Report has build using 
					                                	<b><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@Views_Used"/> View(s) or Table(s)</b> (Moves mouse cursor on Report Menu Acc Flag to visualize detailed information)
					                                </p>
					                            </xsl:if>
					                            <hr/>
					                        </div>
					                    </div>
					                </div>
					                <div class="modal-footer">
					                    <center>
										        <div class="col-md-10">
						                            <p style="font-style:italic;color:red">This report has been build with <b>Report CPN (Common Pilar Node Framework)</b></p>
						                        </div>
						                </center>
					                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					                </div>
								</xsl:when>
								<xsl:when test="$vUseDataModel='Y' and  ($vRID='' or not($vRID) or $vRID='0' or //dbquery[@id='Report_Info']/rows/row/@dbn_rep_id='')">
									<div class="modal-header">
					                    <button type="button" class="close" data-dismiss="modal">X</button>
					                    <h4 class="modal-title">No Info on this report because Report Technical Id (pRID) is unknown</h4>
					                </div>
								</xsl:when>
								<xsl:when test="$vUseDataModel='N'">
									<div class="modal-header">
					                    <button type="button" class="close" data-dismiss="modal">X</button>
					                    <h4 class="modal-title">No Info on this report without usage of Report DataModel</h4>
					                </div>
								</xsl:when>
								<xsl:otherwise>
									<p class="navbar-text">
										'vUseDataModel' Param must be Y or N
									</p>
								</xsl:otherwise>
							</xsl:choose>
			            </div>
			        </div>
			    </div>
			    <xsl:call-template name="CPN_About"/>
			    <!-- Modal HTML Generic for loading Info Report -->
			    <div id="Modal_ModalinfoReport_{$vRID}" class="modal fade">
			        <div class="modal-dialog modal-lg">
			            <div class="modal-content">
			            	<!-- Loading Url -->
			            </div>
			        </div>
			    </div>
			</xsl:template>
			<!-- About -->
			<xsl:template name='CPN_About'>
				<div id="CPN_About" class="modal fade" role="dialog">
			        <div class="modal-dialog modal-lg">
			            <!-- Modal content-->
			            <div class="modal-content">
	                		<div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal">X</button>
			                    <h4 class="modal-title">About : <xsl:value-of select="$vNodeName"/></h4>
			                </div>
			                <div class="modal-body">
			                    <div class="row">
			                        <div class="col-md-4">
			                            <p>
			                            	<center>
			                            		<img src="/{$vHtDocsConfig}/CPN/img/cpn.png" width="80px"/>
			                            	</center>
			                            </p>
			                        </div>
			                        <div class="col-md-8">
			                            <p style="font-style:italic">This is a node managed by <br/><b><xsl:value-of select="$vWebMaster"/></b> <br/>and build with <br/>Version <b><xsl:value-of select="$CPNVersion"/></b> of <u>CPN (Common Pillar Node) Framework</u>.</p>
			                        </div>
			                    </div>
			                    <div class="row">
			                        <div class="col-md-10 col-md-offset-1">
			                            <center><h4>Disclaimer</h4></center>
			                            <p>
			                            	<small>
			                            		THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION.
												<br/>
												HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
											</small>
			                            </p>
			                        </div>
			                    </div>
			                    <div class="row">
			                        <div class="col-md-6">
			                            <h4><u>Node Variables</u></h4>
		                            	<p>
			                            	<dl class="dl-horizontal">
		                            			<dt>CPN FW Version</dt>
		                            			<dd><xsl:value-of select="$CPNVersion"/></dd>
		                            			<dt>Node Name</dt>
		                            			<dd><xsl:value-of select="$vNodeName"/></dd>
		                            			<dt>Node Config</dt>
		                            			<dd><xsl:value-of select="$vNodeConfig"/></dd>
		                            			<dt>Use of DataModel</dt>
	                            				<dd><xsl:value-of select="$vUseDataModel"/></dd>
	                            				<dt>DataTable Config</dt>
	                            				<dd><xsl:value-of select="$vNodedT"/></dd>
	                            				<dt>Redirect Link</dt>
	                            				<dd>...<xsl:value-of select="substring($vNodeRedirect,30,50)"/></dd>
	                            				<dt>Input Form</dt>
	                            				<dd><xsl:value-of select="$vNodeInputFormType"/></dd>
	                            				<dt>Default Source</dt>
	                            				<dd><xsl:value-of select="$vNodeNRT"/></dd>
	                            				<dt>Web Masters</dt>
	                            				<dd><xsl:value-of select="$vWebMaster"/></dd>
	                            				<dt>Show DBWeb</dt>
	                            				<dd><xsl:value-of select="$vShowDBWeb"/></dd>
	                            				<dt>Admin List</dt>
	                            				<dd><xsl:value-of select="$vListAdminCDN"/></dd>
	                            				<dt>Dev Core List</dt>
	                            				<dd><xsl:value-of select="$vListDevCDN"/></dd>
		                            		</dl>
			                            </p>
			                        </div>
			                        <div class="col-md-6">
		                            	<h4><u>Report Variables</u></h4>
		                            	<p>
		                            		<dl class="dl-horizontal">
	                            				<dt>Report Id</dt>
	                            				<dd><xsl:value-of select="$vRID"/></dd>
	                            				<dt>Language</dt>
	                            				<dd><xsl:value-of select="$vLANG"/></dd>
	                            				<dt>Mode</dt>
	                            				<dd><xsl:value-of select="$vMODE"/></dd>
	                            				<dt>Meta</dt>
	                            				<dd><xsl:value-of select="$vINFO"/></dd>
	                            				<dt>User</dt>
	                            				<dd><xsl:value-of select="if($vUSER='') then 'Not Authenticated' else $vUSER"/></dd>
	                            				<dt>CDN</dt>
	                            				<dd><xsl:value-of select="$vCDN"/></dd>
	                            				<hr/>
	                            				<dt>Your Profile</dt>
	                            				<dd><xsl:value-of select="$vPROFILE"/></dd>
	                            			</dl>
		                                </p>
	                            		<h4><u>local Storage Variables</u></h4>
		                            	<p>
		                            		<dl class="dl-horizontal">
	                            		
	                            				<dt>Array</dt>
	                            				<dd>
	                            					<script>
	                            						var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));
	                            						document.write(NodeSetArr.user)
	                            					</script>
	                            				</dd>
	                            				<dt>Debug</dt>
	                            				<dd>
	                            					<script>
	                            						var NodeSetArr =JSON.parse(localStorage.getItem('<xsl:value-of select="$vNodeConfig"/>_Settings'));
	                            						document.write(NodeSetArr.DebugMode)
	                            					</script>
	                            				</dd>
		                            		</dl>
		                                </p>
			                            <hr/>
			                        </div>
			                    </div>
			                </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			                </div>
			            </div>
			        </div>
			    </div>
			</xsl:template>			
			<!-- Report Toolbox -->
			<xsl:template name='CPN_Report_Toolbox'>
				<div id="CPN_Report_Toolbox" class="modal fade" role="dialog">
			        <div class="modal-dialog modal-lg">
			            <!-- Modal content-->
			            <div class="modal-content">
			               	<div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal">X</button>
			                    <h4 class="modal-title">Toolbox for Report '<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_name"/>'</h4>
			                </div>
			                <div class="modal-body">
			                    <div class="row">
			                        <div class="col-md-12">
			                            <h4>DataTable Settings Used in this Report </h4>
			                            <p style="font-style:italic">
			                            	This page additional Technical Infos.
			                            	<small>
			                            		<ul>
				                            		<script>
					                            		var url = window.location.href;
														var URLRep = url.substring(0,url.indexOf("?")).substring(url.substring(0,url.indexOf("?")).indexOf("LRF/XMLWeb/Process")-1);
														for(var i=0, len=localStorage.length; i&lt;len; i++) {
														    var key = localStorage.key(i);
														    if(key.indexOf(URLRep)>-1) {
														    	document.write("<li>"+key+"</li>");
														    }
														}
					                            	</script>
					                            </ul>
					                        </small>
				                            	<br/>
				                            	<center>
													<button type="button" class="btn btn-danger" >
														<xsl:attribute name="onclick">var url = window.location.href;var URLRep = url.substring(0,url.indexOf("?")).substring(url.substring(0,url.indexOf("?")).indexOf("LRF/XMLWeb/Process")-1);CleardTSettings4URL(URLRep)</xsl:attribute>
														Reset All Report Layout (All Blocks)
													</button>	
				                                </center>
				                            <hr/>
			                            </p>
			                        </div>
			                    </div>
			                    <!-- For Future
			                    <div class="row">
			                        <div class="col-md-5">
			                            <h4>Later (1)</h4>
			                            <p><b>Later (2)</b></p>
			                            <ul>
			                                <li>
			                                	<b>Later (3)</b>
			                                </li>
			                                
			                                <li>Later (4)</li>
			                            </ul>
			                        </div>
			                        <div class="col-md-7">
			                            <h4>Later (5)</h4> 	
			                            	<p>
				                                Later (6)
			                                </p>
			                            <hr/>
			                            <h4>Later (7)</h4> 	
			                            	<p>
				                                Later (8)
			                                </p>
			                            <hr/>
			                        </div>
			                    </div>
			                	-->
			                </div>
			                <div class="modal-footer">
			                    <center>
								        <div class="col-md-10">
				                            <p style="font-style:italic;color:red">This report has been build with <b>Report CPN (Common Pilar Node Framework)</b></p>
				                        </div>
				                </center>
			                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			                </div>
			            </div>
			        </div>
			    </div>
			</xsl:template>

			<!-- Input Form Template -->
			<xsl:template name='BInputform'>
				<xsl:param name="tIFLayout" select="$vNodeInputFormType"/> 	<!-- M/Modal - I/Inline - S/Separated -->
		
				<xsl:choose>
					<xsl:when test="$tIFLayout='M'">
						<div id="CPN_BInputform" class="modal fade" role="dialog">
					        <div class="modal-dialog modal-xlg">
					            <!-- Modal content-->
					            <div class="modal-content">
					                <div class="modal-header">
					                    <button type="button" class="close" data-dismiss="modal">X</button>
					                    <h4 class="modal-title">
					                    	<xsl:if test="$vUseDataModel='Y'">
					                    		Prompts for Report '<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_name"/>' :
					                    	</xsl:if>
											<xsl:if test="$vUseDataModel='N'">
												Generated Prompts for Report <xsl:value-of select="//dbqueries/label"/> - <xsl:value-of select="//dbqueries/description"/><small> (Based on parameters in DBWeb)</small> 
											</xsl:if>
					                    </h4>
					                </div>
					                <div class="modal-body">
										<xsl:if test="$vUseDataModel='Y'">
											<xsl:call-template name="BListOfPrompts"/>
										</xsl:if>
										<xsl:if test="$vUseDataModel='N'">
											<xsl:call-template name="BListOfPromptsNoDataModel"/>
										</xsl:if>
					                </div>
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					                </div>
					            </div>
					        </div>
					    </div>
					</xsl:when>
					<xsl:when test="$tIFLayout='I'">
						<xsl:if test="$vUseDataModel='Y'">
							<xsl:call-template name="BListOfPrompts">
								<xsl:with-param name="tLOPHidden" select="'Y'" />
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$vUseDataModel='N'">
							<xsl:call-template name="BListOfPromptsNoDataModel">
								<xsl:with-param name="tLOPHidden" select="'Y'" />
							</xsl:call-template>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="$vUseDataModel='Y'">
							<xsl:call-template name="BListOfPrompts">
								<xsl:with-param name="tLOPHidden" select="'N'" />
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$vUseDataModel='N'">
							<xsl:call-template name="BListOfPromptsNoDataModel">
								<xsl:with-param name="tLOPHidden" select="'N'" />
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:template>
			<!-- Input Form Template -->
			<xsl:template name='BListOfPrompts'>
				<xsl:param name="tLOPHidden" select="'N'"/>				<!-- Prompt Hidden N (No - Default)/Y Yes -->
				
				<script>
					function StoreRDWS () {
						var Report_Settings = {};
						<xsl:for-each select="//dbquery[@id='Report_Prompt']/rows/row">
							DParam = "<xsl:value-of select='@dbn_repp_param'/>";
							VParam=$("#id_"+DParam).val();
							if (VParam){
								str = "Report_Settings.p_"+DParam+"=DParam+'='+VParam;"
								eval(str);
							};
						</xsl:for-each>
						localStorage.setItem('CPN'+"<xsl:value-of select='$vRID'/>", JSON.stringify(Report_Settings));
						alert('Default Parameters Successfully Stored in you IE Browser. Use Redirect to call this Report ...');
					};
								
					function RetrieveRDWS(){
						PARAM = $.parseJSON(localStorage.getItem('CPN'+"<xsl:value-of select='$vRID'/>"));
						if (PARAM){				
							vhtml=""
							addurl=""
							<xsl:for-each select="//dbquery[@id='Report_Prompt']/rows/row">
							DParam = "<xsl:value-of select='@dbn_repp_param'/>";				
								//check if parameter is filled
								RepParam=eval("PARAM.p_"+DParam);
								if (RepParam){
									WSParam = "PARAM.p_"+DParam;
									WSParamValFull = eval(WSParam);
									WSParamValPart = WSParamValFull.split('=');
									$('#id_<xsl:value-of select='@dbn_repp_param'/>').val(WSParamValPart[WSParamValPart.length-1]);
									
								};
							</xsl:for-each>
						} else {
							alert("The Storage Object requested does not exist.");
						}
					}	
					function DeleteRDWS(){
						localStorage.removeItem('CPN'+"<xsl:value-of select='$vRID'/>");
						delete window.localStorage['CPN'+"<xsl:value-of select='$vRID'/>"];
						alert("The Storage Object is deleted.");
					}	
				</script>
										
				<div id="BListOfPrompts" style="width:90%;margin:0 auto;">
					<xsl:if test="$tLOPHidden='Y'">
                    	<xsl:attribute name="style">display:none;width:90%;margin:0 auto;</xsl:attribute>
                    </xsl:if>
                    <div class="row">
                        <div class="col-md-12">
	
							<br/>
							<!--overrules bootstrap style to make form smaller & additional collapseble panel styling-->
							<style>
								.form-group{margin-bottom: 10px; font-size:12px; line-height:1.3;}
								.form-control{font-size:12px; height:30px; line-height:1.3;}
								i.glyphicon-chevron-up, i.glyphicon-chevron-down {cursor:pointer;}
							</style>
							<!-- Global variables -->
							<xsl:variable name="link" select="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_url" />

							<!--Form to insert parameters-->
							<form id="inputform" class="form-horizontal " role="form" data-toggle="validator" action="/../../../LRF/XMLWeb/ProcessDescriptor/descriptor/{$link}" method="get" >	<!-- Use "get" to allow export to Excel via button in report-->
								<!-- portion to call a field for each parameter-->
								<xsl:for-each select = "//dbquery[@id='Report_Prompt']/rows/row">
									<xsl:sort select="@dbn_repp_param_order" />
									<!-- Define column width for prompt parameters -->
									<xsl:variable name="vCOLWIDTH">
										<xsl:choose>
											<xsl:when test="$vNodeInputFormType='M'">col-sm-6</xsl:when>
											<xsl:otherwise>col-sm-4</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!-- Set label according to the choosen language -->
									<xsl:variable name="lblPrompt">
										<xsl:choose>
											<xsl:when test="lower-case($vLANG) = 'nl'">
												<xsl:value-of select="if (@dbn_repp_param_name_nl='') then @dbn_repp_param_name else @dbn_repp_param_name_nl"/>
											</xsl:when>
											<xsl:when test="lower-case($vLANG) = 'fr'">
												<xsl:value-of select="if (@dbn_repp_param_name_fr='') then @dbn_repp_param_name else @dbn_repp_param_name_fr"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@dbn_repp_param_name"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!-- Set help according to langauge -->
									<xsl:variable name="helpText">
										<xsl:choose>
											<xsl:when test="lower-case($vLANG) = 'nl'">
												<xsl:value-of select="@dbn_repp_param_remark_nl"/>
											</xsl:when>
											<xsl:when test="lower-case($vLANG) = 'fr'">
												<xsl:value-of select="@dbn_repp_param_remark_fr"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="@dbn_repp_param_remark"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!-- Set no help according to langauge -->
									<xsl:variable name="noHelpText">
										<xsl:choose>
											<xsl:when test="lower-case($vLANG) = 'nl'">
												Geen helptekst voorzien!
											</xsl:when>
											<xsl:when test="lower-case($vLANG) = 'fr'">
												Aucun texte d&#39;aide fournie!
											</xsl:when>
											<xsl:otherwise>
												No help provided!
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!-- Avoid to display NULL when no default parameter has been assigned-->
									<xsl:variable name="vVALUE">
										<xsl:variable name="vParam">
											<xsl:value-of select="@dbn_repp_param" />
										</xsl:variable><!--required for the next variable. It assures that the correct active value per parameter is selected-->
										<xsl:variable name="vCURRENTPARAM">
											<xsl:apply-templates select="//dbquery[@id='Report_Prompt']/rows/row[@dbn_repp_param=$vParam]" />
										</xsl:variable><!--Selects the active parameter if it exists. If a default value is defined in the xml this one is chosen when the user omits it-->			
										<xsl:variable name="vEXISTS">
											<xsl:apply-templates select="//dbquery[@id='Report_Prompt']/rows/row[@dbn_repp_param=$vParam]" />
										</xsl:variable><!-- Variable checks if the variable above has content-->
										<xsl:choose>		
											<xsl:when test="$vEXISTS!=''">
												<xsl:value-of select="$vCURRENTPARAM"/>
											</xsl:when><!-- If there is an active parameter it is displayed as default value-->
											<xsl:when test="@dbn_repp_param_default='NULL'">
											</xsl:when><!-- if there is no active parameter and there is a default parameter, the latter is displayed. Avoids also that NULL is displayed when there is no active and no default parameter-->
											<xsl:otherwise>
												<xsl:value-of select="@dbn_repp_param_default" /><!-- THIS FIELD DOESN'T EXIST IN DATABASE !!! -->
											</xsl:otherwise>
										</xsl:choose>	
									</xsl:variable>
									<!-- displays help addon if there is a help text for the parameter field-->
									<xsl:variable name="vHELP">
										<xsl:choose>
											<xsl:when test="@dbn_repp_param_remark='NULL'">
												<xsl:if test="lower-case(@dbn_repp_param_format)='datepicker'">
													<span class="input-group-addon" aria-hidden="true">
													<i class="glyphicon glyphicon-calendar"/></span>
												</xsl:if>
												<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-title="Parameter Help" data-content="{$noHelpText}">
												<span class="glyphicon glyphicon-question-sign"/></span>
											</xsl:when><!--For some reason 'null' is required on localhost and '' on 15wwsleas101504-->
											<xsl:when test="@dbn_repp_param_remark=''">
												<xsl:if test="lower-case(@dbn_repp_param_format)='datepicker'">
													<span class="input-group-addon" aria-hidden="true">
													<i class="glyphicon glyphicon-calendar"/></span>
												</xsl:if>
												<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-title="Parameter Help" data-content="{$noHelpText}">
												<span class="glyphicon glyphicon-question-sign"/></span>
											</xsl:when><!--For some reason 'null' is required on localhost and '' on 15wwsleas101504-->
											<xsl:otherwise>
												<xsl:if test="lower-case(@dbn_repp_param_format)='datepicker'">
													<span class="input-group-addon" aria-hidden="true">
													<i class="glyphicon glyphicon-calendar"/></span>
												</xsl:if>
												<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-title="Parameter Help" data-content="{$helpText}">
												<span class="glyphicon glyphicon-question-sign"/></span>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!--the class form-group is required for the validator-->
									<div class="form-group {$vCOLWIDTH}">
										<label for="{@dbn_repp_param}" class="col-sm-4 control-label">
											<xsl:choose>
												<xsl:when test="lower-case(@dbn_repp_param_type)='checkbox'">
													&#160;
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$lblPrompt" />:
												</xsl:otherwise>
											</xsl:choose>
										</label>
										<div class="col-sm-8">
											<xsl:choose>
												<!-- Dropdown -->
												<xsl:when test="lower-case(@dbn_repp_param_type)='drop-down'">
													<xsl:variable name='vparam' select="@dbn_repp_param"/>
													<div class="input-group">
														<xsl:element name='select'>
															<xsl:attribute name='id'>id_<xsl:value-of select="$vparam"/></xsl:attribute>	
															<xsl:attribute name='name'><xsl:value-of select="$vparam"/></xsl:attribute>	
															<xsl:attribute name='class'>form-control</xsl:attribute>
															<xsl:variable name='LOVVal'><xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name=$vparam]/attribute::value"/></xsl:variable>
															<script type="text/javascript">
																 var DDContent = [<xsl:value-of select='@dbn_repp_param_type_detail'/>]
																 MRN_ComboBox(DDContent,'<xsl:value-of select='$LOVVal'/>');
															</script>
														</xsl:element>
														<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
													</div>
												</xsl:when>
												<!-- is the field mandatory-->
												<xsl:when test="lower-case(@dbn_repp_param_mandatory)= 'y' ">
													<xsl:choose>
														<xsl:when test="lower-case(@dbn_repp_param_type)='wildcards not allowed'"><!-- are wildcards allowed-->
															<div class="input-group">
																<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="This field is required"><span class="glyphicon glyphicon-hand-down"/></span>
																<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="Wildcards not allowed [%,*,...]"><span class="glyphicon glyphicon-exclamation-sign"/></span>
																<input type="text" class="form-control input-sm {@dbn_repp_param_format}" id="id_{@dbn_repp_param}" name="{@dbn_repp_param}" value="{$vVALUE}" required="true" data-error="The field is mandatory and wildcards are not allowed">
																	<xsl:choose>
																		<xsl:when test="lower-case(@dbn_repp_param_format)='datepicker'">
																			<xsl:attribute name="pattern">^(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$</xsl:attribute>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:attribute name="pattern">[a-zA-Z0-9-]*</xsl:attribute>
																		</xsl:otherwise>
																	</xsl:choose>
																</input>
																<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
															</div>
														</xsl:when>
														<xsl:otherwise>
															<div class="input-group">
																<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="This field is required"><span class="glyphicon glyphicon-hand-down"/></span>
																<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="Wildcards allowed [%,*,...]"><span class="glyphicon glyphicon-asterisk"/></span>
																<input type="text" class="form-control input-sm {@dbn_repp_param_format}" id="id_{@dbn_repp_param}" name="{@dbn_repp_param}" value="{$vVALUE}" required="true">
																	<xsl:if test="lower-case(@dbn_repp_param_format)='datepicker'">
																		<xsl:attribute name="pattern">^(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$</xsl:attribute>
																	</xsl:if>
																</input>
																<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
															</div>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<!-- for non mandatory fields, check if wildcards are allowed-->
												<xsl:otherwise>
													<xsl:choose>
														<xsl:when test="lower-case(@dbn_repp_param_type)='checkbox'"><!-- checkbox is never mandatory -->
															<div class="input-group">
																<span class="input-group-addon">
																	<input type="checkbox" id="id_{@dbn_repp_param}" name="{@dbn_repp_param}" aria-label="checkbox">
																		<xsl:variable name='vparam'><xsl:value-of select="@dbn_repp_param"/></xsl:variable>
																		<xsl:if test="lower-case(//dbquery[@id='Report_Prompt']/descriptor/parameters/param[@name=$vparam]/attribute::value)='on'">
																			<xsl:attribute name="checked">checked</xsl:attribute>
																		</xsl:if>
																	</input>
																</span>
																<input type="text" class="form-control" placeholder="{$lblPrompt}" aria-label="cb_placeholder" readonly="readonly"/>
																<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
															</div>
														</xsl:when>
														<xsl:when test="lower-case(@dbn_repp_param_type)='wildcards not allowed'"><!-- are wildcards allowed-->
															<div class="input-group">
																<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="Wildcards not allowed [%,*,...]"><span class="glyphicon glyphicon-exclamation-sign"/></span>
																<input type="text" class="form-control input-sm {@dbn_repp_param_format}" id="id_{@dbn_repp_param}" name="{@dbn_repp_param}" value="{$vVALUE}" data-error="Wildcards are not allowed">
																	<xsl:choose>
																		<xsl:when test="lower-case(@dbn_repp_param_format)='datepicker'">
																			<xsl:attribute name="pattern">^(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$</xsl:attribute>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:attribute name="pattern">[a-zA-Z0-9-]*</xsl:attribute>
																		</xsl:otherwise>
																	</xsl:choose>
																</input>
																<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
															</div>
														</xsl:when>
														<xsl:otherwise>
															<div class="input-group">
																<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="Wildcards allowed [%,*,...]"><span class="glyphicon glyphicon-asterisk"/></span>
																<input type="text" class="form-control input-sm {@dbn_repp_param_format}" id="id_{@dbn_repp_param}" name="{@dbn_repp_param}" value="{$vVALUE}" >
																	<xsl:if test="lower-case(@dbn_repp_param_format)='datepicker'">
																		<xsl:attribute name="pattern">^(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$</xsl:attribute>
																	</xsl:if>
																</input>
																<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
															</div>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:otherwise>
											</xsl:choose>
										</div>
										<div class="col-sm-offset-4 text-center help-block with-errors"></div><!--BUG: must be outside input div when showing input-group-addons in input fields-->
									</div>
								</xsl:for-each>
								
								<div class="form-group col-sm-12">
									<!-- Add pRID always but hidden -->
									<xsl:element name='input'>
										<xsl:attribute name='type'>hidden</xsl:attribute>
										<xsl:attribute name='id'>id_pRID</xsl:attribute>
										<xsl:attribute name='name'>pRID</xsl:attribute>
										<xsl:attribute name='value'><xsl:value-of select="$vRID"/></xsl:attribute>
									</xsl:element>
									<!-- pLANG -->
									<!--xsl:variable name="vCOLWIDTH">
										<xsl:choose>
											<xsl:when test="$vNodeInputFormType='M'">col-sm-4</xsl:when>
											<xsl:otherwise>col-sm-4</xsl:otherwise>
										</xsl:choose>
									</xsl:variable-->
									<xsl:variable name="vHELP">
										<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-title="Help" data-content="Report Language">
										<span class="glyphicon glyphicon-question-sign"/></span>
									</xsl:variable>
								
								<div class="panel panel-info col-sm-9"><!-- START OPTION PANEL -->
									<div class="panel-heading" style="background:none;">
										<i class="glyphicon glyphicon-cog"></i> 
										<script>
											PARAM = $.parseJSON(localStorage.getItem('CPN'+"<xsl:value-of select='$vRID'/>"));
											if (PARAM) {
												<!-- Local Storage Present -->
												document.write(' Report options : Default Values Found');
											} else {
												document.write(' Report options : <b>No Default Values Found</b>. Define a default value can be usefull ...');
											}
										</script>
										<span class="pull-right collapsible"><i class="glyphicon glyphicon-chevron-up"></i></span>
									</div>
									<div class="panel-body">
									
										<!-- Add language selector -->
										<label for="pLANG">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="$vNodeInputFormType='M'">control-label col-sm-2</xsl:when>
													<xsl:otherwise>control-label col-sm-1</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>Language :
										</label>
										<div>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="$vNodeInputFormType='M'">col-sm-4</xsl:when>
													<xsl:otherwise>col-sm-2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<div class="input-group">
												<xsl:element name='select'>
													<xsl:attribute name='id'>id_pLANG</xsl:attribute>
													<xsl:attribute name='name'>pLANG</xsl:attribute>
													<xsl:attribute name='class'>form-control</xsl:attribute>
													<!-- Use of Substring and Distinct to isolate double parameters created by usage of WS MRN_METADATA -->	
													<xsl:variable name='LOVVal' select="substring(distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value),1,2)"/>
													<script type="text/javascript">
														var DDContentL = ['EN','EN','FR','FR','NL','NL']
														MRN_ComboBox(DDContentL,'<xsl:value-of select='$LOVVal'/>');
													</script>
												</xsl:element>
												<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
											</div>
										</div>
										
										<xsl:if test="//dbquery[@id='Report_Info']/rows/row[1]/@dbn_rep_kpi!=''">
											<!-- Add Historical Parameter --><!-- pHIST -->
											<!--xsl:variable name="vCOLWIDTH">col-sm-6</xsl:variable-->
											<xsl:variable name="vHELP">
												<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-title="Help" data-content="Report Language">
												<span class="glyphicon glyphicon-question-sign"/></span>
											</xsl:variable>
											
											<div>
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="$vNodeInputFormType='M'">form-group col-sm-8</xsl:when>
														<xsl:otherwise>form-group col-sm-3</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												
												<label for="pHIST">
													<xsl:attribute name="class">
														<xsl:choose>
															<xsl:when test="$vNodeInputFormType='M'">control-label col-sm-2</xsl:when>
															<xsl:otherwise>control-label col-sm-1</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													Historical :
												</label>
												<div>
													<xsl:attribute name="class">
														<xsl:choose>
															<xsl:when test="$vNodeInputFormType='M'">col-sm-10</xsl:when>
															<xsl:otherwise>col-sm-2</xsl:otherwise>
														</xsl:choose>
													</xsl:attribute>
													<div class="input-group">
														<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="This field is required"><span class="glyphicon glyphicon-hand-down"/></span>
														<span class="input-group-addon" aria-hidden="true" data-toggle="popover" data-placement="bottom" data-trigger="hover" data-content="Wildcards not allowed [%,*,...]"><span class="glyphicon glyphicon-exclamation-sign"/></span>
														<xsl:element name='select'>
															<xsl:attribute name='id'>id_pHIST</xsl:attribute>
															<xsl:attribute name='name'>pHIST</xsl:attribute>	
															<xsl:attribute name='class'>form-control</xsl:attribute>
															<xsl:variable name='LOVVal' select="//dbquery[1]/descriptor/parameters/param[@name='pHIST']/@value"/>
															<script type="text/javascript">
																 var DDContentH = ['YES','Yes (Show Historical)','NO','No (Historical not Shown)']
																 MRN_ComboBox(DDContentH,'<xsl:value-of select='$LOVVal'/>');
															</script>
														</xsl:element>
														<xsl:copy-of select="$vHELP"/><!-- Parameter Help -->
													</div>
												</div>
											</div>

											<!-- Add KPI Classical Prompts hidden -->
											<xsl:element name='input'>
												<xsl:attribute name='type'>hidden</xsl:attribute>
												<xsl:attribute name='id'>id_pKPI</xsl:attribute>
												<xsl:attribute name='name'>pKPI</xsl:attribute>
												<xsl:attribute name='value'><xsl:value-of select="$vKPI"/></xsl:attribute>
											</xsl:element>
											<xsl:element name='input'>
												<xsl:attribute name='type'>hidden</xsl:attribute>
												<xsl:attribute name='id'>id_pEXPLORE</xsl:attribute>
												<xsl:attribute name='name'>pEXPLORE</xsl:attribute>
												<xsl:attribute name='value'>YES</xsl:attribute>
											</xsl:element>
										</xsl:if>
										<div class="form-group col-sm-6">
											<div class="btn-toolbar" aria-label="Default values toolbar" role="toolbar">
												<div class="btn-group btn-group-sm" role="group0" aria-label="Text label">
													<button class="btn btn-default" disabled="disabled">Default Values : </button>
												</div>
												<div class="btn-group btn-group-sm" role="group1" aria-label="Get values">
													<button type="button" class="btn btn-warning" onClick="RetrieveRDWS()">Retrieve</button>
												</div>
												<div class="btn-group btn-group-sm" role="group2" aria-label="Save values">
													<button type="button" class="btn btn-info" onClick="StoreRDWS()">Save</button>
												</div>
												<div class="btn-group btn-group-sm" role="group3" aria-label="Delete values">
													<button type="button" class="btn btn-danger" onClick="DeleteRDWS()">Delete</button>
												</div>
											</div>
											 
										</div>
									</div>
									</div><!-- END OF OPTION PANEL -->
									<div class="form-group text-center col-sm-3">
										<button type="submit" class="btn btn-primary">Execute query</button>
									</div>
								</div>
							
							</form>
							<script>
								 // Collapsible panel
								$(document).on('click', '.panel-heading span.collapsible', function(e){
									var $this = $(this);
									if(!$this.hasClass('panel-collapsed')) {
										$this.parents('.panel').find('.panel-body').slideUp();
										$this.addClass('panel-collapsed');
										$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
									} else {
										$this.parents('.panel').find('.panel-body').slideDown();
										$this.removeClass('panel-collapsed');
										$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
									}
								});
								
								$(document).ready(function(){
									// Close the options panel
									$('.collapsible').click();
									// Bind datepicker classes
									$('.datepicker').datepicker({
										format: "yyyy-mm-dd",
										weekStart: 1,
										calendarWeeks: true,
										autoclose: true,
										todayHighlight: true,
										orientation: 'bottom left'
									});
									//Allow popovers, required for info and help button
									$('[data-toggle="popover"]').popover();
								});
							</script>
						</div>
					</div>
            	</div>
			</xsl:template>
			<!-- Input Form Template WITHOUT Usage of Report DataModel -->
			<xsl:template name='BListOfPromptsNoDataModel'>
				<xsl:param name="tLOPHidden" select="'N'"/>				<!-- Prompt Hidden N (No - Default)/Y Yes -->
				
				<script>
					function StoreRDWS () {
						var Report_Settings = {};
						<xsl:for-each select="//dbquery[@id='Report_Prompt']/rows/row">
							DParam = "<xsl:value-of select='@dbn_repp_param'/>";
							VParam=$("#id_"+DParam).val();
							if (VParam){
								str = "Report_Settings.p_"+DParam+"=DParam+'='+VParam;"
								eval(str);
							};
						</xsl:for-each>
						localStorage.setItem('CPN'+"<xsl:value-of select='$vRID'/>", JSON.stringify(Report_Settings));
						alert('Default Parameters Successfully Stored in you IE Browser. Use Redirect to call this Report ...');
					};
								
					function RetrieveRDWS(){
						PARAM = $.parseJSON(localStorage.getItem('CPN'+"<xsl:value-of select='$vRID'/>"));
						if (PARAM){				
							vhtml=""
							addurl=""
							<xsl:for-each select="//dbquery[@id='Report_Prompt']/rows/row">
							DParam = "<xsl:value-of select='@dbn_repp_param'/>";				
								//check if parameter is filled
								RepParam=eval("PARAM.p_"+DParam);
								if (RepParam){
									WSParam = "PARAM.p_"+DParam;
									WSParamValFull = eval(WSParam);
									WSParamValPart = WSParamValFull.split('=');
									$('#id_<xsl:value-of select='@dbn_repp_param'/>').val(WSParamValPart[WSParamValPart.length-1]);
									
								};
							</xsl:for-each>
						} else {
							alert("The Storage Object requested does not exist.");
						}
					}	
					function DeleteRDWS(){
						localStorage.removeItem('CPN'+"<xsl:value-of select='$vRID'/>");
						delete window.localStorage['CPN'+"<xsl:value-of select='$vRID'/>"];
						alert("The Storage Object is deleted.");
					}	
				</script>
										
				<div id="BListOfPrompts" style="width:90%;margin:0 auto;">
					<xsl:if test="$tLOPHidden='Y'">
                    	<xsl:attribute name="style">display:none;width:90%;margin:0 auto;</xsl:attribute>
                    </xsl:if>
                    <div class="row">
                        <div class="col-md-12">
							<br/>
							<!--overrules bootstrap style to make form smaller & additional collapseble panel styling-->
							<style>
								.form-group{margin-bottom: 10px; font-size:12px; line-height:1.3;}
								.form-control{font-size:12px; height:30px; line-height:1.3;}
								i.glyphicon-chevron-up, i.glyphicon-chevron-down {cursor:pointer;}
							</style>
							<!--Form to insert parameters-->
							<form id="inputform" class="form-horizontal " role="form" data-toggle="validator" action="" method="get" >	<!-- Use "get" to allow export to Excel via button in report-->
								<!-- portion to call a field for each parameter-->
								<xsl:for-each select = "//dbquery[1]/descriptor/parameters/param[not(contains(@name,'pc'))]">
									<!-- Define column width for prompt parameters -->
									<xsl:variable name="vCOLWIDTH">
										<xsl:choose>
											<xsl:when test="$vNodeInputFormType='M'">col-sm-6</xsl:when>
											<xsl:otherwise>col-sm-4</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<!-- Set label according to the choosen language -->
									<xsl:variable name="lblPrompt">										
										<xsl:value-of select="@name"/>
									</xsl:variable>
									
									<!-- Avoid to display NULL when no default parameter has been assigned-->
									<xsl:variable name="vVALUE">
										<xsl:variable name="vParam">
											<xsl:value-of select="@name" />
										</xsl:variable><!--required for the next variable. It assures that the correct active value per parameter is selected-->
										<xsl:variable name="vCURRENTPARAM">
											<xsl:apply-templates select="//dbquery[1]/descriptor/parameters/param[@name=$vParam]" />
										</xsl:variable><!--Selects the active parameter if it exists. If a default value is defined in the xml this one is chosen when the user omits it-->			
										<xsl:variable name="vEXISTS">
											<xsl:apply-templates select="//dbquery[1]/descriptor/parameters/param[@name=$vParam]" />
										</xsl:variable><!-- Variable checks if the variable above has content-->
										<xsl:choose>		
											<xsl:when test="$vEXISTS!=''">
												<xsl:value-of select="$vCURRENTPARAM"/>
											</xsl:when><!-- If there is an active parameter it is displayed as default value-->
											<xsl:when test="@dbn_repp_param_default='NULL'">
											</xsl:when><!-- if there is no active parameter and there is a default parameter, the latter is displayed. Avoids also that NULL is displayed when there is no active and no default parameter-->
											<xsl:otherwise>
												<xsl:value-of select="@dbn_repp_param_default" /><!-- THIS FIELD DOESN'T EXIST IN DATABASE !!! -->
											</xsl:otherwise>
										</xsl:choose>	
									</xsl:variable><!--the class form-group is required for the validator-->
									<div class="form-group {$vCOLWIDTH}">
										<label for="{$lblPrompt}" class="col-sm-4 control-label">
											<xsl:value-of select="$lblPrompt" />:
										</label>
										<div class="col-sm-8">
											<div class="input-group">
												<input type="text" class="form-control input-sm" id="id_{@name}" name="{@name}" value="{$vVALUE}" >
												</input>
											</div>
										</div>
										<div class="col-sm-offset-4 text-center help-block with-errors"></div><!--BUG: must be outside input div when showing input-group-addons in input fields-->
									</div>
								</xsl:for-each>
								
								<div class="form-group col-sm-12">
									
									<div class="panel panel-info col-sm-9"><!-- START OPTION PANEL -->
										<div class="panel-heading" style="background:none;">
											<i class="glyphicon glyphicon-cog"></i> 
											<script>
												PARAM = $.parseJSON(localStorage.getItem('CPN'+"<xsl:value-of select='$vRID'/>"));
												if (PARAM) {
													<!-- Local Storage Present -->
													document.write(' Report options : Default Values Found');
												} else {
													document.write(' Report options : <b>No Default Values Found</b>. Define a default value can be usefull ...');
												}
											</script>
											<span class="pull-right collapsible"><i class="glyphicon glyphicon-chevron-up"></i></span>
										</div>
										<div class="panel-body">
										
											<!-- Add language selector -->
											<label for="pLANG">
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="$vNodeInputFormType='M'">control-label col-sm-2</xsl:when>
														<xsl:otherwise>control-label col-sm-1</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>Language :
											</label>
											<div>
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="$vNodeInputFormType='M'">col-sm-4</xsl:when>
														<xsl:otherwise>col-sm-2</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<div class="input-group">
													<xsl:element name='select'>
														<xsl:attribute name='id'>id_pLANG</xsl:attribute>
														<xsl:attribute name='name'>pLANG</xsl:attribute>
														<xsl:attribute name='class'>form-control</xsl:attribute>
														<!-- Use of Substring and Distinct to isolate double parameters created by usage of WS MRN_METADATA -->	
														<xsl:variable name='LOVVal' select="substring(distinct-values(//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value),1,2)"/>
														<script type="text/javascript">
															var DDContentL = ['EN','EN','FR','FR','NL','NL']
															MRN_ComboBox(DDContentL,'<xsl:value-of select='$LOVVal'/>');
														</script>
													</xsl:element>
												</div>
											</div>
											<div class="form-group col-sm-6">
												<div class="btn-toolbar" aria-label="Default values toolbar" role="toolbar">
													<div class="btn-group btn-group-sm" role="group0" aria-label="Text label">
														<button class="btn btn-default" disabled="disabled">Default Values : </button>
													</div>
													<div class="btn-group btn-group-sm" role="group1" aria-label="Get values">
														<button type="button" class="btn btn-warning" onClick="RetrieveRDWS()">Retrieve</button>
													</div>
													<div class="btn-group btn-group-sm" role="group2" aria-label="Save values">
														<button type="button" class="btn btn-info" onClick="StoreRDWS()">Save</button>
													</div>
													<div class="btn-group btn-group-sm" role="group3" aria-label="Delete values">
														<button type="button" class="btn btn-danger" onClick="DeleteRDWS()">Delete</button>
													</div>
												</div>
												 
											</div>
										</div>
									</div><!-- END OF OPTION PANEL -->
									<div class="form-group text-center col-sm-3">
										<button type="submit" class="btn btn-primary">Execute query</button>
									</div>
								</div>
							
							</form>
							<script>
								 // Collapsible panel
								$(document).on('click', '.panel-heading span.collapsible', function(e){
									var $this = $(this);
									if(!$this.hasClass('panel-collapsed')) {
										$this.parents('.panel').find('.panel-body').slideUp();
										$this.addClass('panel-collapsed');
										$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
									} else {
										$this.parents('.panel').find('.panel-body').slideDown();
										$this.removeClass('panel-collapsed');
										$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
									}
								});
								
								$(document).ready(function(){
									// Close the options panel
									$('.collapsible').click();
									//Allow popovers, required for info and help button
									$('[data-toggle="popover"]').popover();
								});
							</script>
						</div>
					</div>
            	</div>
			</xsl:template>
			<!-- Template required to search for the active parameter (WITH DataModel) -->
			<xsl:template match="//dbquery[@id='Report_Prompt']/rows/row">
				<xsl:variable name="vParameter" select="@dbn_repp_param"/>
				<xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name=$vParameter]/@value"/>
			</xsl:template>
			<!-- Template required to search for the active parameter (WITHOUT DataModel) -->
			<xsl:template match="//dbquery[1]/descriptor/parameters/param">
				<xsl:variable name="vParameter" select="@name"/>
				<xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name=$vParameter]/@value"/>
			</xsl:template> 

		
	<!-- Framework 2 - Depreacated Please Do Not Use -->
		<xsl:template name="Warning"> 				<!-- v2 - DEPREACATED Template used to communicate to user info about Report Changing Status -->
			<xsl:param name="tType" select="'0'"/>
			<xsl:param name="tURL" select="123"/>
			
			<xsl:call-template name="TNotif">
				<xsl:with-param name="tMsg" select="'This Report Uses Template Warning which is Depreacated. It will be removed next CPN Update. If you see this message, please inform Node Manager that Report has to be adapted. Thank You. CPN Core Development Team'"/>
				<xsl:with-param name="tTitle" select="'T66 - Template Warning'"/> 
				<xsl:with-param name="tType" select="4"/> 	
				<xsl:with-param name="tAppear" select="1000"/>
				<xsl:with-param name="tDuration" select="3000"/>  	
			</xsl:call-template>	
			<center>
				<table border="0" align="center" width="100%" class="MRFoot">
					<thead>
						<th class="MRFoot">
							<xsl:attribute name="onclick">
								if(Warning_INFO.style.display=='none'){Warning_INFO.style.display='block';imgWI.src='/<xsl:value-of select='$vHtDocsConfig'/>/CPN/img/down-bl.png'} else {Warning_INFO.style.display='none';imgWI.src='/<xsl:value-of select='$vHtDocsConfig'/>/CPN/img/up-bl.png'};
							</xsl:attribute>
							<xsl:attribute name="style"> style="cursor:pointer;"</xsl:attribute>
							<a href='#'>
								<img src="/Default2/MRN_Prod/img/Circle_Info48c.png" border="0px" width="20px"/>
								Important Communication for User : 
								<b><font color="red">
									<xsl:call-template name="FromDic2Rep">
										<xsl:with-param name="Title2S" select="concat('WARNING_',$tType)"/>
										<xsl:with-param name="Lang" select="$vLANG"/>
										<xsl:with-param name="dictionary" select="document('IL_MR_RepDic.xml')"/>
										<xsl:with-param name="tDDKey" select="303"/>
									</xsl:call-template>
								</font></b>
								<img src="/Default2/MRN_Prod/img/Circle_Info48c.png" border="0px" width="20px"/>
							</a>
						</th>
					</thead>
					<tr id="Warning_INFO" style="display:none">
						<td style="background-color:#ffffff;">
							<xsl:call-template name="FromDic2Rep">
								<xsl:with-param name="Title2S" select="concat('WARNING_',$tType)"/>
								<xsl:with-param name="Lang" select="$vLANG"/>
								<xsl:with-param name="dictionary" select="document('IL_MR_RepDic.xml')"/>
								<xsl:with-param name="tDDKey" select="303"/>
							</xsl:call-template>
							<br/>
							<xsl:if test="$tType='Report_Replaced'">
								The Link (URL) to New Report is ... <value-of select="$tURL"/>
							</xsl:if>
							<xsl:if test="$tType='Report_Soon_Replaced'">
								The Link (URL) to New Report is ... <value-of select="$tURL"/>
							</xsl:if>
							<xsl:if test="$tType='Report_New_Version_In_Acceptance'">
								The Link (URL) to Acceptance Report is
							</xsl:if>
						</td>
					</tr>
				</table>
			</center>
		</xsl:template>
	<!-- Framework 1 - Depreacated Please Do Not Use -->
		<xsl:template name="Debug"> 						<!-- DEPREACATED Used To SHow Debug Messages-->
			<xsl:param name="tMsg" select="'No Message Defined'"/>
			<xsl:call-template name="TNotif">
				<xsl:with-param name="tMsg" select="'Remove usage of this template. It has been replaced by Notaification System (Template TNotif)'"/>
				<xsl:with-param name="tTitle" select="'T07 - Template Debug Depreacated'"/> 
				<xsl:with-param name="tType" select="3"/> 	
				<xsl:with-param name="tAppear" select="1000"/>
				<xsl:with-param name="tDuration" select="3000"/>  	
			</xsl:call-template>	
		</xsl:template>
		<xsl:template name="Report_Header">     			<!-- Global Report Header -->
			<xsl:param name="Conf" select="'MRN'"/> 	<!-- MRN or Local -->
			<xsl:param name="vRepDic" select="'NO'"/> 	<!-- No if No Local Repdic if yes define variain Report with RepDic URL -->
				<!-- 
				<script>
					alert('Template Report_Header Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
				</script>
				-->
				<div id="Header" style="background-color: rgb(255, 255, 255); display:block">
					<table border="0" align="center" width="100%" >		
						<tbody valign='Top'>
							<tr>
								<td width='50%' align='left'>
									<xsl:call-template name="REPORT_H">
										<xsl:with-param name="Conf" select="$Conf"/>
									</xsl:call-template>
								</td>
								<td width='50%' align='right'>
									<xsl:call-template name="REPORT_P">
										<xsl:with-param name="Conf" select="$Conf"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		</xsl:template>
		<xsl:template name="REPORT_H"> 						<!-- Report Info (Top Left block) -->
			<xsl:param name="Conf" select="'MRN'"/>
			<xsl:param name="vRepDic" select="'NO'"/>
				<!-- <script>
					alert('Template REPORT_H Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
				</script>
			-->
			<!-- If pLANG in DBWeb -->
			<xsl:variable name="vLANG"><xsl:value-of select="upper-case(//dbquery[@id='Report_Info']/descriptor/parameters/param[@name='pLANG']/@value)" /></xsl:variable>
			<!-- SET default value to vLANG if pLANG is missing -->
			<xsl:variable name="vLANG">EN</xsl:variable>
			<xsl:choose>
				<xsl:when test="$Conf!='MRN' and count(//dbquery[@id='Report_Prompt']/rows/row)=0">
					<h2>Local Node Report</h2>
				</xsl:when>
				<xsl:when test="count(//dbquery[@id='Report_Prompt']/rows/row)=0">
					No Report Info (Parameter pRID is missing or Report not Defined)
				</xsl:when>
				<xsl:otherwise>
					<table align="left"  width="70%" class="MRHead">
						<thead class="MRHead">
							<th align="left"  width="5%" style='padding:3px 1px 0px 1px'>
								<xsl:element name="a">
									<xsl:attribute name="onclick">
										if(REPORT_H.style.display=='none'){REPORT_H.style.display='block';imgREPORT_H.src="/Default2/MRN_Prod/img/down-bl.png"} else {REPORT_H.style.display='none';imgREPORT_H.src="/Default2/MRN_Prod/img/up-bl.png"};
									</xsl:attribute>
									<xsl:attribute name="style"> style="cursor:pointer</xsl:attribute>
									<img id="imgREPORT_H" style="cursor:pointer;margin-left:5px;margin-right:5px" src="/Default2/MRN_Prod/img/up-bl.png"/>     
								</xsl:element>
							</th>
							<xsl:variable name="DOK"><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row/attribute::Extr_Status"/></xsl:variable>
							<xsl:variable name="EOK"><xsl:value-of select="count(//dbquery/error)"/></xsl:variable>
							<!-- Call template for flag generation -->
							<xsl:call-template name="Quality_Indic">
								<xsl:with-param name="Type" select="'Report'"/>
								<xsl:with-param name="DOK" select="$DOK"/>
								<xsl:with-param name="EOK" select="$EOK"/>		
							</xsl:call-template>
						</thead>
						<tbody>
							<tr id="REPORT_H" style="display:none">
								<td border="0" colspan="8" >
									<table align="left" width="100%">
										<tbody>
											<tr>
												<xsl:for-each select = "//dbquery[@id='Report_Info']/rows/row">
													<tr>
														<td width="30%" align="left"><b>Report Name :</b></td>
														<td align="left">
															<a class="tooltip" href="#">
																<xsl:value-of select='@dbn_rep_name'/> (pRID:<xsl:value-of select='@dbn_rep_id'/>)
																<span class="custom info"><img src="/Default2/MRN_Prod/img/Info.png" alt="Information" height="48" width="48" />
																<em>Information (<xsl:value-of select='$vLANG'/>)</em> 
																<xsl:choose>
																	<xsl:when test="$vLANG = 'NL'"><u>Gedetaillerde Beschrijving</u> :<xsl:value-of select="@dbn_rep_long_desc_nl"/></xsl:when>
																	<xsl:when test="$vLANG = 'FR'"><u>Description Détaillée</u> :<xsl:value-of select="@dbn_rep_long_desc_fr"/></xsl:when>
																	<xsl:when test="$vLANG = 'EN'"><u>Detailled Description</u> :<xsl:value-of select="@dbn_rep_long_desc_en"/></xsl:when>
																	<xsl:otherwise><u>???</u> :<xsl:value-of select="@dbn_rep_long_desc_en"/></xsl:otherwise>
																</xsl:choose>
																<br/>
																<u>Remarks</u> : 
																<xsl:choose>
																	<xsl:when test="$vLANG = 'NL'"><xsl:value-of select="@dbn_rep_remarks_nl"/></xsl:when>
																	<xsl:when test="$vLANG = 'FR'"><xsl:value-of select="@dbn_rep_remarks_fr"/></xsl:when>
																	<xsl:when test="$vLANG = 'EN'"><xsl:value-of select="@dbn_rep_remarks_en"/></xsl:when>
																	<xsl:otherwise><xsl:value-of select="@dbn_rep_remarks_en"/></xsl:otherwise>
																</xsl:choose>
															</span>
														</a>
													</td>
												</tr>
												<tr>
													<td align="left">State :</td>
													<td align="left">
														<a class="tooltip" href="#"><xsl:value-of select='@Extr_Status'/> on <xsl:value-of select='@dbn_rep_node'/>-<xsl:value-of select='@dbn_rep_type'/><span class="custom info"><img src="/Default2/MRN_Prod/img/Info.png" alt="Information" height="48" width="48" /><em>Description</em> <u>Extractions used</u> : <xsl:value-of select='@Views_Used'/></span></a>
													</td>
												</tr>
												<tr>
													<td align="left">Status :</td>
													<td align="left">
														<a  class="tooltip" href="#"><xsl:value-of select='@dbn_rep_status'/> (Ver <xsl:value-of select='@dbn_rep_version'/>)<span class="custom info"><img src="/Default2/MRN_Prod/img/Info.png" alt="Information" height="48" width="48" /><em>Description</em><u>POC</u> : <xsl:value-of select='@dbn_rep_poc'/><br/><u>EMAIL POC</u> : <xsl:value-of select='@dbn_rep_email'/></span></a>
													</td>
												</tr>
												<tr>
													<td align="left">Data Dictionary :</td>
													<td align="left">
														<table width="90%">
															<td width="50%">
																Local : 
																<xsl:choose>
																	<xsl:when test="vRepDic='NO'">
																		<img src="/Default2/MRN_Prod/img/No.png" width="15px"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<img src="/Default2/MRN_Prod/img/Yes.png" width="15px"/>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
															<td>
																ILIAS : 
																<xsl:choose>
																	<xsl:when test="count(//dbquery[@id='ILIAS_DATA_DICTIONARY'])=1">
																		<img src="/Default2/MRN_Prod/img/Yes.png" width="15px"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<img src="/Default2/MRN_Prod/img/No.png" width="15px"/>
																	</xsl:otherwise>
																</xsl:choose>
															</td>
														</table>
													</td>
												</tr>
												<tr>
													<td colspan="10">
														<xsl:variable name="href"><xsl:value-of select='@dbn_rep_url'/></xsl:variable>
														<xsl:variable name="href2"><xsl:value-of select='@dbn_rep_id'/></xsl:variable>
														<table width="100%">
															<thead class="MRHead">	
																<td width="50%" align="center">
																	<a href="#" target="_Print">Printable Version</a>
																</td>
																<td width="50%" align="center">
																	<a href="/LRF/XMLWeb/ProcessDescriptor/descriptor/DBN/DBN_Rep_Status/DBN_Rep_Status.xml?repid={$href2}">More Infos on this Report</a>
																</td>
															</thead>
														</table>
													</td>
												</tr>
											</xsl:for-each>
										</tr>
										<tr>
											<xsl:choose>
												<xsl:when test="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_version = '1.0' ">
													<tr><td colspan="10" align="center">
														This is a new Report
														<xsl:text>   </xsl:text><img src="/DefaultWS/css/images/new_icon.gif" width="30px" style="vertical-align:Top"/>
													</td></tr>
												</xsl:when>
												<xsl:when test="//dbquery[@id='Report_Info']/rows/row/@DayModif = '0' ">
													<tr><td colspan="10" align="center">
														This report has been modified Today (
														<xsl:element name='a'>
															<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
															<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF2/IL_MR_POPUP2/DBN_POPUP_Rep_Logging.xml?repid=<xsl:value-of select="$vRID"/>',800);</xsl:attribute>
															<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
															See Log
														</xsl:element>)
														<xsl:text>   </xsl:text><img src="/DefaultWS/css/images/updated_icon.gif" width="40px" style="vertical-align:center"/>
													</td></tr>
												</xsl:when>
												<xsl:when test="//dbquery[@id='Report_Info']/rows/row/@DayModif = '1' ">
													<tr><td colspan="10" align="center">
														This report has been modified Yesterday (
														<xsl:element name='a'>
															<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
															<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF2/IL_MR_POPUP2/DBN_POPUP_Rep_Logging.xml?repid=<xsl:value-of select="$vRID"/>',800);</xsl:attribute>
															<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
															See Log
														</xsl:element>)
														<xsl:text>   </xsl:text><img src="/DefaultWS/css/images/updated_icon.gif" width="40px" style="vertical-align:center"/>
													</td></tr>
												</xsl:when>
												<xsl:when test="//dbquery[@id='Report_Info']/rows/row/@DayModif &lt; '8' ">
													<tr><td colspan="10" align="center">
														This report has been recently modified (
														<xsl:element name='a'>
															<xsl:attribute name='href'>javascript:void(0);</xsl:attribute>
															<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF2/IL_MR_POPUP2/DBN_POPUP_Rep_Logging.xml?repid=<xsl:value-of select="$vRID"/>',800);</xsl:attribute>
															<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
															See Log
														</xsl:element>)
														<xsl:text>   </xsl:text><img src="/DefaultWS/css/images/updated_icon.gif" width="40px" style="vertical-align:center"/>
													</td></tr>
												</xsl:when>
												<xsl:otherwise>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
									</tbody>				
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:template>
		<xsl:template name="Quality_Indic">					<!-- Report Quality Markers in  -->
			<xsl:param name="Type" select="'Report'"/>
			<xsl:param name="EOK" select="'0'"/>
			<xsl:param name="DOK" select="'OK'"/>
				<!-- <script>
					alert('Template Quality_Indic Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
				</script>
			-->
			<th>
				<xsl:if test="$Type='Report'">
					<xsl:attribute name='colspan'>4</xsl:attribute>
					Report Accuracy : Data 
				</xsl:if>
				<xsl:if test="$Type='KPI'">
					<xsl:attribute name='width'>20%</xsl:attribute>
					Data  
				</xsl:if>
				<xsl:choose>
					<!-- Extraction OK and SQL OK -->
					<xsl:when test="$EOK = '0' and $DOK = 'OK' ">
						<!--<script>alert('Case 1');</script>-->
						<xsl:element name='img'>
							<xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Green</xsl:if><xsl:if test="$Type='KPI'">Yes</xsl:if>.png</xsl:attribute>
							<xsl:attribute name='alt'>All Extractions used are Up-To-Date</xsl:attribute>
							<xsl:attribute name='style'>vertical-align:middle</xsl:attribute>
							<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF2/IL_MR_POPUP2/DBN_POPUP_Rep_Status_Extrac.xml?xxx=1&amp;repid=<xsl:value-of select="$vRID"/>&amp;XXX='+Math.floor(Math.random()*1001),500);</xsl:attribute>
							<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
						</xsl:element>				
						- SQL <img title="The queries used for this Report have been executed correctly" style="vertical-align:middle"><xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Green</xsl:if><xsl:if test="$Type='KPI'">Yes</xsl:if>.png</xsl:attribute></img>
					</xsl:when>
					<!-- Extraction NOK and SQL OK -->
					<xsl:when test="$EOK = '0' and $DOK != 'OK' ">
						<xsl:element name='img'>
							<xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Red</xsl:if><xsl:if test="$Type='KPI'">No</xsl:if>.png</xsl:attribute>
							<xsl:attribute name='width'>16px</xsl:attribute>
							<xsl:attribute name='alt'>All Extractions used are NOT Up-To-Date</xsl:attribute>
							<xsl:attribute name='style'>vertical-align:middle</xsl:attribute>
							<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF2/IL_MR_POPUP2/DBN_POPUP_Rep_Status_Extrac.xml?xxx=6&amp;repid=<xsl:value-of select="$vRID"/>&amp;XXX='+Math.floor(Math.random()*1001),500);</xsl:attribute>
							<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
						</xsl:element>
						- SQL <img title="The queries used for this Report have been executed correctly" style="vertical-align:middle"><xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Green</xsl:if><xsl:if test="$Type='KPI'">Yes</xsl:if>.png</xsl:attribute></img>
					</xsl:when>
					<!-- Extraction OK and SQL NOK -->
					<xsl:when test="$EOK != '0' and $DOK = 'OK' ">
						<!--<script>alert('Case 3');</script>-->
						<xsl:element name='img'>
							<xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Green</xsl:if><xsl:if test="$Type='KPI'">Yes</xsl:if>.png</xsl:attribute>
							<xsl:attribute name='alt'>All Extractions used are Up-To-Date</xsl:attribute>
							<xsl:attribute name='style'>vertical-align:middle</xsl:attribute>
							<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF2/IL_MR_POPUP2/DBN_POPUP_Rep_Status_Extrac.xml?repid=<xsl:value-of select="$vRID"/>&amp;XXX='+Math.floor(Math.random()*1001),500);</xsl:attribute>
							<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
						</xsl:element>
						- SQL <img title="The queries used for this Report have generated errors" style="vertical-align:middle"><xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Red</xsl:if><xsl:if test="$Type='KPI'">No</xsl:if>.png</xsl:attribute><xsl:attribute name='width'>16px</xsl:attribute></img>
					</xsl:when>
					<!-- Extraction NOK and SQL NOK -->
					<xsl:otherwise>
						<!--<script>alert('Case 4');</script>-->
						<xsl:element name='img'>
							<xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Red</xsl:if>
							<xsl:if test="$Type='KPI'">No</xsl:if>.png</xsl:attribute>
							<xsl:attribute name='alt'>All Extractions used are Up-To-Date</xsl:attribute>
							<xsl:attribute name='width'>16px</xsl:attribute>
							<xsl:attribute name='style'>vertical-align:middle</xsl:attribute>
							<xsl:attribute name='onmouseover'>return showPopup('/LRF/XMLWeb/ProcessDescriptor/descriptor/LRF2/IL_MR_POPUP2/DBN_POPUP_Rep_Status_Extrac.xml?xxx=3&amp;repid=<xsl:value-of select="$vRID"/>&amp;XXX='+Math.floor(Math.random()*1001),500);</xsl:attribute>
							<xsl:attribute name='onmouseout'>return nd();</xsl:attribute>
						</xsl:element>
						- SQL <img title="The queries used for this Report have generated errors" style="vertical-align:middle"><xsl:attribute name='src'>/Default2/MRN_Prod/img/<xsl:if test="$Type='Report'">1Box_Red</xsl:if><xsl:if test="$Type='KPI'">No</xsl:if>.png</xsl:attribute><xsl:attribute name='width'>16px</xsl:attribute></img>
					</xsl:otherwise>
				</xsl:choose>
			</th>
		</xsl:template>
		<xsl:template name="REPORT_P"> 						<!-- Bloc Prompts (used in non KPI Reports) -->
		<xsl:param name="Conf" select="'MRN'"/>
			<!-- <script>
				alert('Template REPORT_P Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
			</script>
		-->
		<!-- If pLANG in DBWeb -->
		<xsl:variable name="vLANG"><xsl:value-of select="upper-case(//dbquery[@id='Report_Info']/descriptor/parameters/param[@name='pLANG']/@value)" /></xsl:variable>
		<xsl:variable name="vLANG">
			<xsl:if test="not($vLANG)">EN</xsl:if>
			<xsl:if test="$vLANG=''">EN</xsl:if>
		</xsl:variable>	
		<!-- If pLANG only in URL -->

		<div id="REPORT_SP"  style="background-color: rgb(255,255,255); display:block">
			<xsl:choose>
				<xsl:when test="$Conf!='MRN'">
					<table align="right"  width="70%" class="MRPrompt">
						<thead class="MRPrompt">
							<th align="left"  width="5%" style='padding:3px 1px 0px 1px'>
								<xsl:element name="a">
									<xsl:attribute name="onclick">if(REPORT_P.style.display=='none'){REPORT_P.style.display='block';imgHP.src="/Default2/MRN_Prod/img/down-bl.png"} else {REPORT_P.style.display='none';imgHP.src="/Default2/MRN_Prod/img/up-bl.png"};</xsl:attribute>
									<xsl:attribute name="style"> style="cursor:pointer;</xsl:attribute>
									<img id="imgHP" style="cursor:pointer;margin-left:5px;margin-right:5px" src="/Default2/MRN_Prod/img/up-bl.png"/>     
								</xsl:element>
							</th>
							<th  colspan="2">
								<script>
									var url = window.location.href;                                   // Get the URL.
									if (url.indexOf("mrnode")==-1) {
									if (url.indexOf("localhost")==-1) {
									document.write('<a class="tooltip" href="#"><font color="red">Warning</font><span class="custom info"><img src="/Default2/MRN_Prod/img/Info.png" alt="Information" height="48" width="48" /><u>You are consulting a local report</u></span></a> : ');
									} 
									else {};
									} else {};
								</script>
								<xsl:value-of select="count(//dbquery[1]/descriptor/parameters/param[@name!='pRID'])"/> Local Reports Prompt(s) 
							</th>
						</thead>
						<tr id="REPORT_P" style="display:none">
							<td colspan="2">
								<table border="0" width="100%">
									<form width="100%" style='margin-bottom:0px;' method='get' action="" >
										<tr>
											<td colspan="2">									
												<xsl:element name='input'>
													<xsl:attribute name='type'>hidden</xsl:attribute>
													<xsl:attribute name='name'>pRID</xsl:attribute>
													<xsl:attribute name='value'><xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pRID']/@value"/></xsl:attribute>
												</xsl:element>
											</td>
											<td align="center">
												<xsl:attribute name='rowspan'>
													<xsl:value-of select="count(//dbquery[1]/descriptor/parameters/param)+2"/>
												</xsl:attribute>
												<input type='submit' value='Search'/>
											</td>
										</tr>
										<xsl:for-each select = "//dbquery[1]/descriptor/parameters/param[@name!='pRID']">
											<xsl:variable name="vparam"><xsl:value-of select="@name"/></xsl:variable>
											<tr>
												<td align="left">
													<label style='width:60%' align="left"><a class="tooltip" href="#">
														<xsl:value-of select="substring($vparam,2,100)"/>
														<span class="custom info">
															<img src="/Default2/MRN_Prod/img/Info.png" alt="Information" height="48" width="48" />
															<u>Parameter defined in DBWEB</u> : <xsl:value-of select='$vparam'/>
														</span></a> : 
													</label><br/>
												</td>
												<td align="left">
													<xsl:element name='input'>
														<xsl:attribute name='name'><xsl:value-of select="$vparam"/></xsl:attribute>
														<xsl:attribute name='id'>id<xsl:value-of select="$vparam"/></xsl:attribute>
														<xsl:attribute name='value'><xsl:value-of select="//dbquery[@id='Report_Info']/descriptor/parameters/param[@name=$vparam]/attribute::value"/></xsl:attribute>
													</xsl:element>					
												</td>
											</tr>
										</xsl:for-each>
									</form>	
								</table>		
							</td>
						</tr>
					</table>
				</xsl:when>
				<xsl:when test="count(//dbquery[@id='Report_Prompt']/rows/row)=0">
					No Prompt defined for this report
				</xsl:when>
				<xsl:otherwise>
					<table align="right"  width="70%" class="MRPrompt">
						<thead class="MRPrompt">
							<th align="left"  width="5%" style='padding:3px 1px 0px 1px'>
								<xsl:element name="a">
									<xsl:attribute name="onclick">if(REPORT_P.style.display=='none'){REPORT_P.style.display='block';imgHP.src="/Default2/MRN_Prod/img/down-bl.png"} else {REPORT_P.style.display='none';imgHP.src="/Default2/MRN_Prod/img/up-bl.png"};</xsl:attribute>
									<xsl:attribute name="style"> style="cursor:pointer;</xsl:attribute>
									<img id="imgHP" style="cursor:pointer;margin-left:5px;margin-right:5px" src="/Default2/MRN_Prod/img/up-bl.png"/>     
								</xsl:element>
							</th>
							<th  colspan="2">
								<xsl:value-of select="count(//dbquery[@id='Report_Prompt']/rows/row)"/> Reports Prompt(s)
							</th>
						</thead>
						<tr id="REPORT_P" style="display:none">
							<td colspan="2">
								<xsl:call-template name="List_Prompts"/>
							</td>
						</tr>
					</table>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		</xsl:template>
		<xsl:template name="List_Prompts">					<!-- List Of Prompts (called in All Reports) -->
			<xsl:param name="DBWeb" select="'Report_Prompt'"/>
			<xsl:param name="Action" select="''"/>
			<xsl:param name="vLANG" select="'EN'"/>
				<!-- <script>
					alert('Template List_Prompts Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
				</script>
			-->
			<table border="0" width="100%">
				<form width="100%" style='margin-bottom:0px;' method='get' action="" >
					<xsl:attribute name="action"><xsl:value-of select="$Action"/></xsl:attribute>
					<tr>
						<td colspan="2">									
							<xsl:element name='input'>
								<xsl:attribute name='type'>hidden</xsl:attribute>
								<xsl:attribute name='name'>pRID</xsl:attribute>
								<xsl:attribute name='value'><xsl:value-of select="//dbquery[@id=$DBWeb]/rows/row[1]/@dbn_repp_parid"/></xsl:attribute>
							</xsl:element>
							<!-- Check If KPI Explore Mode -->
							<xsl:variable name="xKPIx"><xsl:value-of select="//dbquery[@id='Report_Info']/rows/row[1]/@dbn_rep_kpi"/></xsl:variable>
							<xsl:choose>
								<xsl:when test="$xKPIx=''">
									<!-- Nada -->
								</xsl:when>
								<xsl:otherwise>
									<xsl:element name='input'>
										<xsl:attribute name='type'>hidden</xsl:attribute>
										<xsl:attribute name='name'>pKPI</xsl:attribute>
										<xsl:attribute name='value'><xsl:value-of select="$xKPIx"/></xsl:attribute>
									</xsl:element>
									<xsl:element name='input'>
										<xsl:attribute name='type'>hidden</xsl:attribute>
										<xsl:attribute name='name'>pEXPLORE</xsl:attribute>
										<xsl:attribute name='value'>Yes</xsl:attribute>
									</xsl:element>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td align="center">
							<xsl:attribute name='rowspan'>
								<xsl:value-of select="count(//dbquery[@id=$DBWeb]/rows/row)+2"/>
							</xsl:attribute>
							<input type='submit' value='Search'/>
						</td>
					</tr>
					<xsl:for-each select = "//dbquery[@id=$DBWeb]/rows/row">
						<xsl:sort select="@dbn_repp_param_order"/>
						<xsl:variable name="vPARAMNAME">
							<xsl:choose>
								<xsl:when test="$vLANG = 'NL'"><xsl:value-of select="@dbn_repp_param_name_nl"/></xsl:when>
								<xsl:when test="$vLANG = 'FR'"><xsl:value-of select="@dbn_repp_param_name_fr"/></xsl:when>
								<xsl:when test="$vLANG = 'EN'"><xsl:value-of select="@dbn_repp_param_name"/></xsl:when>
								<xsl:otherwise><xsl:value-of select="@dbn_repp_param_name"/></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="vPARAMREMARK">							
							<xsl:choose>
								<xsl:when test="$vLANG = 'NL'"><xsl:value-of select="@dbn_repp_param_remark_nl"/></xsl:when>
								<xsl:when test="$vLANG = 'FR'"><xsl:value-of select="@dbn_repp_param_remark_fr"/></xsl:when>
								<xsl:when test="$vLANG = 'EN'"><xsl:value-of select="@dbn_repp_param_remark"/></xsl:when>
								<xsl:otherwise><xsl:value-of select="@dbn_repp_param_remark"/></xsl:otherwise>
							</xsl:choose>
						</xsl:variable>					
						<xsl:variable name="vparam"><xsl:value-of select="@dbn_repp_param"/></xsl:variable>
						<tr>
							<td align="left">
								<label style='width:60%' align="left"><a class="tooltip" href="#">
									<xsl:value-of select='$vPARAMNAME'/>
									<span class="custom info">
										<img src="/Default2/MRN_Prod/img/Info.png" alt="Information" height="48" width="48" />
										<em>Infos on Prompt 
											<xsl:value-of select='$vPARAMNAME'/>
										</em>
										<u>Format</u> : <xsl:value-of select='@dbn_repp_param_format'/><br/>
										<u>Type</u> : <xsl:value-of select='@dbn_repp_param_type'/><br/>
										<u>Remarks</u> : 
										<xsl:value-of select='$vPARAMREMARK'/>
										<br/>
										<u>Coded Para in URL</u> : <xsl:value-of select='@dbn_repp_param'/>
									</span></a> : 
								</label><br/>
							</td>
							<td align="left">
								<xsl:choose>
									<xsl:when test="@dbn_repp_param_type='Drop-Down'">
										<xsl:element name='select'>
											<xsl:attribute name='name'><xsl:value-of select="$vparam"/></xsl:attribute>	
											<xsl:variable name='LOVVal'><xsl:value-of select="//dbquery[@id='Report_Info']/descriptor/parameters/param[@name=$vparam]/attribute::value"/></xsl:variable>
											<script type="text/javascript">
												// old not work for KPI
												var DDContent = [<xsl:value-of select='@dbn_repp_param_type_detail'/>]
												MRN_ComboBox(DDContent,'<xsl:value-of select='$LOVVal'/>');

												// OK for KPI Explore
												//	var DDContent = [<xsl:value-of select='@dbn_repp_param_type_detail'/>]
												//	var Param='<xsl:value-of select="$vparam"/>';
												//	var ValParam=get_param(Param);
												//	MRN_ComboBox(DDContent,ValParam);
											</script>
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<xsl:element name='input'>
											<xsl:attribute name='name'><xsl:value-of select="$vparam"/></xsl:attribute>
											<xsl:attribute name='id'>id<xsl:value-of select="$vparam"/></xsl:attribute>
											<xsl:attribute name='value'><xsl:value-of select="//dbquery[@id='Report_Info']/descriptor/parameters/param[@name=$vparam]/attribute::value"/></xsl:attribute>
										</xsl:element>					
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
				</form>	
				<tr>
					<td colspan="10" align="center">
						<xsl:variable name="vREPID"><xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pRID']/@value"/></xsl:variable>
						<a target="_blank" href="/LRF/XMLWeb/ProcessDescriptor/descriptor/DBN/MRN_REDIR/WS.xml?pRID={$vREPID}">Define Default values for this Report</a>
					</td>
				</tr>
			</table>	
		</xsl:template>
		<xsl:template name="REPORT_F"> 						<!-- Global Report Footer which contains -->		
			<xsl:param name="Conf" select="'MRN'"/>
			<xsl:param name="DECRYPT" select="'YES'"/>
				<!-- <script>
					alert('Template REPORT_F Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
				</script>
			-->
			<xsl:for-each select = "//dbquery[@id='Report_Info']/rows/row[1]">
				<center>
					<xsl:choose>
						<xsl:when test="$Conf='MRN'">
							<h2>
								<a href="http://mrnode.mil.intra"><img border="0px" src="/Default2/MRN_Prod/img/logo.png" width="200px" alt="MR Node" style="vertical-align:middle"/></a>
								<img src="/Default2/MRN_Prod/img/nothing.png" width="100px" style="vertical-align:middle"/>
								<u>Report <b><xsl:value-of select='@dbn_rep_name'/></b></u>
							</h2>
							Created by <xsl:value-of select='@dbn_rep_poc'/> (<xsl:value-of select='@dbn_rep_email'/>)<br/>
						</xsl:when>
						<xsl:otherwise>
							<h2>
								Local Node Report
							</h2>
						</xsl:otherwise>
					</xsl:choose>
					This report has been generated on 
					<script type="text/javascript">
						function time()	{
						Today = new Date()
						document.write(Today.toLocaleString())
						}
						time()
					</script>
				</center>
			</xsl:for-each>
			<xsl:if test="$Conf='MRN'">
				<xsl:call-template name='IMPROVE'/>
			</xsl:if>
			<xsl:if test="$DECRYPT='YES'">
				<xsl:call-template name='QUERYID_DECRYPT'/>
			</xsl:if>
		</xsl:template>
		<xsl:template name="KPI_Footer"> 					<!-- Footer to be used for KPI Details Report -->
			<!-- <script>
				alert('Template KPI_Footer Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
			</script>
			-->
			<xsl:variable name="UQD">UQD_<xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pVKEYD']/@value"/>_<xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pKPI']/@value"/></xsl:variable>
			<xsl:variable name="UDDD">UDDD_<xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pVKEYD']/@value"/>_<xsl:value-of select="//dbquery[1]/descriptor/parameters/param[@name='pKPI']/@value"/></xsl:variable>
			<xsl:call-template name="QUERYID_DECRYPT">
				<xsl:with-param name="UQD" select="$UQD"/>
			</xsl:call-template>
			<xsl:call-template name="DATA_DIC_DECRYPT">
				<xsl:with-param name="UDDD" select="$UDDD"/>
			</xsl:call-template>
			<script>
				if (get_param('pEXPLORE')=='Yes'){
				<xsl:for-each select = "//dbquery[1]/descriptor/parameters/param">
					var ParName='<xsl:value-of select="@name"/>';
					var ParValue='<xsl:value-of select="@value"/>';
					$("input#id"+ParName).val(ParValue)
				</xsl:for-each>
				}else{};
			</script>
		</xsl:template>
		<xsl:template name="IMPROVE"> 						<!-- Bloc Improve Report (in Report Bottom) -->
		<!-- <script>
			alert('Template IMPROVE Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
		</script>
		-->
		<div id="IMPROVE_S" style="display:block">
			<table border="0" align="center" width="60%" class="MRFoot">
				<thead  class="MRFoot">
					<th align="center"  width="5%" style='padding:3px 1px 0px 1px'>
						<xsl:element name="a">
							<xsl:attribute name="onclick">
								if(IMPROVE.style.display=='none'){IMPROVE.style.display='block';imgRF.src='/Default2/MRN_Prod/img/down-bl.png'} else {IMPROVE.style.display='none';imgRF.src='/Default2/MRN_Prod/img/up-bl.png'};
							</xsl:attribute>
							<xsl:attribute name="style"> style="cursor:pointer;</xsl:attribute>
							<img id="imgRF" style="cursor:pointer;margin-left:5px;margin-right:5px" src="/Default2/MRN_Prod/img/up-bl.png"/>
						</xsl:element>
					</th>
					<TH colspan="4"  class="MRFoot">You want to improve this Report ...</TH>
				</thead>
				<tr id="IMPROVE" style="display:none">
					<td colspan="8" style="background-color:#ffffff;">
						<table width="100%" align="center" class="MRFoot">
							<tbody>
								<tr>
									<th width="10%" align="center" style='padding:1px 1px 1px 15px'><big>Fr</big></th><td colspan="8" align="left">Si vous avez des remarques et améliorations à nous proposer, envoyez un mail au <a href="mailto:crescencio.ibanez@mil.be">Cdt IBANEZ C</a> . Soyez le plus complet possible.</td>
								</tr>
								<tr>
									<th width="10%" align="center" style='padding:1px 1px 1px 15px'><big>Nl</big></th><td colspan="8" align="left">Indien u opmerkingen of verbeteringen heeft, stuur een Email naar <a href="mailto:renzo.dubus@mil.be">Adjt Dubus R</a> . Wees zo volledig mogelijk.</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
		</div>
		</xsl:template>
		<xsl:template name="QUERYID_DECRYPT"> 				<!-- Report Error Decriptor -->
			<xsl:param name="UQD" select="'UQD_NONE'"/>
			<!-- <script>
				alert('Template QUERYID_DECRYPT Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
			</script>
			-->
			<!-- Decryptor is per default Hidden -->
			<div style="display:none">
				<xsl:attribute name="id">D_<xsl:value-of select="$UQD"/></xsl:attribute>
				<xsl:variable name="NBR_DBWEB_DECRYPT"><xsl:value-of select="count(//dbquery[@id!='Report_Info' and @id!='Report_Prompt' and @id!='TEMPLATE' and @id!='ILIAS_DATA_DICTIONARY' and @id!='KPI']/descriptor/querystring)"/></xsl:variable>
				<!-- Set parameter Show -->
				<xsl:variable name="SHOW_DBWEB_DECRYPT">
					<xsl:choose>
						<xsl:when test="//dbquery[@id='Report_Info']/rows/row/@dbn_rep_dbweb='Y'">YES</xsl:when>
						<!-- For KPI Always Hidden for readibility -->
						<xsl:when test="//dbquery[@id='Report_Info']/descriptor/parameters/param[@name='pKPI']/@value!=''">NO</xsl:when>
						<xsl:otherwise>NO</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<!-- Force Display if parameter is YES -->
					<xsl:when test="$SHOW_DBWEB_DECRYPT='YES'">
						<xsl:attribute name="style">display:block</xsl:attribute>
					</xsl:when>
					<!-- Force Display if Errors -->
					<xsl:when test="count(//dbquery/error)!=0">
						<xsl:attribute name="style">display:block</xsl:attribute>
					</xsl:when>
					<!-- Otherwise don't modify display, do Hidden -->
					<xsl:otherwise>
						<xsl:attribute name="style">display:none</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<table border="0" align="center"  width="60%" class="MRFoot">
					<thead>
						<th align="center"  width="5%" style='padding:3px 1px 0px 1px'>
							<xsl:element name="a">
								<xsl:attribute name="onclick">if(<xsl:value-of select="$UQD"/>.style.display=='none'){<xsl:value-of select="$UQD"/>.style.display='block';img<xsl:value-of select="$UQD"/>.src="/Default2/MRN_Prod/img/down-bl.png"} else {<xsl:value-of select="$UQD"/>.style.display='none';img<xsl:value-of select="$UQD"/>.src="/Default2/MRN_Prod/img/up-bl.png"};
							</xsl:attribute>
							<xsl:attribute name="style"> style="cursor:pointer;</xsl:attribute>
							<xsl:element name="img">
								<xsl:attribute name="id">img<xsl:value-of select="$UQD"/></xsl:attribute>   
								<xsl:attribute name="style">cursor:pointer;margin-left:5px;margin-right:5px</xsl:attribute>  
								<xsl:attribute name="src">/Default2/MRN_Prod/img/up-bl.png</xsl:attribute>   
							</xsl:element>								
						</xsl:element>
					</th>
					<xsl:choose>
						<!-- No Errors -->
						<xsl:when test="count(//dbquery/error) = 0">
							<TH colspan="4"><xsl:value-of select="$NBR_DBWEB_DECRYPT"/> Queries used without error in this Report</TH>
						</xsl:when>
						<!-- Errors -->
						<xsl:when test="count(//dbquery/error) != 0">
							<TH colspan="4">
								<xsl:if test="count(//dbquery/error)>0">
									<xsl:attribute name="style">background-color:#FFBF80</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="$NBR_DBWEB_DECRYPT"/> Queries used in this Report and <xsl:value-of select="count(//dbquery/error)"/> are in Error
							</TH>
						</xsl:when>
						<!-- Trap Case -->
						<xsl:otherwise>
							<TH colspan="4">Case Not Defined</TH>
						</xsl:otherwise>
					</xsl:choose>	
				</thead>
				<tr>
					<xsl:attribute name="id"><xsl:value-of select="$UQD"/></xsl:attribute>
					<xsl:attribute name="style">display:none</xsl:attribute>
					<td colspan="8" style="background-color:#ffffff;">
						<table border="1" align="center">
							<thead>
								<tr>
									<TH >#</TH>
									<TH >SQL Title</TH>
									<TH >DBase</TH>
									<TH >Nbr Fields</TH>
									<TH >Nbr Records</TH>
								</tr>
							</thead>
							<tbody>
								<xsl:choose>
									<xsl:when test="$SHOW_DBWEB_DECRYPT = 'YES' or //dbquery[@id='Report_Info']/descriptor/parameters/param[@name='pKPI']/@value!=''">
										<xsl:for-each select = "//dbquery[@id!='Report_Info' and @id!='Report_Prompt' and @id!='TEMPLATE' and @id!='ILIAS_DATA_DICTIONARY' and @id!='KPI']">		
											<tr>
												<xsl:choose>
													<xsl:when test="count(rows/row)=0 and count(error)!=1">
														<td bgcolor="#9C9E4B" align="center" rowspan="3"><xsl:value-of select="position()"/></td>
														<td bgcolor="#9C9E4B"><b><xsl:value-of select="@id"/></b></td>
														<td align="center" ><em><xsl:value-of select="descriptor/database"/></em></td>
														<td align="center" ><b><xsl:value-of select="count(columns/column)"/></b></td>
														<td align="center" ><b><xsl:value-of select="count(rows/row)"/></b></td>
													</xsl:when>
													<xsl:when test="count(rows/row)>=0 and count(error)!=1">
														<td bgcolor="#A2B5BF" align="center" rowspan="3"><xsl:value-of select="position()"/></td>
														<td bgcolor="#A2B5BF"><b><xsl:value-of select="@id"/></b></td>
														<td align="center" ><em><xsl:value-of select="descriptor/database"/></em></td>
														<td align="center" ><b><xsl:value-of select="count(columns/column)"/></b></td>
														<td align="center" ><b><xsl:value-of select="count(rows/row)"/></b></td>
													</xsl:when>
													<xsl:otherwise>
														<td bgcolor="#FFB6B8" align="center" rowspan="3"><xsl:value-of select="position()"/></td>
														<td bgcolor="#FFB6B8"><b><xsl:value-of select="@id"/></b></td>
														<td align="center" ><em><xsl:value-of select="descriptor/database"/></em></td>
														<td align="center" colspan="2"><b>Error in Query</b></td>
													</xsl:otherwise>
												</xsl:choose>
											</tr>
											<tr>
												<td colspan="4">
													<xsl:value-of select="descriptor/querystring"/>
												</td>
											</tr>
											<xsl:choose>
												<xsl:when test="count(error)>0">
													<tr>
														<td align="left" colspan="4">
															<b><xsl:value-of select="substring(error/message,1,400)"/>...</b>
														</td>
													</tr>	 
												</xsl:when>
												<xsl:otherwise>
													<tr></tr>
												</xsl:otherwise>
											</xsl:choose>
											<tr>
												<td>
													Fields :
												</td>
												<td colspan="4">
													<xsl:for-each select = "columns/column">
														'<xsl:value-of select="@name"/>'<xsl:if test="position()!=last()">,</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:for-each select = "//dbquery/error/cause">		
											<tr>
												<td bgcolor="#FFB6B8" align="center" rowspan="3"><xsl:value-of select="position()"/></td>
												<td bgcolor="#FFB6B8"><b><xsl:value-of select="../../@id"/></b></td>
												<td align="center" ><em><xsl:value-of select="../../descriptor/database"/></em></td>
												<td align="center" colspan="2"><b>Error in Query</b></td>
											</tr>
											<tr>
												<td colspan="4">
													<xsl:value-of select="../../descriptor/querystring"/>
												</td>
											</tr>
											<tr>
												<td align="left" colspan="4"><b><xsl:value-of select="substring(../message,1,400)"/>...</b></td>
											</tr>
										</xsl:for-each>
									</xsl:otherwise>
								</xsl:choose>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
			</table>
			</div>
		</xsl:template>
		<xsl:template name="DATA_DIC_DECRYPT"> 				<!-- Data Dictionary decriptor -->
			<xsl:param name="UDDD" select="'UDDD_NONE'"/>
			<xsl:param name="RepConf" select="'MRN'"/>
			<xsl:param name="vLANG" select="'EN'"/>
			<!-- <script>
				alert('Template DATA_DIC_DECRYPT Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
			</script>
			-->
			<div style="display:none">
				<xsl:attribute name="id">D_<xsl:value-of select="$UDDD"/></xsl:attribute>

				<xsl:variable name="TNameDD">ILIAS_DD_<xsl:value-of select="$UDDD"/></xsl:variable>
				<xsl:variable name="vColDDVis">
					<xsl:choose>
						<xsl:when test="//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value='FR'">0,6,9,10,11</xsl:when>
						<xsl:when test="//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value='NL'">0,6,8,10,11</xsl:when>
						<xsl:otherwise>0,6,11</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:call-template name="Generic_Table_DBWEB">
					<xsl:with-param name="DBWEB_Name" select="'ILIAS_DATA_DICTIONARY'"/>
					<xsl:with-param name="UdTN" select="$TNameDD"/>
					<xsl:with-param name="Show_Empty" select="'N'"/> 
					<xsl:with-param name="Node_Conf" select="$RepConf"/>
					<xsl:with-param name="dT_Type" select="'99'"/>
					<xsl:with-param name="Lang" select="$vLANG"/>
					<xsl:with-param name="RepDic" select="'Y'"/> 
					<xsl:with-param name="dictionary" select="document('../COMMON/IL_MR_DD.xml')"/>
					<xsl:with-param name="Col_Hidden" select="$vColDDVis"/>
					<xsl:with-param name="MaxRecords" select="9999"/>
					<xsl:with-param name="Frame" select="'YC'"/>
					<xsl:with-param name="TableWidth" select="'60%'"/>
					<xsl:with-param name="Detail_Data" select="'Generic'"/> 
				</xsl:call-template>
			</div>
		</xsl:template>
		<xsl:template name="replaceCharsInString"> 			<!-- Replace A string of Characters in STRING by another one -->
			<xsl:param name="stringIn"/>
			<xsl:param name="charsIn"/>
			<xsl:param name="charsOut"/>
		  	<!-- <script>
				alert('Template replaceCharsInString Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
			</script>
			-->
			<xsl:choose>
				<xsl:when test="contains($stringIn,$charsIn)">
					<xsl:value-of select="concat(substring-before($stringIn,$charsIn),$charsOut)"/>
					<xsl:call-template name="replaceCharsInString">
						<xsl:with-param name="stringIn" select="substring-after($stringIn,$charsIn)"/>
						<xsl:with-param name="charsIn" select="$charsIn"/>
						<xsl:with-param name="charsOut" select="$charsOut"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$stringIn"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:template>
		<xsl:template match='error'> 						<!-- [DEPRECATED] List of Errors -->
			<script>
				alert('Template error Deprecated, please modify Report. Transmit this message to Cdt IBANEZ C with Report URL');
			</script>
			<xsl:value-of select='@cause'/>
		</xsl:template>
</xsl:stylesheet>