<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" 
xmlns="urn:schemas-microsoft-com:office:spreadsheet"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
xmlns:fn="http://www.w3.org/2005/02/xpath-functions">  
<xsl:decimal-format name="european" decimal-separator="," grouping-separator="."/>
	<xsl:template match="*" mode='makeDoc'>
		<xsl:param name="title"/>
		<xsl:param name="filter"/>
		<Workbook>
		
			
			<Styles>
				<Style ss:ID="Default" ss:Name="Normal">
					<Alignment ss:Vertical="Center"/>
					<Borders/>
					<Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#000000"/>
					<Interior/>
					<NumberFormat/>
					<Protection/>
				</Style>
				<Style ss:ID="header">
					<Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
					<Borders>
						<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
						<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
						<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
						<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
					</Borders>
					 <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="11" ss:Color="#FFFFFF" ss:Bold="1"/>
					<Interior ss:Color="#1F497D" ss:Pattern="Solid"/>
				</Style>
				<Style ss:ID="date">
					 <NumberFormat ss:Format="dd\ mmm\ yyyy"/>
				</Style>
				 <Style ss:ID="multiLine">
					<Alignment ss:Vertical="Center" ss:WrapText="1"/>
				 </Style>
			</Styles>
			
			<xsl:apply-templates select="//dbquery" mode="makeWorkSheet">
				<xsl:with-param name="title" select="$title"/>
				<xsl:with-param name="filter" select="$filter"/>
			</xsl:apply-templates>
			
			
			
		</Workbook>	
	</xsl:template>


	
	<xsl:template match="*" mode="makeWorkSheet">
		<xsl:param name="title"/>
		<xsl:param name="filter"/>
		<xsl:variable name="queryId" select="@id"/>
		<Worksheet ss:Name="{@id}">
			<Names>
				<NamedRange ss:Name="Print_Area" ss:RefersTo="{concat('=',@id,'!C1:C',count(.//column))}"/>
				<NamedRange ss:Name="Print_Titles" ss:RefersTo="{concat('=',@id,'!R1')}"/>
			</Names>
			
			<Table x:FullColumns="1" x:FullRows="1">
					
				<xsl:apply-templates select=".//columns/column" mode="SetColumns">
					<xsl:with-param name="queryId" select="$queryId"/>
				</xsl:apply-templates>
				
				<Row>
					<xsl:apply-templates select=".//columns/column" mode="SetHeaders"/>
				</Row>
				
				<xsl:apply-templates select=".//rows" mode="SetRows">
					<xsl:with-param name="queryId" select="$queryId"/>
				</xsl:apply-templates>
				
			</Table>
				
			<xsl:call-template name="WorksheetOptions">
				<xsl:with-param name="numberRows" select="count(.//row)"/>
				<xsl:with-param name="numberCols" select="count(.//column)"/>
				<xsl:with-param name="title" select="$title"/>
				<xsl:with-param name="filter" select="$filter"/>
			</xsl:call-template>
		</Worksheet>
	</xsl:template>
	
	<xsl:template name='WorksheetOptions'>
		<xsl:param name="numberRows"/>
		<xsl:param name="numberCols"/>
		<xsl:param name="title"/>
		<xsl:param name="filter"/>
		<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
			<PageSetup>
				<Layout x:Orientation="Landscape"/>
				<Header x:Margin="0.31496062992125984"
				 x:Data="{concat('&amp;C',$title,'&amp;RReport created on ',format-date(current-date(), '[D01]/[M01]/[Y0001]'))}"/>
				<Footer x:Margin="0.31496062992125984" x:Data="{concat('&amp;L&amp;F - &amp;A&amp;C',$filter,'&amp;Rpage &amp;P of &amp;N')}"/>
				<PageMargins x:Bottom="0.74803149606299213" x:Left="0.70866141732283472"
				 x:Right="0.70866141732283472" x:Top="0.74803149606299213"/>
			</PageSetup>
			<FitToPage/>
			<Print>
			<FitHeight>0</FitHeight>
			<ValidPrinterInfo/>
			<PaperSizeIndex>9</PaperSizeIndex>
			<Scale>89</Scale>
			<HorizontalResolution>600</HorizontalResolution>
			<VerticalResolution>600</VerticalResolution>
			</Print>
			<Selected/>
			<TopRowVisible>0</TopRowVisible>
			<ProtectObjects>False</ProtectObjects>
			<ProtectScenarios>False</ProtectScenarios>
		</WorksheetOptions>
		<ConditionalFormatting xmlns="urn:schemas-microsoft-com:office:excel">
			<Range><xsl:value-of select="concat('R2C1:R',$numberRows+1,'C',$numberCols)"/></Range>
			<Condition>
				<Value1>MOD(ROW(),2)=1</Value1>
				<Format Style='background:#C5D9F1'/>
			</Condition>
		</ConditionalFormatting>
		<AutoFilter  xmlns="urn:schemas-microsoft-com:office:excel">
			<xsl:attribute name="x:Range">
				<xsl:value-of select="concat('R1C1:R1C',$numberCols)"/>
			</xsl:attribute>
		</AutoFilter>
	</xsl:template>
	
	
	
	<xsl:template match="column" mode="SetColumns">
		<xsl:param name="queryId"/>
		<xsl:variable name="name"><xsl:value-of select="@name"/></xsl:variable>
		<xsl:variable name="Length">
			<xsl:choose>
				<xsl:when test="//dbquery[@id=$queryId]/rows/row/@*[name()=$name]">
					<xsl:for-each select="//dbquery[@id=$queryId]/rows/row/@*[name()=$name]">
						<xsl:sort select="string-length(normalize-space(.))" order="descending" data-type="number"/>
						<xsl:if test="position() = 1">
							<xsl:value-of select="string-length(normalize-space(.))"/>
						</xsl:if>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>0</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<Column>
			<xsl:attribute name="ss:Width">	
				<xsl:value-of select="min((max(($Length*6+10,string-length($name)*7+10)),200))"/>
			</xsl:attribute>
		</Column>
	</xsl:template>
	
	
	
	
	
	
	<xsl:template match="column" mode="SetHeaders">
		<Cell ss:StyleID="header">
			<Data ss:Type="String">
				<xsl:value-of select="concat(upper-case(substring(@name,1,1)),substring(@name, 2))"/>
			</Data>
			<NamedCell ss:Name="Print_Titles"/>
			<NamedCell ss:Name="Print_Area"/>
		</Cell>
	</xsl:template>
	
	
	<xsl:template match="row" mode="SetRows">
		<xsl:param name="queryId"/>
		<Row>
			<xsl:apply-templates select="./@*" mode="SetCell">
				<xsl:with-param name="queryId" select="$queryId"/>
			</xsl:apply-templates>
		</Row>
	</xsl:template>
	
	
	
	<xsl:template match="@*" mode="SetCell">
		<xsl:param name="queryId"/>
		<xsl:variable name="name"><xsl:value-of select="name()"/></xsl:variable>
		<xsl:variable name="dataType">
			<xsl:choose>
				<xsl:when test="//dbquery[@id=$queryId]/columns/column[@name=$name]/@type='BIT'">Boolean</xsl:when>
				<xsl:when test="//dbquery[@id=$queryId]/columns/column[@name=$name]/@type='DATETIME'">DateTime</xsl:when>
				<xsl:otherwise>String</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<Cell>
			<xsl:choose>
				<xsl:when test="$dataType='DateTime'">
					<xsl:attribute name="ss:StyleID">date</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
						<xsl:attribute name="ss:StyleID">multiLine</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<Data ss:Type="{$dataType}">
				<xsl:choose>
					<xsl:when test="$dataType='DateTime'">
						<xsl:value-of select="replace(.,' ','T')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="normalize-space(replace(.,'.&#13;','blbbla||||'))"/>
					</xsl:otherwise>
				</xsl:choose>
				
			</Data>
			<NamedCell ss:Name="Print_Area"/>
		</Cell>
	</xsl:template>

	<xsl:template name="getDateTime">
		<xsl:param name="Date"/>
		<xsl:value-of select="concat(substring($Date,7),'-',substring($Date,4,2),'-',substring($Date,1,2),'T','00:00:00.000')"/>
	</xsl:template>
	
	
</xsl:stylesheet>