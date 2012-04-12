	&lt;cffunction name="create" access="public" hint="Insert new <xsl:value-of select="//bean/@name"/> object into database." output="false" returntype="struct"&gt;
		&lt;cfargument name="<xsl:value-of select="//bean/@name"/>" type="<xsl:value-of select="//bean/@path"/>" required="true" /&gt;
		
		&lt;cfset var ret = {} /&gt;
		
		&lt;cfif !occurs(arguments.<xsl:value-of select="//bean/@name"/>) &gt;
		
			&lt;cfquery name="qCreate" datasource="#variables.dsn#" result="myPK"&gt;
				INSERT INTO <xsl:value-of select="//dbtable/@name" />
					(
					<xsl:for-each select="root/bean/dbtable/column[@primaryKey!='Yes']"><xsl:value-of select="@name" /><xsl:if test="position() != last()">,
					</xsl:if>
					</xsl:for-each>
					)
				VALUES
					(
					<xsl:for-each select="root/bean/dbtable/column[@primaryKey!='Yes']">&lt;cfqueryparam value="#arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />()#" CFSQLType="<xsl:value-of select="@cfSqlType" />"<xsl:if test="@required != 'Yes'"> null="#not len(arguments.<xsl:value-of select="//bean/@name"/>.get<xsl:value-of select="@name" />())#"</xsl:if> /&gt;<xsl:if test="position() != last()">,
					</xsl:if>
					</xsl:for-each>
					)
				<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']">RETURNING <xsl:value-of select="@name" /> AS id;</xsl:for-each>
			&lt;/cfquery&gt;
			
			
			
			<xsl:for-each select="root/bean/dbtable/column[@primaryKey='Yes']">&lt;cfset arguments.<xsl:value-of select="//bean/@name"/>.set<xsl:value-of select="@name" />(qCreate.id) /&gt;</xsl:for-each>
			
			&lt;cfset ret = arguments.<xsl:value-of select="//bean/@name"/>.getMemento() /&gt;
		
		&lt;/cfif&gt;

		&lt;cfreturn ret /&gt;
	&lt;/cffunction&gt;