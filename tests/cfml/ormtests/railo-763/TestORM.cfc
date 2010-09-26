<cfcomponent displayname="TestSvn"  extends="mxunit.framework.TestCase">

	<cffunction name="setUp" returntype="void" access="public">
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
	</cffunction>

	<cffunction name="dumpvar" access="private">
		<cfargument name="var" />
		<cfdump var="#var#" />
		<cfabort />
	</cffunction>

	<cffunction name="testLoadEntities">
		<cfset var OfficeCubicle = createObject( "component", "OfficeCubicle" ) />
		<cfset var Employee = entityload("Employee") />
	</cffunction>

	<cffunction name="testAddOneToOneEntity">
		<cfset var Employee = createObject( "component", "Employee" ) />
		<cfset var OfficeCubicle = createObject( "component", "OfficeCubicle" ) />
		<cfset Employee.setFirstName( "Brock#randRange(1,777)##randRange(1,777)#" ) />
		<cfset Employee.setLastName( "Sampson#randRange(1,777)##randRange(1,777)#" ) />
		<cfset OfficeCubicle.setLocation( "venture compound" ) />
		<cfset OfficeCubicle.setEmployee(Employee) />
		<cfset Employee.setOfficeCubicle(OfficeCubicle) />
		<cfset entitySave( Employee ) />
	</cffunction>

</cfcomponent>
