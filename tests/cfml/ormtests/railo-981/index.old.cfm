<cfquery name="qry" >
	SELECT * FROM users
</cfquery>

<cfdump var=#qry#>
<br>
<!--- <cfabort> --->
<cfscript>
		//ormReload();
		orderObj = "null";

        if ( structKeyExists( url, 'create' ) && url.create )
        {
                writeOutput( 'Creating/saving a new entity...<br />' );
                user = entityNew( 'user' );
				user.setUserName('hsimpson');
				user.setPassword('letmein');
                user.setFirstName( 'Homer' );
                user.setEmail( 'homer@thesimpsons.com' );
                entitySave( user );
				ormFlush();
                writeOutput( 'New entity saved with ID: #user.getUserID()#<br/>' );
        }
        else {
                writeOutput( 'Loading entity with id=1...<br />' );
                user = entityLoadByPK( 'User', 1 );

				orderObj = entityLoadByPK('Order', 1034);
        }

        if ( isDefined( 'user' ) )
        {
                writeOutput( 'Entity: #user.getUserID()#, #user.getFirstName()#,#user.getEmail()#, username: #user.getUserName()#, password: #user.getPassword()#' );
        }
        else {
                writeOutput( 'No entity loaded' );
        }
</cfscript>

<cfif isDefined('user')>
	<cfdump var=#user#>
</cfif>

<cfif isDefined('orderObj')>
	<cfdump var=#orderObj.getOrderID()#>
	<cfdump var=#orderObj#>
</cfif>
