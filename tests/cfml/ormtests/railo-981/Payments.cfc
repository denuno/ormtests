component persistent="true" entityname="Payment" table="Payments" 
{ 
	property name="paymentID" fieldtype="id" generator="identity"; 
	property name="order" fieldtype="many-to-one" fkcolumn="orderID" cfc="Orders" missingRowIgnored="true";
	property name="dateCreated";
	property name="amount";
	property name="statusID"; //0-success, 1-pending, 2-declined, 3-failure, 4-timeout, 99-unknown
	property name="paymentTypeID"; //1-credit card //2-paypal
	property name="message";
	property name="authorization";
	property name="transactionID";
	//credit card fields
	property name="cardFirstName";
	property name="cardLastName";
	property name="cardNumber";
	property name="cardType";
	property name="cardExpirationDate";
	property name="cardVerificationCode";

	// property name="product" fieldtype="one-to-one" cfc="Products" fkcolumn="productID";
	

	public function init()
	{
		variables.amount = 0.0;
		variables.statusID = 1;
		variables.dateCreated = now();
		variables.paymentTypeID = 1; //default to credit card
		return this;
	}

	public function save()
	{
		EntitySave(this);
	}

} 
