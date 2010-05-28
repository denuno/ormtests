
	<cffunction name="createDSN" access="public" output="false">
		<cfargument name="dsn" required="true" />
		<cfargument name="dbname" default="#arguments.dsn#" />
		<cfargument name="dbtype" default="h2" />
		<cfargument name="dbusername" default="sa" />
		<cfargument name="dbpassword" default="" />
		<cfargument name="host" default="" />
		<cfargument name="path" default="#getDirectoryFrompath(getBaseTemplatePath())#/db/#dbname#">
		<!--- This is the CF7, CF8 installation of Datasources --->
		<cfset var sClassName = "" />
		<cfset var sPort      = "" />
		<cfset var result     = {"status"=false,"message"=""} />
		<cfif arguments.dbType EQ "mssql" OR arguments.dbType EQ "mssql_2005">
			<cfset var sClassName="com.microsoft.jdbc.sqlserver.SQLServerDriver" />
			<cfset var sPort = "1433" />
			<cfset var sDSN  = "jdbc:sqlserver://{host}:{port}" />
		<cfelseif arguments.dbType EQ "mysql">
			<cfset var sClassName="org.gjt.mm.mysql.Driver" />
			<cfset var sPort = "3306" />
			<cfset var sDSN  = "jdbc:mysql://{host}:{port}/{database}" />
		<cfelseif arguments.dbType EQ "hssql">
			<cfset var sClassName="org.hsqldb.jdbcDriver" />
			<cfset var sDSN  = "jdbc:hsqldb:file:/tmp/#dbname#" />
		<cfelseif arguments.dbType EQ "h2">
			<cfdirectory action="create" directory="#arguments.path#">
			<cfset var sClassName="org.h2.Driver" />
			<cfset var sDSN  = "jdbc:h2:file:#arguments.path#" />
		</cfif>
		<cftry>
		<cfif variables.engine eq "railo">
		<cfelse>
			<cfset newDSNdata = structNew()>
			<cfset newDSNdata.class = sClassName>
			<cfset newDSNdata.driver = sClassName>
			<cfset newDSNdata.url = sDSN>
			<cfset newDSNdata.host = arguments.host>
			<cfset newDSNdata.username = dbusername />
			<cfset newDSNdata.password = dbpassword />
			<cfset newDSNdata.port =sPort>
			<cfset newDSNdata.database = dsn>
			<cfset addDatasource( variables.cfadminpassword, dsn, newDSNdata, false) />
			<!--- Verify the new DSN --->
			<cfset vData = verifyDSN( dsn ) />
			<cfset result.verified = vData.valid />
			<cfif not result.verified>
				<cfdump var="#vdata#"><cfabort>

				<cfset result.message = vData.errorMessage & "<br />" & vData.errorDetail />
			</cfif>		
		</cfif>
		<cfcatch type="any"><cfset result.message =  cfcatch.Message &   " " & cfcatch.Detail /></cfcatch>
		</cftry>
		<cfreturn result />
	</cffunction>




