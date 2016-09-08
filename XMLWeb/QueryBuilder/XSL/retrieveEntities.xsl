<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--Not Modifiable-->
	<xsl:output method="xml" encoding="UTF-8"/>
	<xsl:template match="/">
		<tree id="0" radio="0">
			<xsl:apply-templates select="//dbquery[@id='ListEntities']/rows/row"/>
		</tree>
	</xsl:template>

	<xsl:template match="//dbquery[@id='ListEntities']/rows/row">
		 <item 
			id="{@Name}" text="{@Name}" 
			im0="CustomIcons/table_error.png" 
			im1="CustomIcons/table.png" 
			im2="CustomIcons/table.png"
			child="1"
		>
			<userdata name="toolTip">
				<![CDATA[
					<dl>
						<dt>Table:&nbsp;
				]]>
							<xsl:value-of select="@Name"/>
				<![CDATA[
						</dt>
						<dd>
				]]>
					<xsl:value-of select="concat(@Source,' ',@Type)"/>
				<![CDATA[
						</dd>
					</dl>
				]]> 
			</userdata> 
		</item>
	</xsl:template>
</xsl:stylesheet>
