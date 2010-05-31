<cfcomponent persistent="true" table="tsubusers"  entityname="subuser">

	<cfproperty name="userid" fieldtype="id" generator="identity"  />
	<cfproperty name="firstname" />
	<cfproperty name="lastname" />
	<cfproperty name="emailaddress" />
	<cfproperty name="password" />

</cfcomponent>
