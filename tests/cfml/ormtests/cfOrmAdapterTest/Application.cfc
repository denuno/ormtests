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
//	this.mappings["/"] = expandPath(".");
//	this.mappings["/railo-context"] = "/WEB-INF/lib/railo-server/context/";

	this.name = "#dirname#test";
	server.enableORM = "dinfao";
	this.ormenabled = true;
	this.datasource = dirname;
	this.ormsettings.logSQL=true;
	this.ormsettings.dbcreate="dropcreate";
	this.ormsettings.sqlscript="loadScript.sql";
	this.ormsettings.cfclocation="model";
}
