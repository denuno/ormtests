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

	<cffunction name="testAddUser">
		<cfset var user = createObject("component","user") />
		<cfset user.setFirstName( "Bob" ) />
		<cfset user.setLastName( "R#randRange(1,777)##randRange(1,777)#" ) />
		<cfset user.setEmailAddress("email@someplace.com") />
		<cfset user.setPassword( "secret" ) />
		<cfset entitySave( user ) />
		<cfset var users = entityload("user") />
		<cfset assertTrue(arrayLen(users)) />
	</cffunction>

	<cffunction name="testAddLoadSubUser">
		<cfset var user = createObject("component","sub.subuser") />
		<cfset user.setFirstName( "Bob" ) />
		<cfset user.setLastName( "R#randRange(1,777)##randRange(1,777)#" ) />
		<cfset user.setEmailAddress("email@someplace.com") />
		<cfset user.setPassword( "secret" ) />
		<cfset entitySave( user ) />
		<cfset var users = entityload("sub.subuser") />
		<cfset assertTrue(arrayLen(users)) />
	</cffunction>

	<cffunction name="testAddSubUser">
		<cfset var user = createObject("component","sub.subuser") />
		<cfset user.setFirstName( "Bob" ) />
		<cfset user.setLastName( "R#randRange(1,777)##randRange(1,777)#" ) />
		<cfset user.setEmailAddress("email@someplace.com") />
		<cfset user.setPassword( "secret" ) />
		<cfset entitySave( user ) />
	</cffunction>

	<cffunction name="testAddLoadUser">
		<cfset var user = createObject("component","user") />
		<cfset user.setFirstName( "Bob" ) />
		<cfset user.setLastName( "R#randRange(1,777)##randRange(1,777)#" ) />
		<cfset user.setEmailAddress("email@someplace.com") />
		<cfset user.setPassword( "secret" ) />
		<cfset entitySave( user ) />
		<cfset var users = entityload("user") />
		<cfset assertTrue(arrayLen(users)) />
	</cffunction>

</cfcomponent>
