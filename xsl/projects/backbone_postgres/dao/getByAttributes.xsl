	&lt;cffunction name="get" access="public" output="false" hint="Select query that is dynamic based on the <xsl:value-of select="//bean/@name"/> properties received." returntype="array"&gt;
		<xsl:for-each select="root/bean/dbtable/column">&lt;cfargument name="<xsl:value-of select="@name" />" type="<xsl:value-of select="@type" />" required="false" /&gt;
		</xsl:for-each>&lt;cfargument name="orderby" type="string" required="false" /&gt;
		
		&lt;cfset var ret = arrayNew(1) /&gt;
		&lt;cfset var qList = "" /&gt;		
		&lt;cfquery name="qList" datasource="#variables.dsn#"&gt;
			SELECT
				<xsl:for-each select="root/bean/dbtable/column"><xsl:value-of select="@name" /><xsl:if test="position() != last()">,
				</xsl:if>
				</xsl:for-each>
			FROM	<xsl:value-of select="//dbtable/@name" />
			WHERE	0=0
		<xsl:for-each select="root/bean/dbtable/column">
		&lt;cfif structKeyExists(arguments,"<xsl:value-of select="@name" />") and len(arguments.<xsl:value-of select="@name" />)&gt;
			AND	<xsl:value-of select="@name" /> = &lt;cfqueryparam value="#arguments.<xsl:value-of select="@name" />#" CFSQLType="<xsl:value-of select="@cfSqlType" />" /&gt;
		&lt;/cfif&gt;</xsl:for-each>
		&lt;cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)&gt;
			ORDER BY #arguments.orderby#
		&lt;/cfif&gt;
		&lt;/cfquery&gt;
		&lt;cfset ret = queryToArray(qList) /&gt;
		
		&lt;cfreturn ret /&gt;
	&lt;/cffunction&gt;