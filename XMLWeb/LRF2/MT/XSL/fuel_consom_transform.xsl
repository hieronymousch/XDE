<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- START : Use this to avoid error illegal characters html --> 
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match='/'>	

		<!-- Structure xml à obtenir
		Exemple:
		<chart>
		<categories>
			<item>WSC1</item>
			<item>WSC2</item>
			<item>WSC3</item>
			<item>WSC4</item>
		</categories>
		<series>
			<name>Jan</name>
			<data>
				<point>128</point>
				<point>144</point>
				<point>641</point>
				<point>51</point>
			</data>
		</series>
		<series>
			<name>Feb</name>
			<data>
				<point>341</point>
				<point>425</point>
				<point>274</point>
				<point>313</point>
			</data>
		-->
			<xsl:element name="chart">
				<xsl:element name="categories">
					   <xsl:for-each-group select='//dbquery["FUEL_CONSOM"]/rows/row' group-by='@categories'>
							 <xsl:call-template name="get_categorie">
								 <xsl:with-param name="category" select="current-grouping-key()"/>
							  </xsl:call-template>
						</xsl:for-each-group>
				</xsl:element>
				
				<xsl:for-each-group select='//dbquery["FUEL_CONSOM"]/rows/row' group-by='@name'>
					<xsl:variable name="vName" select="current-grouping-key()"/>
					<xsl:element name="series">
						<xsl:element name="name">
						   <xsl:value-of select="$vName" />
						</xsl:element>
						<xsl:element name="data">
							<xsl:for-each-group select='//dbquery["FUEL_CONSOM"]/rows/row' group-by='@categories'>
										<xsl:variable name="vCategory" select="current-grouping-key()"/>
										
											 <xsl:call-template name="get_series">
												 <xsl:with-param name="name" select="$vName"/>
												 <xsl:with-param name="category" select="$vCategory"/>
											 </xsl:call-template>
										
							</xsl:for-each-group>
						</xsl:element>
					</xsl:element>
				</xsl:for-each-group>
				
				<!--<xsl:element name="series">
						<xsl:for-each-group select='//dbquery["FUEL_CONSOM"]/rows/row' group-by='@name'>
							<xsl:variable name="vMonth" select="current-grouping-key()"/>
							<xsl:element name="name">
							   <xsl:value-of select="$vMonth" />
							</xsl:element>
							<xsl:element name="data">
							   <xsl:for-each-group select='//dbquery["FUEL_CONSOM"]/rows/row[@name=$vMonth]' group-by='@categories'>
									 <xsl:element name="point">
										<xsl:value-of select="@data" />
									 </xsl:element>
								</xsl:for-each-group>
							</xsl:element>
						</xsl:for-each-group>
				</xsl:element>-->
			</xsl:element>
</xsl:template>	


<xsl:template name="get_categorie">
	<xsl:param name="category"/>
		<xsl:element name="item">
		   <xsl:value-of select="$category" />
		 </xsl:element>
 </xsl:template>

<xsl:template name="get_series">
	<xsl:param name="name"/>
	<xsl:param name="category"/>
		
			
		<xsl:choose>
			<xsl:when test='count(//dbquery["FUEL_CONSOM"]/rows/row[@name=$name and @categories=$category])&gt;0'>
				<xsl:element name="point">
				   <xsl:value-of select='//dbquery["FUEL_CONSOM"]/rows/row[@name=$name and @categories=$category]/@data' />
				</xsl:element>
			</xsl:when >
			<xsl:otherwise>
				<xsl:element name="point">
				   0
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>

		
 </xsl:template>	
</xsl:stylesheet>
