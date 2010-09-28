component persistent="true" entityname="Customer" table="Customers" 
{ 
	property name="customerID" fieldtype="id" generator="identity"; 
	property name="email";
	property name="firstName";
	property name="lastName";
	property name="company";
	property name="address1";
	property name="address2";
	property name="city";
	property name="state";
	property name="zipCode";
	property name="phone1";
	property name="phone2";
	property name="password";
	property name="orders" type="array" fieldtype="one-to-many" cfc="Orders" singularname="order" fkcolumn="customerID" inverse="true" cascade="all-delete-orphan";

	public function save()
	{
		EntitySave(this);
	}

} 
