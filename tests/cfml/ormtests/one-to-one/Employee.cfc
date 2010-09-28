<cfcomponent persistent="true" table="employee" extends="AbstractEntity">
    <cfproperty name="EmployeeID" fieldtype="id" generator="native">
    <cfproperty name="firstname">
    <cfproperty name="lastname">
    <cfproperty name="officecubicle" fieldtype="one-to-one" cfc="OfficeCubicle" mappedby="Employee">
</cfcomponent>