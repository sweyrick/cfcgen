	public struct function getMemento() 
	{ 
	  var properties = {};
	  for (local.md = getMetaData(this); 
	       structKeyExists(md, "extends"); 
	       md = md.extends) 
	  { 
	    if (structKeyExists(md, "properties")) 
	    { 
	      for (local.i = 1; 
	           i &lt;= arrayLen(md.properties); 
	           i++) 
	      { 
	        local.pName = lcase(md.properties[i].name); 
	        local.properties[pName] 
	          = structKeyExists(variables, pName) ? 
	            variables[pName] : ""; 
	      } 
	    } 
	  } 
	  return duplicate(properties); 
	}