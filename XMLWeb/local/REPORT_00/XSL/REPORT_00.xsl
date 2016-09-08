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
<!-- Retrieve Parameter Value for pFUNCTION -->
<xsl:variable name="vFUNCTION" select="//dbquery[1]/descriptor/parameters/param[@name='pFUNCTION']/@value"/>
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
            My First Report based on Sample 02
         </title> 
      </head>
      <body>
         <!-- Report Layout Template (Top) -->
         <xsl:call-template name="Body_Start"/>

         
         <!-- Generate a "classical Title" -->
         <center>
            <h1>First Block Report Title</h1>
         </center>      
         
         <br/>
         
         <!-- Call Template for generation of Generic Table Result based on Querysting "IL_MR_Sample" -->
         <xsl:call-template name="Generic_Table_DBWEB">
            <xsl:with-param name="DBWEB_Name" select="'IL_MR_QUERY1'"/>
            <xsl:with-param name="UdTN" select="'IL_MR_QUERY1_A'"/>   
         </xsl:call-template>

         <!-- Call Template FromDic2Rep for generating a title based on Language and Text defined in Report Dictionary (RepDic.xml located in same folder that configuration File)-->
         <center>
            <h1>
               <xsl:call-template name="FromDic2Rep">
                  <xsl:with-param name="Title2S" select="'REPORT02B_TITLE'"/>
               </xsl:call-template>
               <xsl:value-of select="$vFUNCTION"/>
            </h1>
         </center>      

         <!-- Call Template for generation of Generic Table Result based also on Querysting "IL_MR_Sample" but with others parameters (not the Default values) -->
         <xsl:call-template name="Generic_Table_DBWEB">
            <xsl:with-param name="DBWEB_Name" select="'IL_MR_QUERY1'"/>
            <xsl:with-param name="UdTN" select="'IL_MR_QUERY1_B'"/>   
            <xsl:with-param name="RepDic" select="'N'"/>             
         </xsl:call-template>

         <center>
            <h3>Use of xsl:if and xsl:choose</h3>

            <xsl:if test="$vFUNCTION='FB'">
               This is a Biplace F-16 (generated by the xsl:if)<br/>
            </xsl:if>
            
            <xsl:choose>
               <xsl:when test="$vFUNCTION='FA'">This is a monoplace F-16 (generated by the xsl:choose)</xsl:when>
               <xsl:when test="$vFUNCTION='FB'">This is a Biplace F-16 (generated by the xsl:choose)</xsl:when>
               <xsl:otherwise>This is Not a F-16 (generated by the xsl:choose)</xsl:otherwise>
            </xsl:choose>
         </center>
            
         <!-- Report Layout Template (Bottom) -->
         <xsl:call-template name="Body_End"/>
      </body>
   <xsl:text disable-output-escaping='yes'>&lt;/html></xsl:text>
</xsl:template>
<!-- Include FW2 Templates - This is the CPN Core -->
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>
