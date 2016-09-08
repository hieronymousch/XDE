<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Author: Crescencio IBANEZ (Cdt IBANEZ)
	 Service : MR-Mgt
	 Bemilcom : 9-2400-1469
	 EMail : crescencio.ibanez@mil.be
	 Version: 2.1.4
	 Release Note: See Below
	 Contributors : 
	 v2.1.4 : 
	 	@ Version Alignment with Node_Config.xsl
	 v1.0 : 
	 	@ Prompts Language
-->

	<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<!--xsl:variable name="vRID" select="//dbquery[1]/descriptor/parameters/param[@name='pRID']/@value"/-->
	<xsl:variable name="vLANG" select="substring(upper-case(//dbquery[1]/descriptor/parameters/param[@name='pLANG']/@value),1,2)"/>
	<xsl:variable name="vUSER" select="upper-case(//dbquery[1]/descriptor/parameters/param[@name='pUSER']/@value)"/>
	<!--<xsl:variable name="vHOWTO" select="upper-case(//dbquery[1]/descriptor/parameters/param[@name='pHOWTO']/@value)"/>-->
	<xsl:variable name="vHOWTO" select="'Y'"/>
				
	<xsl:template name="Test">
		<fo:block text-align="center">Hello World</fo:block>
	</xsl:template>

	<xsl:template name="Tlayout-master-set">
		<fo:layout-master-set>
			<!-- Landscape Layout -->
			<fo:simple-page-master master-name="Land"
				page-height="21cm" 
				page-width="29.7cm"
				margin-top="0cm" 
				margin-bottom="0cm" 
				margin-left="1cm" 
				margin-right="1cm">
				<fo:region-body margin-top="1cm" margin-bottom="2cm"/>
				<fo:region-after region-name="footer" extent="1cm"/>
			</fo:simple-page-master>
			<!-- Portrait Layout -->
			<fo:simple-page-master master-name="Port"
				page-height="29.7cm" 
				page-width="21cm"
				margin-top="0cm" 
				margin-bottom="0cm" 
				margin-left="1cm" 
				margin-right="1cm">
				<fo:region-body margin-top="1cm" margin-bottom="2cm"/>
				<fo:region-after region-name="footer" extent="1cm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>

	<xsl:template name="TFooter">
		<fo:static-content flow-name="footer">
			<fo:list-block font-size="10pt">
			   <fo:list-item>
				  <fo:list-item-label>
					 <fo:block text-align="left">
					 	<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row[1]/@dbn_rep_name"/>  
					 	<fo:basic-link text-decoration="underline" color="black">
							<xsl:attribute name="external-destination">
								url('/LRF/XMLWeb/ProcessDescriptor/descriptor/MRN_UAUT/MRN_EVAL/MRN_EVAL.xml?pRID=1064&amp;pVRID=<xsl:value-of select="//dbquery[@id='Report_Info']/rows/row[1]/@dbn_rep_id"/>&amp;pLANG=EN')
							</xsl:attribute>
							Provide Feedback to Report Creator
						</fo:basic-link>
					 </fo:block>
				  </fo:list-item-label>
				  <fo:list-item-body>
					 <fo:block text-align="right">
						Page <fo:page-number/>
						<!-- of <fo:page-number-citation ref-id="theEnd"/>-->
					 </fo:block>
				  </fo:list-item-body>
			   </fo:list-item>
			</fo:list-block>
		</fo:static-content>
	</xsl:template>
	
	<xsl:template name="tHowTo">
		<xsl:if test="$vHOWTO='Y'">
			<fo:page-sequence master-reference="Port">
				<!-- Page Footer -->
				<xsl:call-template name="TFooter"/>
				<!-- Region Pdf (Main) -->
				<fo:flow flow-name="xsl-region-body">
					<!-- Insert PageBreak -->
					<fo:block space-before="10pt" font-size="34pt" text-align="center">
						<xsl:attribute name="id">HowTo</xsl:attribute>
						How To (Use this Report) 
					</fo:block>
					<xsl:call-template name="HowTo_Content"/>
				</fo:flow>
			</fo:page-sequence>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet>