<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--Not Modifiable-->
	<xsl:output method="xml" encoding="UTF-8"/>
	<xsl:template match="/">
	
		<rows> 
			<head>
				<xsl:apply-templates select="//dbquery[@id='main']/columns/column"/>
			</head>
			<xsl:apply-templates select="//dbquery[@id='main']/rows/row"/>
		</rows>
	</xsl:template>
	<xsl:template match="//dbquery[@id='main']/columns/column">
		<xsl:variable name="dataType">
			<xsl:choose>
				<xsl:when test="@type='BIT'">str</xsl:when>
				<xsl:when test="@type='DATETIME'">str</xsl:when>
				<xsl:when test="@type='BIGINT'">int</xsl:when>
				<xsl:when test="@type='INT'">int</xsl:when>
				<xsl:otherwise>str</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<column  width="*" type="ro" align="left" sort="{$dataType}"><xsl:value-of select="@name" /></column>
	</xsl:template>
	<xsl:template match="//dbquery[@id='main']/rows/row">
			<row>
				<xsl:apply-templates select="./@*"/>
			</row>
	</xsl:template>
	<xsl:template match="//dbquery[@id='main']/rows/row/@*">
				<cell type='ro'><xsl:value-of select="." /></cell>
	</xsl:template>
</xsl:stylesheet>