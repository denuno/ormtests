<cfcomponent persistent="true" entityname="OfficeCubicle" output="false">

	<cfproperty name="id" fieldtype="id" generator="native" />
	<cfproperty name="employee" fieldtype="one-to-one" cfc="Employee" fkcolumn="employeeID" />
	<cfproperty name="location" />
	<cfproperty name="size" />

</cfcomponent>
