<cfcomponent persistent="true" table="tusers">

	<cfproperty name="userid" fieldtype="id" generator="identity"  />
	<cfproperty name="firstname" />
	<cfproperty name="lastname" />
	<cfproperty name="emailaddress" />
	<cfproperty name="password" />

</cfcomponent>