<cffunction name="getDatasources" access="private" returntype="struct" output="false" description="Return the DSNs and their properties.">
	<cfset var local = structNew() />
	<cfset var key   = "">
	<cfset var stTmp = structNew() >

	<cfset local.dsService = createObject("java", "coldfusion.server.ServiceFactory").DataSourceService />
	<cfif server.coldfusion.productname eq "Railo">
		<cfset local = local.dsService.getDataSources()>
		<cfloop collection="#local#" item="key">
			<cfset stTmp[key].name     = key>
			<cfset stTmp[key].class    = local[key].getDataSourceDef().getClassName()>
			<cfif findNoCase(".mysql.", stTmp[key].class)>
				<cfset stTmp[key].driver = "MySQL 5">
			<cfelseif findNoCase(".db2.", stTmp[key].class)>
				<cfset stTmp[key].driver = "DB2 Driver">
			<cfelseif findNoCase(".firebirdsql.", stTmp[key].class)>
				<cfset stTmp[key].driver = "Firebird Driver">
			<cfelseif findNoCase(".h2.", stTmp[key].class)>
				<cfset stTmp[key].driver = "H2 Driver">
			<cfelseif findNoCase(".hsqldb.", stTmp[key].class)>
				<cfset stTmp[key].driver = "HSQLDB Driver">
			<cfelseif findNoCase(".sqlserver.", stTmp[key].class)>
				<cfset stTmp[key].driver = "Microsoft SQL Server Driver">
			<cfelseif findNoCase(".jtds.", stTmp[key].class)>
				<cfset stTmp[key].driver = "JDTS MSSQL/Sybase Driver">
			<cfelseif findNoCase(".odbc.", stTmp[key].class)>
				<cfset stTmp[key].driver = "ODBC Driver">
			<cfelseif findNoCase("oracle.", stTmp[key].class)>
				<cfset stTmp[key].driver = "Oracle Driver">
			<cfelseif findNoCase(".postgresql.", stTmp[key].class)>
				<cfset stTmp[key].driver = "PostGre SQL Driver">
			<cfelse>
				<cfset stTmp[key].driver = "Other Driver">
			</cfif>
			<cfset stTmp[key].url = local[key].getDatasourceDef().getURL()>
			<cfset stTmp[key].urlmap.connectionprops.host     = local[key].getDatasourceDef().getHost()>
			<cfset stTmp[key].urlmap.connectionprops.port     = local[key].getDatasourceDef().getPort()>
			<cfset stTmp[key].urlmap.connectionprops.database = local[key].getDatasourceDef().getDatabase()>
		</cfloop>
		<cfset local = stTmp>
	<cfelse>
		<cfreturn local.dsService.getDataSources()>
	</cfif>
	<cfreturn local />
</cffunction>

<cffunction name="dsnExists" access="public" returntype="boolean" output="false" description="Check if a given DSN name is already in use.">
	<cfargument name="dsnName" type="string" output="false">

	<cfset var ds = getDatasources() />

	<cfreturn structKeyExists( ds, arguments.dsnName ) />
</cffunction>


<cffunction name="addDatasource" access="private" returntype="void" output="false" description="Add a DSN to the system.">
	<cfargument name="cfAdminPassword" type="string" required="true" />
	<cfargument name="datasourceName" type="string" required="true" />
	<cfargument name="dataSourceProperties" type="struct" required="true" />
	<cfargument name="checkDestinationAvailable" type="boolean" required="false" default="true" />
	
	<cfset var local = structNew() />

	<cfset local.adminObj = createObject("component","cfide.adminapi.administrator") />
	<cfset local.adminObj.login(arguments.cfAdminPassword) />

	<cfset local.datasource = createObject("component","cfide.adminapi.datasource") />

	<cfset local.dsProps = duplicate( arguments.dataSourceProperties ) />
	<cfset local.dsProps.name = arguments.datasourceName />

	<cfset local.datasource.setOther( argumentCollection=local.dsProps ) />
</cffunction>

<cffunction name="verifyDSN" access="private" returntype="struct" output="false" description="Validate a DSN connection.">
	<cfargument name="dsn" type="string" required="true" />

	<cfset var local = structNew() />
	<cfset local.result = structNew() />
	<cfset local.dsService = createObject("java", "coldfusion.server.ServiceFactory").DataSourceService />

	<cftry>
		<cfset local.result.valid = local.dsService.verifydatasource(arguments.dsn) />
		<cfcatch>
			<cfset local.result.valid = false />
			<cfset local.result.errorType = cfcatch.type />
			<cfset local.result.errorMessage = cfcatch.message />
			<cfset local.result.errorDetail = cfcatch.detail />
		</cfcatch>
	</cftry>

	<cfreturn local.result />
</cffunction>
