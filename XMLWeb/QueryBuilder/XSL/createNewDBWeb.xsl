<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--Not Modifiable-->
	<xsl:output method="xml" encoding="UTF-8"/>
	<xsl:template match="/">
		<xsl:variable name='nlf'><xsl:text>&#10;</xsl:text></xsl:variable>
		<xsl:variable name='tab'><xsl:text>&#x9;</xsl:text></xsl:variable>
		<xsl:variable name='acc'><xsl:text>&quot;</xsl:text></xsl:variable>
		<xsl:variable name='queryVar'><xsl:value-of select="//dbquery[@id='main']/descriptor/parameters/param[@name='@query']/@value"/></xsl:variable>
		<dbwebdescriptor version='2.0'><xsl:value-of select="$nlf"/><xsl:value-of select="$tab"/>
			<label>DBWeb created by Visual QueryBuilder</label><xsl:value-of select="$nlf"/><xsl:value-of select="$tab"/>
			<description>DBWeb created by Visual QueryBuilder</description><xsl:value-of select="$nlf"/><xsl:value-of select="$tab"/>
			<queries><xsl:value-of select="$nlf"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
				<querystring id='main' database='dbnode'><xsl:value-of select="$nlf"/>
					<xsl:value-of select="replace(replace(replace(replace(replace($queryVar,'\[\[SPACE\]\]',' '),'\[\[TAB\]\]','&#x9;'),'\[\[NLF\]\]','&#10;'),'\[\[COMMA\]\]',','),'\[\[ACC\]\]',$acc)" />
					<xsl:value-of select="$nlf"/><xsl:value-of select="$tab"/><xsl:value-of select="$tab"/>
				</querystring><xsl:value-of select="$nlf"/><xsl:value-of select="$tab"/>
			</queries><xsl:value-of select="$nlf"/>

		</dbwebdescriptor>
	</xsl:template>
</xsl:stylesheet>