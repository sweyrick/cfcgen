	&lt;cffunction name="queryToArray" access="public" output="false" returntype="array" hint="converts a query into an array of structs"&gt;
		&lt;cfargument name="qList" type="query" required="true"&gt;
		
		&lt;cfset var tmpstr = structNew() /&gt;
		&lt;cfset var i = "" />
		&lt;cfset var arrStructs = arrayNew(1) /&gt;
		
		&lt;cfloop from="1" to="#qList.recordCount#" index="i"&gt;
			&lt;cfset tmpstr = queryRowToStruct(arguments.qList,i) /&gt;
			&lt;cfset arrayAppend(arrStructs,tmpstr) /&gt;
		&lt;/cfloop&gt;
		
		&lt;cfreturn arrStructs /&gt;
	&lt;/cffunction&gt;