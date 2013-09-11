<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="no"  />
		<xsl:template match="/">
component displayname="<xsl:value-of select="//bean/@name"/>_validator" output="false" extends="base_validator"
{
	<!-- custom code -->
}</xsl:template>
</xsl:stylesheet>