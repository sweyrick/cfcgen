<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="no"  />
		<xsl:template match="/">
&lt;cfcomponent name="<xsl:value-of select="//bean/@name"/>Service" output="false" extends="baseService"&gt;
	<!-- custom code -->
&lt;/cfcomponent&gt;
</xsl:template>

</xsl:stylesheet>