<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--Not Modifiable-->
	<xsl:output method="xml" encoding="UTF-8"/>
	<xsl:template match="/">
		<item id="{//dbquery[@id='ListFields']/descriptor/parameters/param[@name='@TableName']/@value}"> 			
			<xsl:apply-templates select="//dbquery[@id='ListFields']/rows/row"/>
		</item>
	</xsl:template>

	 <xsl:template  name="format_index">
	 <xsl:param name="Index" />
		<xsl:for-each select="tokenize($Index,';')">
			<![CDATA[<li>]]>
			<xsl:sequence select="."/>
			<![CDATA[</li>]]>
<!-- 			<xsl:if test="not(position() eq last())"><br /></xsl:if>-->		
		</xsl:for-each>
	 </xsl:template>

	
	<xsl:template match="//dbquery[@id='ListFields']/rows/row">
		 <item 
			id="{concat(@Table,'_field_',position())}"
			text="{@Name}" 
			child="0"
		>
			<xsl:choose>
				<xsl:when test="@Nullable='NO' and @Index!=''">
					<xsl:attribute name="im0">CustomIcons/bullet_red.png</xsl:attribute>
				</xsl:when>
				<xsl:when test="@Nullable='YES' and @Index!=''">
					<xsl:attribute name="im0">CustomIcons/NullableIndex.png</xsl:attribute>
				</xsl:when>
				<xsl:when test="@Nullable='NO' and @Index=''">
					<xsl:attribute name="im0">CustomIcons/bullet_blue.png</xsl:attribute>
				</xsl:when>
				<xsl:when test="@Nullable='YES' and @Index=''">
					<xsl:attribute name="im0">CustomIcons/NullableNoIndex.png</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<userdata name="dataType"><xsl:value-of select="@DataType"/></userdata>
			<userdata name="toolTip">
				<![CDATA[
					<dl>
						<dt>Field:&nbsp;
				]]>
							<xsl:value-of select="@Name"/>
				<![CDATA[
						</dt>
						<dd>
							<ul>
								<li>
									<strong>Nullable:&nbsp;</strong>
				]]>
									<xsl:value-of select="@Nullable"/>
				<![CDATA[	
								</li>
								<li>
									<strong>Index:&nbsp;</strong>
				]]>
									<xsl:choose>
										<xsl:when test="@Index!=''">
											<![CDATA[<ul>]]>
												<xsl:call-template name="format_index" >
													<xsl:with-param name="Index" select="@Index" />
												</xsl:call-template>
											<![CDATA[</ul>]]>
										</xsl:when>
										<xsl:when test="@Index=''">
											No Index
										</xsl:when>
									</xsl:choose>
				<![CDATA[	
								</li>
								<li>
									<strong>Data Type:&nbsp;</strong>
				]]>
									<xsl:value-of select="@DataType"/>
						
				<![CDATA[
								</li>
							</ul>
						</dd>
					</dl>
				]]> 
			</userdata> 
		</item> 			
	</xsl:template>
</xsl:stylesheet>
