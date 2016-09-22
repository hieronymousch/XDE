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

<!-- Template Call to generate a complete basic report based on a single QueryString -->
<xsl:template match='/'>  
   <xsl:call-template name="GenerateReport">
      <xsl:with-param name="DBWEB_Name" select="'IL_MR_SAMPLE'"/>
      <xsl:with-param name="Col_Hidden" select="'3'"/>
      <xsl:with-param name="Col_Sorting" select="'2-desc'"/>
      <xsl:with-param name="Col_Total" select="'9'"/>
   </xsl:call-template>
</xsl:template>

<!-- Include CPN FW Core Templates -->
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>