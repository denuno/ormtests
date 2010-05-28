<cfcomponent displayname="H2Util" hint="h2 util">

	<cfif server.coldfusion.productname eq "Railo">
		<cfinclude template="railodsn.cfm"/>
	<cfelse>
		<cfinclude template="acfdsn.cfm"/>
	</cfif>

	<cffunction name="init">
		<cfargument name="cfadminpassword" required="true" />
		<cfif server.coldfusion.productname eq "Railo">
			<cfset variables.engine = "railo">
		<cfelse>
			<cfset variables.engine = "cf">
		</cfif>
		<cfset variables.cfadminpassword = arguments.cfadminpassword />
		<cfreturn this />
	</cffunction>


</cfcomponent>
