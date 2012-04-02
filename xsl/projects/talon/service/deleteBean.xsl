	&lt;cffunction name="delete" access="remote" output="false" hint="Delete <xsl:value-of select="//bean/@name"/> JSON object from database." returnformat="JSON"&gt;
		&lt;cfargument name="model" type="string" required="true" hint="JSON model from front end." /&gt;
		&lt;cfset var r = {} /&gt;
		&lt;cfset var l = {} /&gt;
		&lt;cfset l.<xsl:value-of select="//bean/@name"/> = new <xsl:value-of select="//bean/@name"/>() /&gt;
		&lt;cfset l.<xsl:value-of select="//bean/@name"/>DAO = application.<xsl:value-of select="//bean/@name"/>DAO /&gt;
		&lt;cfset l.<xsl:value-of select="//bean/@name"/>.init(argumentCollection=deserializejson(arguments.model)) /&gt;
		&lt;cfset r['data'] = l.<xsl:value-of select="//bean/@name"/>DAO.update(l.<xsl:value-of select="//bean/@name"/>) /&gt;
		&lt;cfreturn r.data /&gt;
	&lt;/cffunction&gt;