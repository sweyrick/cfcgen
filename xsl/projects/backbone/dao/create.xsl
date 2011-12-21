	&lt;cffunction name="create" access="public" hint="Insert new <xsl:value-of select="//bean/@name"/> object into database." output="false" returntype="struct"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;

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
			
		&lt;cfset arguments.<xsl:value-of select="//bean/@name"/>.setid(myPK.IDENTITYCOL) /&gt;
		&lt;cfset var ret = arguments.<xsl:value-of select="//bean/@name"/>.getMemento() /&gt;

		&lt;cfreturn ret /&gt;
	&lt;/cffunction&gt;