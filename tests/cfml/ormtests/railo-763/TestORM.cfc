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
		<cfset OfficeCubicle = createObject( "component", "OfficeCubicle" ) />
		<cfset Employee = entityload("Employee") />
	</cffunction>

	<cffunction name="testAddOneToOneEntity">
		<cfset Employee = createObject( "component", "Employee" ) />
		<cfset OfficeCubicle = createObject( "component", "OfficeCubicle" ) />
		<cfset Employee.setFirstName( "Brock#randRange(1,777)##randRange(1,777)#" ) />
		<cfset Employee.setLastName( "Sampson#randRange(1,777)##randRange(1,777)#" ) />
		<cfset OfficeCubicle.setLocation( "venture compound" ) />
		<cfset entitySave( OfficeCubicle ) />
		<cfset Employee.setOfficeCubicle(OfficeCubicle) />
		<cfset entitySave( Employee ) />
	</cffunction>

</cfcomponent>
