<cfcomponent displayname="TestSvn"  extends="mxunit.framework.TestCase">

  <cffunction name="setUp" returntype="void" access="public">
  </cffunction>

  <cffunction name="tearDown" returntype="void" access="public">
  </cffunction>


	<cffunction name="dumpvar" access="private">
		<cfargument name="var">
		<cfdump var="#var#">
		<cfabort/>
	</cffunction>

	<cffunction name="testLoadUserHBM">
<!---

	this would do something if the user.hbm.xml mapping file actually got loaded

		<cfset var user = createObject("component","hbm.sssssssssssssssssuser") />
		<cfset user.setFirstName( "Bob" ) />
		<cfset user.setLastName( "R#randRange(1,777)##randRange(1,777)#" ) />
		<cfset user.setEmailAddress("email@someplace.com") />
		<cfset user.setPassword( "secret" ) />
		<cfset entitySave( user ) />
		<cfset var users = entityload("user") />
		<cfset debug(users) />
 --->
	</cffunction>

</cfcomponent>