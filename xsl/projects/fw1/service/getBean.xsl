	&lt;cffunction name="getBean" access="public" output="false" returntype="any"&gt;
		<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']">&lt;cfargument name="<xsl:value-of select="@name" />" type="<xsl:value-of select="@type" />" required="true" /&gt;
		</xsl:for-each>
		&lt;cfset var <xsl:value-of select="//bean/@name"/> = create(argumentCollection=arguments) /&gt;
		&lt;cfset variables.<xsl:value-of select="//bean/@name"/>DAO.read(<xsl:value-of select="//bean/@name"/>) /&gt;
		&lt;cfreturn <xsl:value-of select="//bean/@name"/> /&gt;
	&lt;/cffunction&gt;