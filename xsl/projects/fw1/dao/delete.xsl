	&lt;cffunction name="delete" access="public" output="false" returntype="boolean"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="any" required="true" /&gt;

		&lt;cfset var qDelete = ""&gt;
		&lt;cftry&gt;
			&lt;cfquery name="qDelete" datasource="#variables.dsn#"&gt;
				DELETE FROM	<xsl:value-of select="//dbtable/@name" /> 
				WHERE	<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']"><xsl:value-of select="@name" /> = &lt;cfqueryparam value="#arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />()#" CFSQLType="<xsl:value-of select="@cfSqlType" />" /&gt;<xsl:if test="position() != last()">
				AND	</xsl:if></xsl:for-each>
			&lt;/cfquery&gt;
			&lt;cfcatch type="database"&gt;
				&lt;cflog text="Error in function delete for bean <xsl:value-of select="//bean/@name"/> Message : #cfcatch.message#" type="error" /&gt;
				&lt;cfthrow message = "Error in function delete for bean <xsl:value-of select="//bean/@name"/> Message : #cfcatch.message#" /&gt;
			&lt;/cfcatch&gt;
		&lt;/cftry&gt;
		&lt;cfreturn true /&gt;
	&lt;/cffunction&gt;