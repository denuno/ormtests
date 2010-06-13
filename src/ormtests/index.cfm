<cfparam name="URL.output" default="html">
<cfparam name="url.quiet" default="false">
<cfparam name="url.email" default="true">
<cfparam name="url.recipients" default="valliantster@gmail.com">
<cfparam name="url.from" default="valliantster@gmail.com">
<cfif structKeyExists(server,"railo")>
	<cfset version = server.railo.version />
	<cfset ticketsUrl = '<a href="https://jira.jboss.org/browse/RAILO/fixforversion/12314969">Jira</a>'>
<cfelse>
	<cfset version = server.coldfusion.productversion />
	<cfset ticketsUrl = "">
</cfif>

<cfdirectory directory="#expandPath("/tests/cfml/ormtests")#" action="list" name="dirlist"> 
	<cfsavecontent variable="recenthtml">
<h2>
	ORM - <cfoutput><em>Engine: #server.coldfusion.productname# - Version: #version# #ticketsUrl#</em></cfoutput>
</h2>
<cfset h2util = createObject("component","ormtests.H2Util").init(cfadminpassword="testtest") />
<cfloop query="dirlist">
	<cfif type eq "Dir" and name neq "hbm">
		<cfoutput>
			Tests in : 
			<a href="#getContextRoot()#/tests/cfml/ormtests/#name#/">
				#name#
			</a> | 
			<a href="http://github.com/denuno/ormtests/tree/master/tests/cfml/ormtests/#name#/" target="_blank">View on GitHub</a>
			<br />
		</cfoutput>
		<cfhttp method="get" url="http://#cgi.HTTP_HOST##getContextRoot()#/tests/cfml/ormtests/#name#/index.cfm">
		</cfhttp>
		<cfoutput>
			#cfhttp.FileContent#
			<br />
			<hr style="height:8px;"/> 
		</cfoutput>
<!--- 
		<cfset wee = createObject("java","java.lang.Thread").sleep(500) />
		<cfset h2util.removeDSN(dsn=name,path=expandPath("/tests/cfml/ormtests/#name#/db/")) />
 --->
	</cfif>
</cfloop>
	</cfsavecontent>

<cfif url.email>
	<cftry>
		<cfmail from="#url.from#" to="#url.recipients#" subject="#server.coldfusion.productname# Test Results : #DateFormat(now(),'short')# @ #TimeFormat(now(),'short')#" type="html">
			#recenthtml# 
		</cfmail>
		<cfcatch></cfcatch>
	</cftry>
</cfif>
<cftry>
	<cfdirectory action="create" directory="#expandPath("/tests/")#/results">
	<cfcatch></cfcatch>
</cftry>
<cffile action="write" file="#expandPath("/tests/")#/results/#DateFormat(now(),'mm-dd-yyyy')#_#TimeFormat(now(),'hhmmss')#-results.html" output="#recenthtml#">
<cfif NOT url.quiet>
	<cfoutput>#recenthtml#</cfoutput>
</cfif>