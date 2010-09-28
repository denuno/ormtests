<cfcomponent displayname="TestSvn"  extends="mxunit.framework.TestCase">

	<cffunction name="setUp" returntype="void" access="public">
	</cffunction>

	<cffunction name="tearDown" returntype="void" access="public">
	</cffunction>

	<cffunction name="dumpvar" access="private">
		<cfargument name="var" />
		<cfdump var="#var#" />
		<cfabort />
	</cffunction>

	<cffunction name="testDump">
		<cfscript>
			writeOutput( 'Creating/saving a new entity...<br />' );
			user = entityNew( 'user' );
			user.setUserName('hsimpson');
			user.setPassword('letmein');
			user.setFirstName( 'Homer' );
			user.setEmail( 'homer@thesimpsons.com' );
			entitySave( user );
			ormFlush();
			writeOutput( 'New entity saved with ID: #user.getUserID()#<br/>' );
			assertTrue(user.getUserID());
		</cfscript>
	</cffunction>


</cfcomponent>
