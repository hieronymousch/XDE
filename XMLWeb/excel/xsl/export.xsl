<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--Not Modifiable-->
	<xsl:import href="MAKE_XLS.xsl"/>
	<xsl:template match="/">
		<xsl:processing-instruction name="mso-application">
			<xsl:text>progid="Excel.Sheet"</xsl:text>
		</xsl:processing-instruction>
		<xsl:apply-templates mode="makeDoc" select="document(concat(//dbquery[@id='export']/rows/row/@reportURL,'?',//dbquery[@id='export']/rows/row/@reportFilter))">
			<xsl:with-param name="title" select="//dbquery[@id='export']/rows/row/@reportPath"/>
			<xsl:with-param name="filter" select="replace(//dbquery[@id='export']/rows/row/@reportFilter,'&amp;','&#10;')"/>
		</xsl:apply-templates>
	</xsl:template>
</xsl:stylesheet>
