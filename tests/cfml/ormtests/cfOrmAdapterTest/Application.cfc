component output="false" {

	path = getBaseTemplatePath();
	dirname = listLast(getDirectoryFromPath(path),"\/");
	dbdir = "#getDirectoryFrompath(path)#db/#dirname#";
	h2util = createObject("component","ormtests.H2Util").init(cfadminpassword="testtest");
	if(NOT h2Util.dsnExists(dirname)){
		if(directoryExists(dbdir)){
			directoryDelete(dbdir,true);
		}
		results = h2util.createDSN(dsn=dirname,path=dbdir);
	}
	if(server.coldfusion.productname eq "Railo"){
		variables.engine = "railo";
	} else {
		variables.engine = "cf";
	};
	this.name = "#dirname#test";
	server.enableORM = "dinfao";

	this.name = "cfOrmAdapterTest";
	this.ormenabled = true;
	this.datasource = dirname;
	this.ormsettings = {
		flushAtRequestEnd=false,
		dbcreate="dropcreate",
		logSQL=true,
		sqlscript="loadScript.sql",
		cfclocation="model"
		};
}
