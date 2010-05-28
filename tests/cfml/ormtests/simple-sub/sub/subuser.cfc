<cfcomponent persistent="true" table="tsubusers">

	<cfproperty name="IDuser" fieldtype="id" generator="identity"  />
	<cfproperty name="firstname" />
	<cfproperty name="lastname" />
	<cfproperty name="emailaddress" />
	<cfproperty name="password" />

</cfcomponent>
