	public struct function validate(required struct properties){
		var local = { 
			errors = {}
		};
		<xsl:for-each select="root/bean/dbtable/column">
		<xsl:if test="@required='Yes' and @identity != 'true'">if (NOT len(trim(arguments.properties.get<xsl:value-of select="@name" />()))){
			local.errors["<xsl:value-of select="@name" />"] = "is required";
		}
		</xsl:if>
		<xsl:choose>
		<xsl:when test="@type='binary'">if (len(trim(arguments.properties.get<xsl:value-of select="@name" />())) AND NOT isBinary(trim(arguments.properties.get<xsl:value-of select="@name" />()))){
			local.errors["<xsl:value-of select="@name" />"] = "is not binary";
		}
		if (len(trim(arguments.properties.get<xsl:value-of select="@name" />())) GT <xsl:value-of select="@length" />)&gt;
			local.errors["<xsl:value-of select="@name" />"] = "is too long";
		}
		</xsl:when>
		<xsl:when test="@type='boolean'">if (len(trim(arguments.properties.get<xsl:value-of select="@name" />())) AND NOT isBoolean(trim(arguments.properties.get<xsl:value-of select="@name" />()))){
			local.errors["<xsl:value-of select="@name" />"] = "is not boolean";
		}
		</xsl:when>
		<xsl:when test="@type='date'">if (len(trim(arguments.properties.get<xsl:value-of select="@name" />())) AND NOT isDate(trim(arguments.properties.get<xsl:value-of select="@name" />()))){
			local.errors["<xsl:value-of select="@name" />"] = "is not a date";
		}
		</xsl:when>
		<xsl:when test="@type='numeric'">if (len(trim(arguments.properties.get<xsl:value-of select="@name" />())) AND NOT isNumeric(trim(arguments.properties.get<xsl:value-of select="@name" />()))){
			local.errors["<xsl:value-of select="@name" />"] = "is not numeric";
		}
		</xsl:when>
		<xsl:when test="@type='string'">if (len(trim(arguments.properties.get<xsl:value-of select="@name" />())) AND NOT IsSimpleValue(trim(arguments.properties.get<xsl:value-of select="@name" />()))){
			local.errors["<xsl:value-of select="@name" />"] = "is not a string";
		}
		<xsl:if test="@length != -1">
		if (len(trim(arguments.properties.get<xsl:value-of select="@name" />())) GT <xsl:value-of select="@length" />){
			local.errors["<xsl:value-of select="@name" />"] = "is too long";
		}
		</xsl:if>
		</xsl:when>
		</xsl:choose>
		</xsl:for-each>
		return local.errors;
	};