<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>	
	
<xsl:template match='/'>	
    <!-- Modal content-->
    <div class="modal-content">
       	<div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">X</button>
            <h4 class="modal-title">List of Modifications for This Report <small> (Origin : <xsl:value-of select='$vNodeName'/>)</small></h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive" >
					  	<table class="table table-striped table-bordered table-condensed display" width="800px" >
						    <thead class="MRHead">
								<tr>
									<TH width='10%'>Version</TH>
									<TH width='15%'>Date</TH>
									<TH width='15%'>By</TH>
									<TH width='60%'>What</TH>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="vQUOTE">'</xsl:variable>
								<xsl:for-each select = "//dbquery[@id='DBN_REP_LOGGING']/rows/row">
									<tr>
										<td align='center'><xsl:value-of select='@dbn_repl_ver'/></td>
										<td align='center'><xsl:value-of select='substring(@dbn_repl_date,1,10)'/></td>
										<td align='left'>
											<xsl:value-of select="replace(@dbn_repl_by,$vQUOTE,'')"/>
										</td>
										<td align='left'>
											<xsl:value-of select='@dbn_repl_what'  disable-output-escaping="yes"/>
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