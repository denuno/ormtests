<cfcomponent>

	<cfset dirname = listLast(getDirectoryFromPath(getBaseTemplatePath()),"\/") />
	<cfset dbdir = "#getDirectoryFrompath(getBaseTemplatePath())#db/#dirname#" />

	<cfset h2util = createObject("component","ormtests.H2Util").init(cfadminpassword="testtest") />
	<cfif NOT h2Util.dsnExists(dirname)>
		<cfif directoryExists(dbdir)>
			<cfdirectory action="delete" directory="#dbdir#" recurse="true" />
		</cfif>
		<cfset results = h2util.createDSN(dsn=dirname,path=dbdir) />
	</cfif>

	<cfset this.name = "#dirname#test" />
	<cfset server.enableORM = "dinfao" />
	<cfset this.ormEnabled = true />
	<cfset this.datasource = dirname />
	<cfscript>
	this.ormenabled = true;
	this.datasource = dirname;
	this.ormsettings.logSQL=true;
	this.ormsettings.dbcreate="dropcreate";
	this.ormsettings.ormconfig="hibernate.xml";
	</cfscript>
	<!---
		<cfset this.datasource = "ormtest" />
		--->

</cfcomponent>
