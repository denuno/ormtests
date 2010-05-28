<cfdirectory directory="#expandPath("/tests/cfml/ormtests")#" action="list" name="dirlist"> 
<h2>
	Examples
</h2>
<cfset h2util = createObject("component","ormtests.H2Util").init(cfadminpassword="testtest") />
<cfloop query="dirlist">
	<cfif type eq "Dir" and name neq "hbm">
		<cfoutput>
			<a href="tests/cfml/ormtests/#name#/">
				#name#
			</a>
			<br />
		</cfoutput>
		<cfhttp method="get" url="http://#cgi.HTTP_HOST##getContextRoot()#/tests/cfml/ormtests/#name#/index.cfm">
		</cfhttp>
		<cfoutput>
			#cfhttp.FileContent#
		</cfoutput>
<!--- 
		<cfset wee = createObject("java","java.lang.Thread").sleep(500) />
		<cfset h2util.removeDSN(dsn=name,path=expandPath("/tests/cfml/ormtests/#name#/db/")) />
 --->
	</cfif>
</cfloop>
