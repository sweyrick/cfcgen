	&lt;cffunction name="save" access="public" output="false" returntype="any"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;
		
		&lt;cfset var <xsl:value-of select="//bean/@name"/>Bean = createObject("component","#arguments.bean#<xsl:value-of select="//bean/@name"/>") /&gt;
		&lt;cfif exists(arguments.<xsl:value-of select="//bean/@name"/>)&gt;
			&lt;cfset <xsl:value-of select="//bean/@name"/>Bean = update(arguments.<xsl:value-of select="//bean/@name"/>) /&gt;
		&lt;cfelse&gt;
			&lt;cfset <xsl:value-of select="//bean/@name"/>Bean = create(arguments.<xsl:value-of select="//bean/@name"/>) /&gt;
		&lt;/cfif&gt;
		
		&lt;cfreturn <xsl:value-of select="//bean/@name"/>Bean /&gt;
	&lt;/cffunction&gt;