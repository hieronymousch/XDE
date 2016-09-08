<?xml version="1.0" encoding="utf-8" ?>
<!-- MR Node Components - By MIB
	  XXTBDXX : Means To be deleted in next Version -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<!-- Active Templates used for MR Node -->
	
	<xsl:template name="KPI_Generic_Tab"> 							<!-- v2 - Template For Generic Tab -->
		<xsl:param name="tTAB_UnId" select="concat('Tab_Gen_',$vRID)"/> 		<!-- Unique String for Id generation -->
		<xsl:param name="tDD_UnId" select="'DD_KPIDETREP'"/> 					<!-- Unique String for Id generation -->
		<xsl:param name="tRowId" select="'a#b'"/>
		<xsl:param name="tTabNbr" select="2"/>
		<xsl:param name="tSeparator" select="'#'"/>
		
		<div id="{$tTAB_UnId}">		<!-- This Div allows to Hide the complete Report in KPI Dashboard -->
			<br/>
			<div class="row">
				<!-- Generate Tab Header -->
				<ul class="nav nav-tabs col-md-10 col-md-offset-1">
				  	<xsl:call-template name="KPI_Gen_Tab_Header">
			            <xsl:with-param name="tTAB_UnId" select="$tTAB_UnId" />
			            <xsl:with-param name="tLoop" select="$tTabNbr" />
			            <xsl:with-param name="tText" select="$tRowId" />
			            <xsl:with-param name="tSeparator" select="$tSeparator"/>
			        </xsl:call-template>
				</ul>
			</div>
			<!--Generate Content -->
			<div class="tab-content">
				<xsl:call-template name="KPI_Gen_Tab_Content">
		            <xsl:with-param name="tTAB_UnId" select="$tTAB_UnId" />
		            <xsl:with-param name="tDD_UnId" select="'DD_KPIDETREP'" />
		            <xsl:with-param name="tLoop" select="$tTabNbr" />
		            <xsl:with-param name="tText" select="$tRowId" />
		            <xsl:with-param name="tSeparator" select="$tSeparator"/>
		        </xsl:call-template>
			</div>
			<!-- Generate Div For Drill-Down -->
			<div class="row col-md-12">
				<!--<div id="DD_{$tTAB_UnId}">DD(DD_<xsl:value-of select="$vKPI"/>_<xsl:value-of select="$vVKEYD"/></div>-->
				<!--div id="{tDD_UnId}"></div-->
				<div id="DD_{$vKPI}_{$vVKEYD}"></div>
			</div>
		</div>
	</xsl:template>	
	<xsl:template name="KPI_Gen_Tab_Header"> 						<!-- v2 - Template For Generic Tab Header -->
		<xsl:param name="tTAB_UnId" select="'KPIDETREP'"/> 			<!-- Unique String for Id generation -->
		<xsl:param name="tStart" select="1" />
	    <xsl:param name="tLoop" select="1" />
	    <xsl:param name="tText" select="'a'"/>
	    <xsl:param name="tSeparator" select="'#'"/>

	    <xsl:if test="not($tStart = $tLoop+1)">
			
			<xsl:variable name="vTabName">
				<xsl:call-template name="Decode_FDC_MultipleValue"> 	<!-- v2 - Allow Decoding of MultipleValue in 1 Field (SPE and FDC) -->
				    <xsl:with-param name="tText" select="$tText"/>
				    <xsl:with-param name="tDelim" select="$tSeparator" />
					<xsl:with-param name="tPos" select="$tStart"/>
				    <xsl:with-param name="tLength" select="$tLoop"/>
				</xsl:call-template>
			</xsl:variable>
			<li>
				<xsl:if test="$tStart=1">
	  				<xsl:attribute name="class">active</xsl:attribute>
	  			</xsl:if>
	  			<a data-toggle="tab" href="#TAB_{$tStart}_{$tTAB_UnId}">
		  			<xsl:choose>
						<xsl:when test="$vTabName='HISTORICAL'">
							<span id="HistLabel_{$tStart}_{$tTAB_UnId}">
								<xsl:attribute name="onclick">var TargetDiv = 'KPI_Hist_<xsl:value-of select="$vVKEYD"/>_<xsl:value-of select="$vKPI"/>';var TargetLoad = 'IL_MR_KPI_HISTORICAL.xml?pLANG=<xsl:value-of select="$vLANG"/>&amp;pKPI=<xsl:value-of select="$vKPI"/>&amp;pVKEYD=<xsl:value-of select="$vVKEYD"/>&amp;pPER=W&amp;XXX='+Math.floor(Math.random()*1001);loadDiv(TargetDiv,TargetLoad);$('#HistLabel_<xsl:value-of select="$tStart"/>_<xsl:value-of select="$tTAB_UnId"/>').prop('onclick',null).off('click');</xsl:attribute><span class="glyphicon glyphicon-stats" aria-hidden="true"><xsl:text> . </xsl:text></span>Historical
							</span>
						</xsl:when>
						<xsl:when test="$vTabName='EXPLAIN'">
							<span class="glyphicon glyphicon-info-sign" aria-hidden="true"> </span><xsl:text> . </xsl:text>Explanation
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="contains($vTabName,'XTAB')"><span class="glyphicon glyphicon-list" aria-hidden="true"></span><xsl:text> . </xsl:text></xsl:if>
							<xsl:if test="contains($vTabName,'XGRA')"><span class="glyphicon glyphicon-signal" aria-hidden="true"></span><xsl:text> . </xsl:text></xsl:if>
							<xsl:call-template name="FromDic2Rep">
								<xsl:with-param name="Title2S" select="$vTabName"/>
								<xsl:with-param name="Lang" select="$vLANG"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
		  		</a>
		  	</li>
			<!-- Loop -->
	        <xsl:call-template name="KPI_Gen_Tab_Header">
	            <xsl:with-param name="tStart" select="$tStart + 1" />
	            <xsl:with-param name="tLoop" select="$tLoop" />
	            <xsl:with-param name="tText" select="$tText" />
	            <xsl:with-param name="tSeparator" select="$tSeparator"/>
	        </xsl:call-template>
	    </xsl:if>
	</xsl:template>
	<xsl:template name="KPI_Gen_Tab_Content"> 						<!-- v2 - Template For Generic Tab Content -->
		<xsl:param name="tTAB_UnId" select="'KPIDETREP'"/> 			<!-- Unique String for Id generation -->
		<xsl:param name="tDD_UnId" select="'DD_KPIDETREP'"/> 			<!-- Unique String for Id generation -->
		<xsl:param name="tStart" select="1" />
	    <xsl:param name="tLoop" select="1" />
	    <xsl:param name="tText" select="'a'"/>
	    <xsl:param name="tSeparator" select="'#'"/>

	   	<xsl:if test="not($tStart = $tLoop+1)">
	        
			<xsl:variable name="vRowId">
				<xsl:call-template name="Decode_FDC_MultipleValue"> 	<!-- v2 - Allow Decoding of MultipleValue in 1 Field (SPE and FDC) -->
				    <xsl:with-param name="tText" select="$tText"/>
				    <xsl:with-param name="tDelim" select="$tSeparator" />
					<xsl:with-param name="tPos" select="$tStart"/>
				    <xsl:with-param name="tLength" select="$tLoop"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$vRowId='COLLAPSE'">
					<div id="TAB_{$tStart}_{$tTAB_UnId}" class="tab-pane fade col-md-10 col-md-offset-1"/>
				</xsl:when>
				<xsl:when test="$vRowId='HISTORICAL'">
					<div id="TAB_{$tStart}_{$tTAB_UnId}" class="tab-pane fade col-md-10 col-md-offset-1">
						<br/>
						<div id="KPI_Hist_{$vVKEYD}_{$vKPI}">
							<p>
						    	Historical for <xsl:value-of select="concat('Histo_',$vVKEYD,'_',$vKPI)"/>
					    	</p>
					    </div>
					</div>
				</xsl:when>
				<xsl:when test="$vRowId='EXPLAIN'">
					<div id="TAB_{$tStart}_{$tTAB_UnId}" class="tab-pane fade col-md-10 col-md-offset-1">
						<p>
					    	<h3>KPI <xsl:value-of select="$vKPI"/><small><xsl:value-of select="//dbquery[@id='KPI']/rows/row[1]/@kpid_denom_fr"/></small></h3>
					    	<h2>Explanation</h2>
					    	<xsl:value-of select="//dbquery[@id='KPI']/rows/row[1]/@kpid_desc_fr"/>
				    	</p>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="TAB_{$tStart}_{$tTAB_UnId}">
					    <xsl:if test="$tStart=1">
			  				<xsl:attribute name="class">tab-pane fade in active nav nav-tabs col-md-10 col-md-offset-1</xsl:attribute>
			  			</xsl:if>
			  			<xsl:if test="$tStart!=1">
			  				<xsl:attribute name="class">tab-pane fade col-md-10 col-md-offset-1</xsl:attribute>
			  			</xsl:if>
					    <p>
					    	<xsl:call-template name="Generic_Table_DBWEB">
								<xsl:with-param name="DBWEB_Name" select="$vRowId"/>
								<xsl:with-param name="UdTN" select="concat('TAB_',$tStart,'_',$tTAB_UnId,'_Cont')"/>
								<xsl:with-param name="Show_Empty" select="'Y'"/> 
								<xsl:with-param name="Lang" select="$vLANG"/>
								<xsl:with-param name="RepDic" select="'Y'"/> 
								<xsl:with-param name="MaxRecords" select="-1"/>
								<xsl:with-param name="Frame" select="'YO'"/> 
								<xsl:with-param name="TableWidth" select="'100%'"/>
								<xsl:with-param name="Detail_Data" select="$vRowId"/> 
							</xsl:call-template>
					    </p>
					</div>	
				</xsl:otherwise>
			</xsl:choose>
			<!-- Loop -->
	        <xsl:call-template name="KPI_Gen_Tab_Content">
	            <xsl:with-param name="tStart" select="$tStart + 1" />
	            <xsl:with-param name="tLoop" select="$tLoop" />
	            <xsl:with-param name="tText" select="$tText" />
	            <xsl:with-param name="tSeparator" select="$tSeparator"/>
	        </xsl:call-template>
	    </xsl:if>
	</xsl:template>
</xsl:stylesheet>