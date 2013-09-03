	&lt;cffunction name="save" access="public" output="false" returntype="any"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;

		&lt;cfreturn variables.<xsl:value-of select="//bean/@name"/>DAO.save(<xsl:value-of select="//bean/@name"/>) /&gt;
	&lt;/cffunction&gt;