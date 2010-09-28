component persistent="true" entityname="OrderDetail" table="OrderDetails" 
{ 
	property name="orderDetailID" fieldtype="id" generator="identity"; 
	property name="quantity";
	property name="unitPrice";
	property name="order" fieldtype="many-to-one" fkcolumn="orderID" cfc="Orders" missingRowIgnored="true";
	property name="product" fieldtype="one-to-one" cfc="Products" fkcolumn="productID";

	public function init()
	{
		return this;
	}

	public function save()
	{
		EntitySave(this);
	}

} 
