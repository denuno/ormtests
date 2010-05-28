<cfcomponent output="false">

<cffunction name="creatComponent" access="remote">
	<cfargument name="componentName">
	<cfset var obj = createObject("component",arguments.componentName) />
	<cfreturn obj />
</cffunction>

</cfcomponent>