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
		<cfset blogentry = entityload("Entry",1,true) />
	</cffunction>

	<cffunction name="testLoadEntitiesToQuery">
		<cfset blogentry = entityload("Entry",1,true) />
		<cfset blar = EntityToQuery(blogentry.getComments()) />
	</cffunction>

	<cffunction name="testLoadEntitiesMetadata">
		<cfset blogentry = entityload("Entry",1,true) />
		<cfset blar = getmetadata(blogentry.getComments()) />
	</cffunction>

	<cffunction name="testDumpEntities">
		<cfset blogentry = entityload("Entry",1,true) />
		<cfdump var="#blogentry.getComments()#" />
	</cffunction>

	<cffunction name="testDumpEntities">
		<cfset blogentry = entityload("Entry",1,true) />
		<cfdump var="#getmetadata(blogentry)#" />
		<cfdump var="#EntityToQuery(blogentry.getComments())#" />
	</cffunction>

</cfcomponent>
