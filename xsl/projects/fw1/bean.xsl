<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="no"  />
		<xsl:template match="/">
component displayname="<xsl:value-of select="//bean/@name"/>" output="false" accessors="true"
{
	<xsl:for-each select="root/bean/dbtable/column">property name="<xsl:value-of select="@name" />" type="string" default="";
	</xsl:for-each>

	public <xsl:value-of select="//bean/@path"/> function init(<xsl:for-each select="root/bean/dbtable/column"><xsl:choose><xsl:when test="@type='uuid'">uuid</xsl:when><xsl:otherwise>string </xsl:otherwise></xsl:choose><xsl:value-of select="@name" />=""<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>)
	{
		<xsl:for-each select="root/bean/dbtable/column">set<xsl:value-of select="@name" />(arguments.<xsl:value-of select="@name" />);
		</xsl:for-each>
		return this;
 	}
	
	<!-- custom code -->

}</xsl:template>
</xsl:stylesheet>