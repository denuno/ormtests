<cfcomponent>
	<cfset path = getBaseTemplatePath() />
	<cfset dirname = listLast(getDirectoryFromPath(path),"\/") />

	<cfset dbdir = "#getDirectoryFrompath(path)#db/#dirname#" />
	<cfset h2util = createObject("component","ormtests.H2Util").init(cfadminpassword="testtest") />
	<cfif NOT h2Util.dsnExists(dirname)>
		<cfif directoryExists(dbdir)>
			<cfdirectory action="delete" directory="#dbdir#" recurse="true" />
		</cfif>
		<cfset results = h2util.createDSN(dsn=dirname,path=dbdir) />

	</cfif>

	<cfif server.coldfusion.productname eq "Railo">
		<cfset variables.engine = "railo">
	<cfelse>
		<cfset variables.engine = "cf">
	</cfif>

	<cfset this.name = "#dirname#test" />
	<cfset server.enableORM = "dinfao" />
	<cfset this.ormEnabled = true />
	<cfset this.datasource = dirname />
	<cfif dirname neq "pub">
		<cfif variables.engine eq "railo">
			<cfset  this.ormSettings = {
				dbcreate = 'update',
				logSQL = 'true',
				flushAtRequestEnd = 'true',
				saveMapping = 'true'
				} />
		<cfelse>
			<cfset  this.ormSettings = {
				dbcreate = 'update',
				logSQL = 'true',
				cfclocation="/tests/cfml/ormtests/#dirname#/",
				flushAtRequestEnd = 'true',
				saveMapping = 'true'
				} />
		</cfif>
	</cfif>

<!--- 
	<cffunction name="onRequestEnd">
		<cfargument name="targetPage">
		<cfset applicationStop()>
	</cffunction>
 --->

</cfcomponent>
