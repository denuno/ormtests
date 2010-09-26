<cfset thisdir = ucase(listLast(getDirectoryFromPath(getCurrentTemplatePath()),"/\")) />
<cfoutput>
	See <a href="https://jira.jboss.org/browse/#thisdir#" target="_blank">https://jira.jboss.org/browse/#thisdir#</a>
	for details.
</cfoutput>
<cfflush />
<cfinclude template="../run.cfm" />
