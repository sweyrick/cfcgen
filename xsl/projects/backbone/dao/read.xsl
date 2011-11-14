	&lt;cffunction name="read" access="public" output="false" returntype="struct"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;

		&lt;cfset var qRead = "" /&gt;
		&lt;cfset var r = getResponse() /&gt;
		&lt;cfset var l = {} /&gt;
		
		&lt;cftry&gt;
			&lt;cfquery name="qRead" datasource="#variables.dsn#"&gt;
				SELECT
					<xsl:for-each select="root/bean/dbtable/column"><xsl:value-of select="@name" /><xsl:if test="position() != last()">,
					</xsl:if>
					</xsl:for-each>
				FROM	<xsl:value-of select="//dbtable/@name" />
				WHERE	<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']"><xsl:value-of select="@name" /> = &lt;cfqueryparam value="#arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />()#" CFSQLType="<xsl:value-of select="@cfSqlType" />" /&gt;<xsl:if test="position() != last()">
				AND	</xsl:if></xsl:for-each>
			&lt;/cfquery&gt;
			
			&lt;cfcatch type="database"&gt;
				&lt;cfset r.success = false /&gt;
				&lt;cfset arrayAppend(r.errors,'error on reading <xsl:value-of select="//bean/@name"/>') /&gt;
			&lt;/cfcatch&gt;
		&lt;/cftry&gt;
		
		&lt;cfif qRead.recordCount&gt;
			&lt;cfset r.data = queryRowToStruct(qRead)&gt;
		&lt;cfelse&gt;
			&lt;cfset r.success = false /&gt;
			&lt;cfset arrayAppend(r.errors,'could not find <xsl:value-of select="//bean/@name"/> in records') /&gt;
		&lt;/cfif&gt;
		
		&lt;cfreturn r.data /&gt;
	&lt;/cffunction&gt;