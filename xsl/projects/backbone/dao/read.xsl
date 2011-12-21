	&lt;cffunction name="read" access="public" output="false" hint="Select query that returns <xsl:value-of select="//bean/@name"/> objects." returntype="struct"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;

		&lt;cfset var ret = 0/&gt;

		&lt;cfquery name="qRead" datasource="#variables.dsn#"&gt;
			SELECT
				<xsl:for-each select="root/bean/dbtable/column"><xsl:value-of select="@name" /><xsl:if test="position() != last()">,
				</xsl:if>
				</xsl:for-each>
			FROM	<xsl:value-of select="//dbtable/@name" />
			WHERE	<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']"><xsl:value-of select="@name" /> = &lt;cfqueryparam value="#arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />()#" CFSQLType="<xsl:value-of select="@cfSqlType" />" /&gt;<xsl:if test="position() != last()">
			AND	</xsl:if></xsl:for-each>
		&lt;/cfquery&gt;
		
		&lt;cfif qRead.recordCount&gt;
			&lt;cfset ret = queryRowToStruct(qRead)&gt;
		&lt;/cfif&gt;
		
		&lt;cfreturn ret /&gt;
	&lt;/cffunction&gt;