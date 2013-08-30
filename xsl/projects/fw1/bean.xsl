<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="no"  />
		<xsl:template match="/">
component displayname="<xsl:value-of select="//bean/@name"/>" output="false" accessors="true"
{
	<xsl:for-each select="root/bean/dbtable/column">property name="<xsl:value-of select="@name" />" type="<xsl:value-of select="@type" />" default="";
	</xsl:for-each>

	public <xsl:value-of select="//bean/@path"/> function init(<xsl:for-each select="root/bean/dbtable/column"><xsl:choose><xsl:when test="@type='uuid'">uuid</xsl:when><xsl:otherwise>string </xsl:otherwise></xsl:choose><xsl:value-of select="@name" />=""<xsl:if test="position() != last()">, </xsl:if></xsl:for-each>)
	{
		<xsl:for-each select="root/bean/dbtable/column">set<xsl:value-of select="@name" />(arguments.<xsl:value-of select="@name" />);
		</xsl:for-each>
		return this;
 	}
 	
 	public struct function getMemento() 
	{ 
	  var properties = {};
	  for (local.md = getMetaData(this); 
	       structKeyExists(md, "extends"); 
	       md = md.extends) 
	  { 
	    if (structKeyExists(md, "properties")) 
	    { 
	      for (local.i = 1; 
	           i &lt;= arrayLen(md.properties); 
	           i++) 
	      { 
	        local.pName = lcase(md.properties[i].name); 
	        local.properties[pName] 
	          = structKeyExists(variables, pName) ? 
	            variables[pName] : ""; 
	      } 
	    } 
	  } 
	  return duplicate(properties); 
	}
	
	public void function setMemento( struct memento ){
	    var i="";
	    var md = getMetaData( this );
	   
	    for( i=1;i&lt;=arrayLen( md.properties );i++ ){
	        if ( structKeyExists( arguments.memento,md.properties[i]["name"] ) )
	            variables[md.properties[i]["name"]] = trim(arguments.memento[md.properties[i]["name"]]);
	            
	    }
	}

}</xsl:template>
</xsl:stylesheet>