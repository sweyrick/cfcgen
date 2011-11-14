	&lt;cffunction name="create" access="public" output="false" returntype="struct"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;

		&lt;cfset var qCreate = "" /&gt;
		&lt;cfset var r = getResponse() /&gt;
		&lt;cfset var l = {} /&gt;
		
		&lt;cftry&gt;
			&lt;cfquery name="qCreate" datasource="#variables.dsn#" result="myPK"&gt;
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
					)
			&lt;/cfquery&gt;
			
			&lt;cfset arguments.<xsl:value-of select="//bean/@name"/>.setid(myPK.GENERATED_KEY) /&gt;
			&lt;cfset r.data = arguments.<xsl:value-of select="//bean/@name"/>.getMemento() /&gt;

			&lt;cfcatch type="database"&gt;
				&lt;cfset r.success = false /&gt;
				&lt;cfset arrayAppend(r.errors,'error on inserting <xsl:value-of select="//bean/@name"/>') /&gt;
			&lt;/cfcatch&gt;
		&lt;/cftry&gt;
		&lt;cfreturn r /&gt;
	&lt;/cffunction&gt;