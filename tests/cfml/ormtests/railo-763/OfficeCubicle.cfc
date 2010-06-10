<cfcomponent entityname="OfficeCubicle" persistent="true" output="false">

	<cfproperty name="id" fieldtype="id" generator="foreign" params="{property='employee'}" />
	<cfproperty name="employee" fieldtype="one-to-one" cfc="Employee" constrained="true" />
	<cfproperty name="location" />
	<cfproperty name="size" />

</cfcomponent>
