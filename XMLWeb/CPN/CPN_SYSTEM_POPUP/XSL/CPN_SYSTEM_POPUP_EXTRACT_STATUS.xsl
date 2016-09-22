<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>	

<xsl:template match='/'>	
    <!-- Modal content-->
    <div class="modal-content">
       	<div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">X</button>
            <h4 class="modal-title">
            	List of Extractions, views and tables used 
            	<small> (Origin : <xsl:value-of select='$vNodeName'/>)</small>
            </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive" >
					  	<table class="table table-striped table-bordered table-condensed display" width="800px" >
						    <thead class="MRHead">
								<tr>
									<TH width='40%'>Extraction(s) Used</TH>
									<TH width='15%'>Extraction Status</TH>
									<TH width='30%'>Source</TH>
									<TH width='15%'>Last Date</TH>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select = "//dbquery[@id='DBN_REP_VIEWS']/rows/row">
									<tr>
										<td align='left'>
											<b><xsl:value-of select='upper-case(@dbn_repv_viewname)'/></b>
										</td>
										<td align='center'>
											<xsl:choose>
												<xsl:when test="@Ref_Status = 'OK'">
													<span class="label label-success">Updated</span>
												</xsl:when>
												<xsl:when test="@dbn_repv_source='ILIAS (NRT)'">
													<span class="label label-primary">Updated (Real-Time)</span>
												</xsl:when>
												<xsl:when test="@Ref_Status = 'Not OK' ">
													<span class="label label-danger"><b>Not</b> Updated</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="label label-warning"><b>Unknown</b> Source</span>
												</xsl:otherwise>		
											</xsl:choose>
										</td>
										<xsl:choose>
											<xsl:when test="@Source = 'Datamart' ">
												<td bgcolor="#EBF4FA" align='center'>
													<xsl:value-of select="@Source"/> (<xsl:value-of select="@Type"/>)
												</td>
											</xsl:when>
											<xsl:when test="@Source = 'DB Node MR' and @Freq='0'">
												<td bgcolor="#F1EFE2" align='center'>
													<xsl:value-of select="@Source"/> (<xsl:value-of select="@Type"/>)
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
										<td align='center'>
											<xsl:value-of select="@LstData"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
					  	</table>
					</div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <center>
			        <div class="col-md-10">
                        <p style="font-style:italic;color:red">This report has been build with <b>Report CPN (Common Pilar Node Framework)</b>.<br/>
                        <u>POC</u> : <b><xsl:value-of select='$vWebMaster'/></b></p>
                    </div>
            </center>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
    </div>
</xsl:template>
<xsl:include href='../../../COMMON/Node_Config.xsl'/>
<xsl:include href='../../../COMMON/Report_Components.xsl'/>
</xsl:stylesheet>