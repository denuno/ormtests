<cfcomponent output="false">
 
<!---
Create the target Application.cfc instance. Check to
see which directory is currently executing. Based on
that, we will figure out which App instance to create.
--->
<cfset VARIABLES.TargetAppPath = cgi.PATH_INFO />
 
 
<!---
Now that we have the target app, create the appropriate
Application.cfc in the parallel folder.
--->
<cfset appcfc = replace(getDirectoryFromPath(variables.TargetAppPath),"/",".","all")>
<cfif len(appcfc) eq 1>
 <cfset appcfc = ".ormtests">
</cfif>
<cfset appcfc = rereplace(appcfc,"$\.|^\.","","all") />
<cfset VARIABLES.TargetApp = CreateObject(
"component",
appcfc & ".Application"
) />
 
 
<!---
We need to "borrow" the settings from the target
application. To do this, we will loop over all the
pulic keys and copy over all non-method values.
--->
<cfloop
item="VARIABLES.TargetAppKey"
collection="#VARIABLES.TargetApp#">
 
<!--- Check to see if this is a method. --->
<cfif NOT IsCustomFunction( VARIABLES.TargetApp[ VARIABLES.TargetAppKey ] )>
 
<!--- This is a public value - copy it. --->
<cfset THIS[ VARIABLES.TargetAppKey ] = VARIABLES.TargetApp[ VARIABLES.TargetAppKey ] />
 
</cfif>
 
</cfloop>
 
 
 
<!---
ASSERT: At this point, we should have copied over all
the public properties of the Application.cfc including
the application and session settings. And, since THIS
application does not have any of those settings, those
target ones should take over.
--->
 
 
<cffunction
name="OnSessionStart"
access="public"
returntype="void"
output="false"
hint="I run when the user's session begins.">
 
<!--- Check to see if our target has this method. --->
<cfif StructKeyExists( VARIABLES.TargetApp, "OnSessionStart" )>
 
<!--- Return call to target application. --->
<cfreturn VARIABLES.TargetApp.OnSessionStart() />
 
</cfif>
 
<!--- Return out. --->
<cfreturn />
</cffunction>
 
 
<cffunction
name="OnRequestStart"
access="public"
returntype="boolean"
output="false"
hint="I run before the requested template gets processed.">
 
<!--- Define arguments. --->
<cfargument
name="Page"
type="string"
required="true"
hint="I am the requested page."
/>
 
 
<!--- Check to see if our target has this method. --->
<cfif StructKeyExists( VARIABLES.TargetApp, "OnRequestStart" )>
 
<!--- Call this on the target application. --->
<cfif VARIABLES.TargetApp.OnRequestStart( ARGUMENTS.Page )>
 
<!---
Now that the target's OnRequestStart() method
has run, we need to check to see if the
target has the OnRequestStart() method. It is
possible that it doesn't exist at this point
because it either NEVER existed or because it
was deleted manually. Either way, if it does
not exist, we have to delete it from THIS
component in case a web service call is
coming through.
--->
<cfif NOT StructKeyExists( VARIABLES.TargetApp, "OnRequest" )>
 
<!---
No OnRequest() in the target. Delete it
from THIS instance so it doesn't execute as
an event method.
--->
<cfset StructDelete( THIS, "OnRequest" ) />
 
</cfif>
 
<!--- Return out. --->
<cfreturn true />
 
<cfelse>
 
<!---
The target application returns false, so
let's return false as well. This will stop
the rest of the page from executing.
--->
<cfreturn false />
 
</cfif>
 
<cfelse>
 
<!---
The target app doesn't have this method. Again,
however, we have to check to see if the target
has an OnRequestStart() method. If it does not,
we have to delete This version in case a web
service call is coming through.
--->
<cfif NOT StructKeyExists( VARIABLES.TargetApp, "OnRequest" )>
 
<!---
No OnRequest() in the target. Delete it
from THIS instance so it doesn't execute as
an event method.
--->
<cfset StructDelete( THIS, "OnRequest" ) />
 
</cfif>
 
<!--- Return out. --->
<cfreturn true />
 
</cfif>
</cffunction>
 
 
<cffunction
name="OnRequest"
access="public"
returntype="void"
output="true"
hint="I execute the page template.">
 
<!--- Define arguments. --->
<cfargument
name="Page"
type="string"
required="true"
hint="I am the requested page."
/>
 
<!--- Call target application. --->
<cfset VARIABLES.TargetApp.OnRequest( ARGUMENTS.Page ) />
 
<!--- Return out. --->
<cfreturn />
</cffunction>
 
</cfcomponent>