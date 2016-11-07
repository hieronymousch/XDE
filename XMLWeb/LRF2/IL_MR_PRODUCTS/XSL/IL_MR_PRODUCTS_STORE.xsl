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

<!-- Variable Declaration End -->

<xsl:template match='/'>	
<!-- Generate HTML5 WebPage -->
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
    <meta http-equiv="x-ua-compatible" content="IE=EDGE"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content="Report on MR Node"/>
    <meta name="author" content="JF"/>
    	<head>
			<!-- Load Std Head from From MRN_Config (Require include Node_Config.xsl -->
			<xsl:call-template name="Node_Std_Head"/>
			<title>
	          <xsl:call-template name="FromDic2Rep">
	            <xsl:with-param name="Title2S" select="'REPORT_PAGE'"/>
	            <xsl:with-param name="tDDConfig" select="'C'"/>
	            <xsl:with-param name="Lang" select="$vLANG"/>
	          </xsl:call-template>
	        </title>
		</head>
		<body>
			<!-- Report Layout Template (Top) -->
			<xsl:call-template name="Body_Start"/>

			<center>
	          <h1>
	            <xsl:call-template name="FromDic2Rep">
	              <xsl:with-param name="Title2S" select="'REPORT_TITLE'"/>
	              <xsl:with-param name="Lang" select="$vLANG"/>
	            </xsl:call-template>
	          </h1>
	        </center>
			
			<xsl:call-template name="Generic_Table_DBWEB">
				<xsl:with-param name="DBWEB_Name" select="'IL_MR_PRODUCTS_STORE'"/>
				<xsl:with-param name="UdTN" select="'IL_MR_PRODUCTS_STORE'"/>
        <xsl:with-param name="MaxRecords" select="500"/>	
		</xsl:call-template>
			
      <script>
        $("img[src$='/Default2/CPN/img/SPE17_X.png']").attr({
            src: '/Default2/MRN_Prod/img/nothing.png',
            width: '1px'
          });
      </script>
			<!-- Report Layout Template (Bottom) -->
			<xsl:call-template name="Body_End"/>
		</body>
    <xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>
<xsl:template match="@NSN" mode="genericTableCel">                  
    <td align="center" width="15%">
    	<xsl:call-template name="SPE_Feature">                            
            <xsl:with-param name="FieldVal" select="concat('MRN_SPE09#05##',.,'#1#',.)"/>
        </xsl:call-template>
    </td>
</xsl:template>
<xsl:template match="@Description|@Description_NL|@Description_FR" mode="genericTableCel">                  
    <td align="left" width="10%">
    	<xsl:value-of select="."/>
    </td>
</xsl:template>
<xsl:template match="@Additional_name" mode="genericTableCel">                  
    <td align="left" width="10%">
    	<xsl:value-of select="."/>
    </td>
</xsl:template>
<xsl:template match="@MatMan" mode="genericTableCel">                  
    <td align="center">
    	<xsl:call-template name="SPE_Feature">                            
            <xsl:with-param name="FieldVal" select="concat('MRN_SPE09#01##',.,'#2#',.)"/>
        </xsl:call-template>
    </td>
</xsl:template>
<xsl:template match="@Status" mode="genericTableCel">                  
    <td align="center">
      <xsl:choose>
        <xsl:when test=".='1'"><span class="label label-success"><xsl:value-of select="."/></span></xsl:when>
		<xsl:when test=".='2'"><span class="label label-success"><xsl:value-of select="."/></span></xsl:when>
		<xsl:when test=".='3'"><span class="label label-warning">3</span></xsl:when>
		<xsl:otherwise><span class="label label-danger"><xsl:value-of select="."/></span></xsl:otherwise>
      </xsl:choose>
    </td>
</xsl:template>
<xsl:template match="@LotOK" mode="genericTableCel">                  
    <td align="center">
      <xsl:choose>
        <xsl:when test=".='Y'"><span class="label label-success">Yes</span></xsl:when>
        <xsl:when test=".='N'"><span class="label label-danger">No</span></xsl:when>
        <xsl:otherwise><span class="label label-warning">N/A</span></xsl:otherwise>
      </xsl:choose>
    </td>
</xsl:template>

<xsl:template match="@DocLink" mode="genericTableCel">                  
    <td align="center">
      <span class="glyphicon glyphicon-file"></span><xsl:text> </xsl:text>
      <xsl:call-template name="SPE_Feature">                            
          <xsl:with-param name="FieldVal" select="."/>
      </xsl:call-template>
    </td>
</xsl:template>
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
