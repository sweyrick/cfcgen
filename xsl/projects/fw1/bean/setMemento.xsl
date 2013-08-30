	public void function setMemento( struct memento ){
	    var i="";
	    var md = getMetaData( this );
	   
	    for( i=1;i&lt;=arrayLen( md.properties );i++ ){
	        if ( structKeyExists( arguments.memento,md.properties[i]["name"] ) )
	            variables[md.properties[i]["name"]] = trim(arguments.memento[md.properties[i]["name"]]);
	            
	    }
	}