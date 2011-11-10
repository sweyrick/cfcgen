	&lt;cffunction name="save" access="public" output="false" returntype="<xsl:value-of select="//bean/@name"/>"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;
		
		&lt;cfset var returnedPK = 0 /&gt;
		&lt;cfset var success = false /&gt;
		&lt;cfif exists(arguments.<xsl:value-of select="//bean/@name"/>)&gt;
			&lt;cfset returnedPK = update(<xsl:value-of select="//bean/@name"/>) /&gt;
		&lt;cfelse&gt;
			&lt;cfset returnedPK = create(arguments.<xsl:value-of select="//bean/@name"/>) /&gt;
			&lt;cfset arguments.<xsl:value-of select="//bean/@name"/>.setid(returnedPK) /&gt;
		&lt;/cfif&gt;
		
		&lt;cfreturn arguments.<xsl:value-of select="//bean/@name"/> /&gt;
	&lt;/cffunction&gt;