	&lt;cffunction name="read" access="remote" output="false" returnformat="JSON"&gt;
		&lt;cfargument name="model" type="string" required="true" /&gt;
		&lt;cfset var r = getResponse() /&gt;
		&lt;cfset var l = {} /&gt;
		&lt;cfif r.success&gt;
			&lt;cfset l.<xsl:value-of select="//bean/@name"/>DAO = getobj('<xsl:value-of select="//bean/@name"/>DAO') /&gt;
			&lt;cfset r.data = l.<xsl:value-of select="//bean/@name"/>DAO.get(argumentCollection=deserializejson(arguments.model)) /&gt;
		&lt;/cfif&gt;
		&lt;cfreturn r /&gt;
	&lt;/cffunction&gt;