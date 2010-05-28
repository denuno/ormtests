<cfcomponent>
<cfscript>
/**
* I am an Abstract Base class for all Persistant Entities
* @output false
*/

  /**
  * returns an array of properties that make up the identifier
  * @output false
  */
  public array function getIdentifierColumnNames()
  {
    return ORMGetSessionFactory().getClassMetadata( getClassName() ).getIdentifierColumnNames() ;
  }
  
  /**
  * returns the name of the Entity
  * @output false
  */
  public string function getEntityName()
  {
    return ORMGetSessionFactory().getClassMetadata( getClassName() ).getEntityName();
  }
  
  /**
  * returns an array of persisted properties
  * @output false
  */
  public array function getPersistedProperties()
  {
    return ORMGetSessionFactory().getAllClassMetadata()[ getClassName() ].getPropertyNames();
  }
  

  /**
  * returns the subclass class name of this object
  * @output false
  */
  public string function getClassName()
  {
    return ListLast( GetMetaData( this ).fullname, "." );
  }
  

  /**
  * returns the value of all persisted entites for debugging only!
  * @output false
  */
  public struct function getMemento() 
  {
    var i = 0;
    var result = {};
    var propertyname = "";
    var propertyvalue = "";
    for ( i=1; i<=ArrayLen( getPersistedProperties() ); i++ )
    {
      propertyname = getPersistedProperties()[ i ];
      //propertyvalue = variables[ propertyname ];
      if ( StructKeyExists( variables, propertyname ) )
      {
        if ( IsSimpleValue( variables[ propertyname ] ) )
        {
          result[ propertyname ] = variables[ propertyname ];
        }
        else if ( IsObject(  variables[ propertyname ] ) )
        {
          result[ propertyname ] = "[object : fullname=" & GetMetaData( variables[ propertyname ] ).fullname & "]";
        }
        else if ( IsArray(  variables[ propertyname ] ) )
        {
          result[ propertyname ] = "[array : size=" & ArrayLen( variables[ propertyname ] ) & "]";
        }
        else if ( IsStruct(  variables[ propertyname ] ) )
        {
          result[ propertyname ] = "[struct : keys=" & StructKeyList( variables[ propertyname ] ) & "]";
        }
        else 
        {
          result[ propertyname ] = "[complex]";
        }
      }
      else
      {
        result[ propertyname ] = "[null]";
      }
    }
    return result;
  }
</cfscript>
</cfcomponent>