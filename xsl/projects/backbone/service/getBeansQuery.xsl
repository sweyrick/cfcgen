	&lt;cffunction name="read" access="public" output="false" returnformat="JSON"&gt;
		&lt;cfargument name="model" type="string" required="true" /&gt;
		&lt;cfset var r = getResponse() /&gt;
		&lt;cfset var l = {} /&gt;
		&lt;cfset r.data = variables.<xsl:value-of select="//bean/@name"/>Gateway.getByAttributes(argumentCollection=deserializejson(arguments.model))/&gt;
		&lt;cfreturn r /&gt;
	&lt;/cffunction&gt;