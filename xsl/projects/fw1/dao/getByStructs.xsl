	&lt;cffunction name="getByStructs" access="public" output="false" returntype="array"&gt;
		<xsl:for-each select="root/bean/dbtable/column">&lt;cfargument name="<xsl:value-of select="@name" />" type="<xsl:value-of select="@type" />" required="false" /&gt;
		</xsl:for-each>&lt;cfargument name="orderby" type="string" required="false" /&gt;
		
		&lt;cfset var qList = getByAttributesQuery(argumentCollection=arguments) /&gt;		
		&lt;cfset var arrStructs = arrayNew(1) /&gt;
		&lt;cfset var i = 0 /&gt;
		&lt;cfset var tmpstr = structNew() /&gt;
		&lt;cfloop from="1" to="#qList.recordCount#" index="i"&gt;
			&lt;cfset tmpstr = queryRowToStruct(arguments.qList,i) /&gt;
			&lt;cfset arrayAppend(arrStructs,tmpstr) /&gt;
		&lt;/cfloop&gt;
				
		&lt;cfreturn arrStructs /&gt;
	&lt;/cffunction&gt;