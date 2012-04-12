	&lt;cffunction name="occurs" access="public" hint="Checks to see if the record exists. Returns boolean value." output="false" returntype="boolean"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;

		&lt;cfquery name="qExists" datasource="#variables.dsn#" maxrows="1"&gt;
			SELECT count(1) as idexists
			FROM	<xsl:value-of select="//dbtable/@name" />
			WHERE	0=0
			<xsl:for-each select="root/bean/dbtable/column[@primaryKey!='Yes']">
			&lt;cfif len(arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />())&gt;
				AND <xsl:value-of select="@name" /> = &lt;cfqueryparam value="#arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />()#" CFSQLType="<xsl:value-of select="@cfSqlType" />" /&gt;
			&lt;/cfif&gt;
			</xsl:for-each>
		&lt;/cfquery&gt;

		&lt;cfif qExists.idexists&gt;
			&lt;cfreturn true /&gt;
		&lt;cfelse&gt;
			&lt;cfreturn false /&gt;
		&lt;/cfif&gt;
	&lt;/cffunction&gt;