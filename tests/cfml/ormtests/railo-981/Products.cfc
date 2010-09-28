component persistent="true" entityname="Product" table="Products" 
{ 
	property name="productID" fieldtype="id" generator="identity"; 
	property name="sku";
	property name="name";
	property name="description";	
	property name="color";
	property name="unitType" fieldtype="many-to-one" fkcolumn="unitTypeID" cfc="unitTypes";
	
	
	public function init()
	{
		return this;
	}

	public function save()
	{
		EntitySave(this);
	}

} 
