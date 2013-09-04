	&lt;cffunction name="create" access="public" output="false" returntype="any"&gt;
		<xsl:for-each select="root/bean/dbtable/column">&lt;cfargument name="<xsl:value-of select="@name" />" type="string" required="<xsl:choose><xsl:when test="@primaryKey='Yes'">true</xsl:when><xsl:otherwise>false</xsl:otherwise></xsl:choose>" /&gt;
		</xsl:for-each>
			
		&lt;cfset var <xsl:value-of select="//bean/@name"/> = createObject("component","#application.beans#<xsl:value-of select="//bean/@name"/>").init(argumentCollection=arguments) /&gt;
		&lt;cfreturn <xsl:value-of select="//bean/@name"/> /&gt;
	&lt;/cffunction&gt;