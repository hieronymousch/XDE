<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--Not Modifiable-->
	<xsl:output method="xml" encoding="UTF-8"/>
	<xsl:template match="/">
		<joins> 			
			<xsl:apply-templates select="//dbquery[@id='ListFields']/rows/row"/>
		</joins>
	</xsl:template>

	
	<xsl:template match="//dbquery[@id='ListFields']/rows/row">
		<join>
		 <leftTable><xsl:value-of select="@table1"/></leftTable>
		 <leftField><xsl:value-of select="@field1"/></leftField>
		 <rightTable><xsl:value-of select="@table2"/></rightTable>
		 <rightField><xsl:value-of select="@field2"/></rightField>
		</join>
	</xsl:template>
</xsl:stylesheet>
