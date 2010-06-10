<cfcomponent persistent="true" table="[user]">
       <cfproperty name="id" fieldtype="id" ormtype="integer" generator="native" />
       <cfproperty name="name" />
       <cfproperty name="email" />
</cfcomponent> 