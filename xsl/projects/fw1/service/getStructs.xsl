	&lt;cffunction name="get<xsl:value-of select="//bean/@name"/>sStructs" access="public" output="false" returntype="array"&gt;
		<xsl:for-each select="root/bean/dbtable/column">&lt;cfargument name="<xsl:value-of select="@name" />" type="<xsl:value-of select="@type" />" required="false" /&gt;
		</xsl:for-each>
		&lt;cfreturn variables.<xsl:value-of select="//bean/@name"/>DAO.getByStructs(argumentCollection=arguments) /&gt;
	&lt;/cffunction&gt;