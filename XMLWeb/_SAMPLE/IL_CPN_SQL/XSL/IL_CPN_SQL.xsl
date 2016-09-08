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
<xsl:variable name="vSQL" select="//dbquery[1]/descriptor/parameters/param[@name='pSQL']/@value"/>
<xsl:variable name="vDB" select="//dbquery[1]/descriptor/parameters/param[@name='pDB']/@value"/>
<xsl:variable name="vLIMIT" select="//dbquery[1]/descriptor/parameters/param[@name='pLIMIT']/@value"/>
<xsl:variable name="vHIDCOL" select="//dbquery[1]/descriptor/parameters/param[@name='pHIDCOL']/@value"/>
<xsl:variable name="vSORTCOL" select="//dbquery[1]/descriptor/parameters/param[@name='pSORTCOL']/@value"/>
<xsl:variable name="vSORTTYPE" select="//dbquery[1]/descriptor/parameters/param[@name='pSORTTYPE']/@value"/>
<xsl:variable name="vFILTER" select="//dbquery[1]/descriptor/parameters/param[@name='pFILTER']/@value"/>
<xsl:variable name="vRepDic" select="document('../IL_CPN_SQL_RepDic.xml')" />
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
      	<title>
			Adhoc Query on 
			<xsl:if test="$vDB='MRN'">
				Node
			</xsl:if>
		</title>
	</head>
    	<body>
			<xsl:call-template name="Body_Start"/>
			<h1>
				<center>
					<u>
						Adhoc Query on My Dev Node	
					</u>
				</center>
			</h1>
			<!-- SQL Bloc -->			
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'SQL'"/>
				<xsl:with-param name="Show_Empty" select="'Y'"/> 
				<xsl:with-param name="dictionary" select="$vRepDic"/> 
				<xsl:with-param name="MaxRecords" select="-1"/>
				<xsl:with-param name="Frame" select="'YO'"/> <!-- Possible : YO/YC/Y/YT -->
				<xsl:with-param name="Detail_Data" select="'SPE01_SQL'"/> <!-- exp: concat('Templ_Data_',@id) -->
			</xsl:call-template>
			<!-- SQL Result -->			
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'SQL_ADHOC'"/>
				<xsl:with-param name="Show_Empty" select="'Y'"/> 
				<xsl:with-param name="RepDic" select="'N'"/> 
				<xsl:with-param name="Col_Hidden" select="$vHIDCOL"/>
				<xsl:with-param name="Col_Sorting" select="concat($vSORTCOL,'-',$vSORTTYPE)"/>
				<xsl:with-param name="ForceFooter" select="'Y'"/> 
				<xsl:with-param name="Col_Filtering" select="$vFILTER"/>
				<xsl:with-param name="dictionary" select="$vRepDic"/> 
				<xsl:with-param name="MaxRecords" select="$vLIMIT"/>
				<xsl:with-param name="Frame" select="'YO'"/> <!-- Possible : YO/YC/Y/YT -->
				<xsl:with-param name="Detail_Data" select="'Generic'"/> <!-- exp: concat('Templ_Data_',@id) -->
			</xsl:call-template>									
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
		<xsl:when test="$Detail_Data='SPE01_SQL'">
			<br/>
			<form  width="100%" style='margin-bottom:0px;' method='get' action="" >
				<div class="row">
					<div class="form-group col-md-2">
						<label for="usr">
							<font color="blue">Select Your Database :</font><br/>				
						</label>
						<xsl:element name='select'>
							<xsl:attribute name='class'>form-control col-md-1</xsl:attribute>
							<xsl:attribute name='name'>pDB</xsl:attribute>
							<xsl:if test="$vDB='MRN'">
								<option value="MRN" selected="selected">MR Node or DB Node</option>
							</xsl:if>
						</xsl:element>
					</div>
					<div class="form-group col-md-2">
						<label for="usr">
							<font color="blue">Max Nbr Rows Retrieved :</font>
						</label>								
						<xsl:element name='select'>
							<xsl:attribute name='class'>form-control col-md-1</xsl:attribute>
							<xsl:attribute name='name'>pLIMIT</xsl:attribute>
							<xsl:if test="$vLIMIT='50'">
								<option value="50" selected="selected">50 Records</option>
								<option value="200">200 Records</option>
								<option value="500">500 Records</option>
								<!--<option value="N0">No Limit</option>-->
							</xsl:if>
							<xsl:if test="$vLIMIT='200'">
								<option value="50">50 Records</option>
								<option value="200" selected="selected">200 Records</option>
								<option value="500">500 Records</option>
								<!--<option value="N0">No Limit</option>-->
							</xsl:if>
							<xsl:if test="$vLIMIT='500'">
								<option value="50">50 Records</option>
								<option value="200">200 Records</option>
								<option value="500" selected="selected">500 Records</option>
								<!--<option value="N0">No Limit</option>-->
							</xsl:if>
							<!--
							<xsl:if test="$vLIMIT='NO'">
								<option value="50">50 Records</option>
								<option value="200">200 Records</option>
								<option value="500">500 Records</option>
								<option value="N0" selected="selected">No Limit</option>
							</xsl:if>
							-->
						</xsl:element>
					</div>
					<div class="form-group col-md-1">
						<label for="usr">
							<font color="blue">Language :</font>
						</label>								
						<xsl:element name='select'>
							<xsl:attribute name='class'>form-control</xsl:attribute>
							<xsl:attribute name='name'>pLANG</xsl:attribute>
							<xsl:if test="$vLANG='EN'">
								<option value="EN" selected="selected">En</option>
								<option value="FR">Fr</option>
								<option value="NL">Nl</option>
							</xsl:if>
							<xsl:if test="$vLANG='FR'">
								<option value="EN">En</option>
								<option value="FR" selected="selected">Fr</option>
								<option value="NL">Nl</option>
							</xsl:if>
							<xsl:if test="$vLANG='NL'">
								<option value="EN">En</option>
								<option value="FR">Fr</option>
								<option value="NL" selected="selected">Nl</option>
							</xsl:if>
						</xsl:element>
					</div>
					<div class="form-group col-md-2">
						<div class="form-group">
						  <label for="usr"><font color="blue">Col Hidden :</font></label>
						  <input type="text" class="form-control" name="pHIDCOL" size="1" >
						  	<xsl:attribute name='value'><xsl:value-of select="$vHIDCOL"/></xsl:attribute>
						  </input>
						</div>
					</div>
					<div class="form-group col-md-1">
						<label for="sel1"><font color="blue">Sorting : </font></label>
					  	<input type="text" class="form-control" name="pSORTCOL" size="1" >
					  		<xsl:attribute name='value'><xsl:value-of select="$vSORTCOL"/></xsl:attribute>
					 	</input>
					</div> 	
					<div class="form-group col-md-1">
					  	<label for="sel1">(ord)</label>
					  	<select class="form-control" id="sel1">
					   		<xsl:attribute name='name'>vSORTTYPE</xsl:attribute>
							<xsl:if test="$vSORTTYPE='asc'">
								<option value="asc" selected="selected">Asc</option>
								<option value="desc">Desc</option>
							</xsl:if>
							<xsl:if test="$vSORTTYPE='desc'">
								<option value="asc">Asc</option>
								<option value="desc" selected="selected">Desc</option>
							</xsl:if>
					  	</select>
					</div>
					<div class="form-group col-md-1">
						<label for="sel1"><font color="blue">Filter : </font></label>
						<xsl:element name='select'>
							<xsl:attribute name='name'>pFILTER</xsl:attribute>
							<xsl:attribute name='class'>form-control</xsl:attribute>
							<xsl:if test="$vFILTER='Y'">
								<option value="Y" selected="selected">Yes</option>
								<option value="None">No</option>
							</xsl:if>
							<xsl:if test="$vFILTER='None'">
								<option value="Y">Yes</option>
								<option value="None" selected="selected">No</option>
							</xsl:if>
						</xsl:element>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-9">
						<label for="usr">
							<font color="blue"><u>Type your SQL Here : </u></font><br/>				
						</label>
						<textarea class="form-control" id="comment">
					  		<xsl:attribute name='rows'>7</xsl:attribute>
							<xsl:attribute name='cols'>117</xsl:attribute>
							<xsl:attribute name='name'>pSQL</xsl:attribute>
							<xsl:value-of select="normalize-space($vSQL)"/>
					  	</textarea>
					  	<label for="comment">Comment:</label>
					  	<font color="green">
					  		<ul>
					  			<li>
					  				If You have an error because your SQL contains carriage returns or too many spaces, try again an execute.
					  			</li>
					  			<li>
					  				List of Special features available 
									<xsl:call-template name="SPE_Feature">
										<xsl:with-param name="FieldVal" select="concat('MRN_SPE20#MRN_SPE_FEATURES.xml?pLANG=',$vLANG,'#_blank#1#Here')"/>
									</xsl:call-template>
					  			</li>
					  		</ul>
					  	</font> 
					</div>
					<div class="form-group col-md-3">
						<center>
							<br/><br/><br/>
							<input class="btn-lg active btn-info" type='submit' value='Execute'/>
						</center>
					</div>
				</div>
			</form>
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

