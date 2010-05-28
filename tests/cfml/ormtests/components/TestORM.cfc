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

	<cffunction name="testListFiles">
<!--- 
		<cfset remote = createObject("webservice","http://localhost:8080#getContextRoot()#/tests/cfml/ormtests/simple/remote.cfc")>
		<cfset var user = remote.createcomponent("user") />
 --->
		<cfset var user = createObject("component","Artist") />
		<cfset user.setFirstName( "Bob" ) />
		<cfset user.setLastName( "R#randRange(1,777)##randRange(1,777)#" ) />
		<cfset entitySave( user ) />
		
		<cfset var users = entityload("Artist") />
		<cfset debug(users) />
	</cffunction>

</cfcomponent>