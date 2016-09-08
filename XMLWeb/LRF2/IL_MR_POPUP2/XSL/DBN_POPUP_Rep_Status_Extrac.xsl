<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>	
	
<xsl:template match='/'>	
	<div class="CPNpopup">
		<h2>
			<center>
				<u>
					Views or Tables used for This Report
				</u>
			</center>
		</h2>
		<table border="0" width="100%" align="center" class="display">
			<thead class="MRHead">
				<tr>
					<TH width='50%'>Extraction(s) Used</TH>
					<TH width='15%'>Extraction Status</TH>
					<TH width='15%'>Source</TH>
					<TH width='20%'>Last Date</TH>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select = "//dbquery[@id='DBN_REP_VIEWS']/rows/row">
					<tr>
						<td align='left'><xsl:value-of select='upper-case(@dbn_repv_viewname)'/></td>
						<xsl:choose>
							<xsl:when test="@Extr_Status = 'OK'">
								<td bgcolor="#00FF00" align='center'>
									<xsl:value-of select="@Extr_Status"/>
								</td>
							</xsl:when>
							<xsl:when test="@dbn_repv_source='ILIAS (NRT)'">
								<td bgcolor="#00FF00" align='center'>
									OK
								</td>
							</xsl:when>
							<xsl:when test="@Ref_Status = 'Not OK' ">
								<td bgcolor="#FF0000" align='center'>
									<xsl:value-of select="@Ref_Status"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td bgcolor="#FEDC2B" align='center'>
									Unknown
								</td>
							</xsl:otherwise>		
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="@Source = 'Datamart' ">
								<td bgcolor="#EBF4FA" align='center'>
									<xsl:value-of select="@Source"/>
									<xsl:if test="@Type!=''">
										(<xsl:value-of select="@Type"/>)
									</xsl:if>
								</td>
							</xsl:when>
							<xsl:when test="@Source = 'DB Node MR' and @Freq='0'">
								<td bgcolor="#F1EFE2" align='center'>
									<xsl:value-of select="@Source"/>
									<xsl:if test="@Type!=''">
										(<xsl:value-of select="@Type"/>)
									</xsl:if>
								</td>
							</xsl:when>
							<xsl:when test="@dbn_repv_source='ILIAS (NRT)'">
								<td bgcolor="#54A4DE" align='center'>
									<xsl:value-of select="@dbn_repv_source"/>
								</td>
							</xsl:when>
							<xsl:when test="@Source = '' ">
								<td bgcolor="#FEDC2B" align='center'>
									Unknown
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td bgcolor="#FF6666" align='center'>
									<xsl:value-of select="@Source"/> (<xsl:value-of select="@Type"/>)
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<td><xsl:value-of select="@LstData"/></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</div>
</xsl:template>
</xsl:stylesheet>