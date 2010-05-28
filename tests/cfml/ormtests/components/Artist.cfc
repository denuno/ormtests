component persistent="true"
{

    property name="artistid" column="artistid" fieldtype="id" generator="identity";
    property name="firstname";
    property name="lastname";
    property name="address";
    property name="city";
    property name="state";
    property name="postalcode";
    property name="email";
    property name="phone";
    property name="fax";
    property name="thepassword";

/*
Artists have many arts.  Using Collections, the name of the arts created by
each artist can be retrieved as a string array.  Note that the art names
is picked from the table and you donÕt require the ART component.  This also means
that you get an array of strings and not an array of persistent objects.

For doing this, first of all, set fieldtype="collection".

type: can be "array" or "struct". Defaults to array.  If type=array, the art
names are retrieved as an array of names.  If type=struct, the art names are
retrieved as key-value pairs.

table: The name of the table in which the collection needs to be retrieved from.

fkcolumn: The name of the foriegn key. If not specified, will be figured
out by inspecting the database.

elementcolumn: The name of the table column which should be the retrieved as
the values of the array/struct. In this case, the names of the arts (Art->artname).

elementtype: The datatype of the table column used in elementcolumn.

orderby: Specify the sort order.  The string should be specified in the format
"<column_name_1> <sort_order>, <column_name_2> <sort_order>, ...". <column_name>
should be the name of the column name of the table. <sort_order> is "desc" or "asc".
*/

    property name="ArtNamesAsArray" fieldtype="collection" table="Art"
    fkcolumn="artistid" type="array" elementtype="string" elementcolumn="artname"
    orderby="artname desc";

/*
Here is one more property which retrieves artnames but it retrieves it as a struct.

Two additional attributes are requried to defined for this collection type - structkeycolumn and
structkeytype in addition to the attributes used for fieldtype="collection" for type="array".

Structkeycolumn: Specify the column name of the table which should be used for the keys of the struct.
This column should be unique for the records that are retrieved. Here, the column artid is used.  

Structkeytype: The type of the column that is used in structkeycolumn.
*/

    property name="ArtNamesAsStruct" fieldtype="collection" table="Art" fkcolumn="artistid"
    type="struct" elementtype="string" elementcolumn="artname" structkeytype="int"
    structkeycolumn="artid" orderby="artid";
}