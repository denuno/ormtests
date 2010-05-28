<cfcomponent persistent="true" table="tusers">

	<cfproperty name="IDuser" fieldtype="id" generator="identity"  />
	<cfproperty name="firstname" />
	<cfproperty name="lastname" />
	<cfproperty name="emailaddress" />
	<cfproperty name="password" />

</cfcomponent>
