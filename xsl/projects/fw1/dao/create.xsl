	&lt;cffunction name="create" access="public" output="false" returntype="any"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="any" required="true" /&gt;

		&lt;cfset var qCreate = "" /&gt;
		&lt;cftry&gt;
			&lt;cfquery name="qCreate" datasource="#variables.dsn#"&gt;
				INSERT INTO <xsl:value-of select="//dbtable/@name" />
					(
					<xsl:for-each select="root/bean/dbtable/column[@identity != 'true']"><xsl:value-of select="@name" /><xsl:if test="position() != last()">,
					</xsl:if>
					</xsl:for-each>
					)
				VALUES
					(
					<xsl:for-each select="root/bean/dbtable/column[@identity != 'true']">&lt;cfqueryparam value="#arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />()#" CFSQLType="<xsl:value-of select="@cfSqlType" />"<xsl:if test="@required != 'Yes'"> null="#not len(arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />())#"</xsl:if> /&gt;<xsl:if test="position() != last()">,
					</xsl:if>
					</xsl:for-each>
					);
					SELECT Scope_Identity () as newID;
			&lt;/cfquery&gt;
			<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']">&lt;cfset arguments.<xsl:value-of select="//bean/@name"/>.set<xsl:value-of select="@name" />(qCreate.newID) /&gt;</xsl:for-each>
			&lt;cfcatch type="database"&gt;
				&lt;cflog text="Error in function create for bean <xsl:value-of select="//bean/@name"/> Message : #cfcatch.message#" type="error" /&gt;
				&lt;cfthrow message = "Error in function create for bean <xsl:value-of select="//bean/@name"/> Message : #cfcatch.message#" /&gt;
			&lt;/cfcatch&gt;
		&lt;/cftry&gt;
		&lt;cfreturn arguments.<xsl:value-of select="//bean/@name"/> /&gt;
	&lt;/cffunction&gt;