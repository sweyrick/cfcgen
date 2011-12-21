	&lt;cffunction name="delete" hint="Delete <xsl:value-of select="//bean/@name"/> row from database." access="public" output="false" returntype="boolean"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;

		&lt;cfquery name="qDelete" datasource="#variables.dsn#"&gt;
			DELETE FROM	<xsl:value-of select="//dbtable/@name" /> 
			WHERE	<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']"><xsl:value-of select="@name" /> = &lt;cfqueryparam value="#arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />()#" CFSQLType="<xsl:value-of select="@cfSqlType" />" /&gt;<xsl:if test="position() != last()">
			AND	</xsl:if></xsl:for-each>
		&lt;/cfquery&gt;
		
		&lt;cfreturn true /&gt;
	&lt;/cffunction&gt;