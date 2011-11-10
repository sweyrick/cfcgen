&lt;cffunction name="create" access="public" output="false" returnformat="JSON"&gt;
		&lt;cfargument name="model" type="string" required="true" /&gt;
		&lt;cfset var r = getResponse() /&gt;
		&lt;cfset var l = {} /&gt;
		
		&lt;cfset var l.<xsl:value-of select="//bean/@name"/> = new <xsl:value-of select="//bean/@name"/>() /&gt;
		&lt;cfset l.<xsl:value-of select="//bean/@name"/>.init(argumentCollection=deserializejson(arguments.model))/&gt;
		&lt;cfset r.data = variables.<xsl:value-of select="//bean/@name"/>DAO.save(<xsl:value-of select="//bean/@name"/>)/&gt;
		&lt;cfreturn r /&gt;
	&lt;/cffunction&gt;