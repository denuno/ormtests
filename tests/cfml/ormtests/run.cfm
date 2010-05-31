<cfparam name="URL.output" default="html">
<cfparam name="url.quiet" default="false">
<cfparam name="url.email" default="false">
<cfparam name="url.recipients" default="valliantster@gmail.com">
<cfparam name="url.from" default="valliantster@gmail.com">
<cfset path = getBaseTemplatePath() />
<cfset dirname = listLast(getDirectoryFromPath(path),"\/") />
<cfset dir = expandPath("/tests/cfml/ormtests/#dirname#/") />
<cfoutput><h3>
		#dir# - #dirname#
	</h3></cfoutput>
<cfset DTS = createObject("component","mxunit.runner.DirectoryTestSuite") />
<cfset excludes = "" />
<cfinvoke component="#DTS#" 
	method="run"
	directory="#dir#" 
	recurse="true" 
	excludes="#excludes#"
	returnvariable="Results"
	componentpath="tests.cfml.ormtests.#dirname#">
<cfsetting showdebugoutput="true">
<cfoutput>
	<cfsavecontent variable="recenthtml">
		<cfif NOT StructIsEmpty(DTS.getCatastrophicErrors())>
			<cfdump var="#DTS.getCatastrophicErrors()#" expand="false" label="#StructCount(DTS.getCatastrophicErrors())# Catastrophic Errors" />
		</cfif>
		#results.getResultsOutput(URL.output)# 
	</cfsavecontent>
</cfoutput>
<cfif NOT url.quiet>
	<cfoutput>#recenthtml#</cfoutput>
</cfif>
