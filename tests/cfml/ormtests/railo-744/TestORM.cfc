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

	<cffunction name="testSaveLoadUser">
		<cfset var user = entityNew("user") />
		<cfset user.setName( "Dan" ) />
		<cfset user.setEmail("emsail@someplace.com") />
		<cfset entitySave( user ) />
		<cfset user = entityLoad( 'user', 1, true ) />
		<cfset assertEquals(user.getName(),"Dan") >
	</cffunction>


</cfcomponent>
