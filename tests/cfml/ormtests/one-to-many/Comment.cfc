<cfcomponent persistent="true" table="blog_comments">

	<cfproperty name="idblog_comments" fieldtype="id"
		ormtype="integer" generator="native" />
	<cfproperty name="blog_entries_idblog_entries" />
	<cfproperty name="comment_user">
	<cfproperty name="title" />
	<cfproperty name="content" />
	<cfproperty name="comment_approved" />

</cfcomponent>
