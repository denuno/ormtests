<cfcomponent persistent="true" table="officecubicle" extends="AbstractEntity">
    <cfproperty name="id" fieldtype="id" generator="native">
    <cfproperty name="Employee" fieldtype="one-to-one" cfc="Employee" fkcolumn="EmployeeID">
    <cfproperty name="Location">
    <cfproperty name="Size">
</cfcomponent>