<cfcomponent entityname="Employee" persistent="true" output="false">

	<cfproperty name="id" fieldtype="id" generator="native" />
	<cfproperty name="firstName" />
	<cfproperty name="lastName" />
	<cfproperty name="officeCubicle" fieldtype="one-to-one" cfc="OfficeCubicle" />

</cfcomponent>
