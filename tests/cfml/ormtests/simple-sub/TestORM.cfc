<cfcomponent displayname="TestSvn"  extends="mxunit.framework.TestCase">

	<cffunction name="setUp" returntype="void" access="public">
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
<!--- 
		<cfset applicationStop() />
 --->
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
		<cfset testAddSubUser() />
		<cfset var subusers = entityload("subuser") />
		<cfset assertTrue(arrayLen(subusers)) />
	</cffunction>

	<cffunction name="testAddSubUser">
		<cfset var subuser = createObject("component","sub.subuser") />
		<cfset subuser.setFirstName( "Bob" ) />
		<cfset subuser.setLastName( "R#randRange(1,777)##randRange(1,777)#" ) />
		<cfset subuser.setEmailAddress("email@someplace.com") />
		<cfset subuser.setPassword( "secret" ) />
		<cfset entitySave( subuser ) />
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
