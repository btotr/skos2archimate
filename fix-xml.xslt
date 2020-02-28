<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
	xmlns:archimate="http://www.opengroup.org/xsd/archimate/3.0">
	
	<!-- fix order -->
   <!--xsl:template match="archimate:element">
		<xsl:copy>
			<xsl:copy-of select="archimate:name"/>
			<xsl:copy-of select="archimate:documentation"/>
		</xsl:copy>
	</xsl:template-->
	
	
	<!-- fix namespace -->	
  <xsl:template match="*">
        <xsl:element name="{local-name()}" namespace="http://www.opengroup.org/xsd/archimate/3.0/" >
            <xsl:copy-of select="attribute::*"/>
            <xsl:apply-templates />
        </xsl:element>
  </xsl:template>
  
    <xsl:template match="@*">
    <xsl:attribute name="{local-name()}" namespace="''">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
	
 
</xsl:stylesheet>