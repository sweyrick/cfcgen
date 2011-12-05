	&lt;cffunction name="save" access="public" output="false" returntype="<xsl:value-of select="//bean/@name"/>"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;
		
		&lt;cfset var ret = ""/&gt;
		
		&lt;cfif exists(arguments.<xsl:value-of select="//bean/@name"/>)&gt;
			&lt;cfset ret = update(<xsl:value-of select="//bean/@name"/>) /&gt;
		&lt;cfelse&gt;
			&lt;cfset ret = create(arguments.<xsl:value-of select="//bean/@name"/>) /&gt;
		&lt;/cfif&gt;
		
		&lt;cfreturn ret /&gt;
	&lt;/cffunction&gt;