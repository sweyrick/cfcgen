	&lt;cffunction name="update" access="remote" output="false" returnformat="JSON"&gt;
		&lt;cfargument name="model" type="string" required="true" /&gt;
		&lt;cfset var r = getResponse() /&gt;
		&lt;cfset var l = {} /&gt;
		&lt;cfif r.success&gt;
			&lt;cfset var l.<xsl:value-of select="//bean/@name"/> = new <xsl:value-of select="//bean/@name"/>() /&gt;
			&lt;cfset l.<xsl:value-of select="//bean/@name"/>DAO = getobj('<xsl:value-of select="//bean/@name"/>DAO') /&gt;
			&lt;cfset l.<xsl:value-of select="//bean/@name"/>.init(argumentCollection=deserializejson(arguments.model))/&gt;
			&lt;cfset r.data = l.<xsl:value-of select="//bean/@name"/>DAO.update(l.<xsl:value-of select="//bean/@name"/>)/&gt;
		&lt;/cfif&gt;
		&lt;cfreturn r /&gt;
	&lt;/cffunction&gt;