<cfcomponent persistent="true" table="Entry">

	<cfproperty name="idblog_entries" fieldtype="id" ormtype="integer"
		generator="native" />
	<cfproperty name="title" />
	<cfproperty name="subtitle" />
	<cfproperty name="content" />
	<cfproperty name="comments_allowed">
	<cfproperty name="comments" type="array" fieldtype="one-to-many"
		cfc="Comment" fkcolumn="blog_entries_idblog_entries">

</cfcomponent>
