component persistent="true" entityname="Affiliate" table="Affiliates" 
{ 
	property name="affiliateID" fieldtype="id" generator="identity"; 
	property name="affiliateCode";
	property name="name";
	property name="email";
	property name="company";
	property name="address1";
	property name="address2";
	property name="city";
	property name="state";
	property name="zipCode";
	property name="phone1";
	property name="phone2";

	public function save()
	{
		EntitySave(this);
	}

} 
