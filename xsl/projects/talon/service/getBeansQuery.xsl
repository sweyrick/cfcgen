	&lt;cffunction name="read" access="remote" output="false" hint="Returns <xsl:value-of select="//bean/@name"/> JSON objects based on JSON structure arguments." returnformat="JSON"&gt;
		&lt;cfargument name="model" type="string" required="true" default="{}" hint="JSON model from front end." /&gt;
		&lt;cfset var r = {} /&gt;
		&lt;cfset var l = {} /&gt;
		&lt;cfset l.<xsl:value-of select="//bean/@name"/>DAO = application.<xsl:value-of select="//bean/@name"/> /&gt;
		&lt;cfset r['data'] = l.<xsl:value-of select="//bean/@name"/>DAO.get(argumentCollection=deserializejson(arguments.model)) /&gt;
		&lt;cfreturn r /&gt;
	&lt;/cffunction&gt;