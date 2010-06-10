<cfcomponent persistent="true" entityname="Employee" output="false">

	<cfproperty name="employeeID" fieldtype="id" generator="native" />
	<cfproperty name="firstName" />
	<cfproperty name="lastName" />
	<cfproperty name="officeCubicle" fieldtype="one-to-one" cfc="OfficeCubicle" mappedby="Employee" />

</cfcomponent>
