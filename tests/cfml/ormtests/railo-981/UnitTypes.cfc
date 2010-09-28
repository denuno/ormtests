component persistent="true" entityname="UnitType" table="UnitTypes" 
{ 
	property name="unitTypeID" fieldtype="id" generator="identity"; 
	property name="name";
	property name="packSize";	
	
	public function init()
	{
		return this;
	}

	public function save()
	{
		EntitySave(this);
	}

} 
