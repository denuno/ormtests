component persistent="false" accessors="true"
{ 

	property name="userID";
	property name="userName";
	property name="cart";
	property name="customerID"; //the customerID of the logged in customer
	property name="customerName";
	property name="orderID"; //store the orderID of the order in process
	property name="paymentID"; //the payment details of the payment in process
	property name="cardNumber"; //the credit card number of the payment in process
	
	public function init()
	{
		variables.userID = 0;
		variables.userName = "";
		variables.customerID = 0;
		variables.orderID = 0;
		return this;
	}
	
	public function isAdmin()
	{
		return (variables.userID GT 0);
	}
	
	public function isCustomerLoggedIn()
	{
		return (variables.customerID GT 0);
	}
	
	public function getCart()
	{
		if (isNull(variables.cart))
		{
			variables.cart = CreateObject("component", "components.model.Cart").init();
		}	
		return variables.cart;
		
	}
	
	public function logout()
	{
		variables.customerID = 0;
	}
	
	public function logoutOfAdmin()
	{
		variables.userID = 0;
		variables.userName = "";
	}
	

} 
