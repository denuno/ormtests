component persistent="true" entityname="Order" table="Orders" 
{ 
	property name="orderID" fieldtype="id" generator="identity"; 
	property name="orderDate";
	property name="total";
	property name="tax";
	property name="shipping";
	property name="affiliateID";
	property name="billto_firstName";
	property name="billto_lastName";
	property name="billto_company";
	property name="billto_address1";
	property name="billto_address2";
	property name="billto_city";
	property name="billto_state";
	property name="billto_zipCode";
	property name="billto_email";
	property name="billto_phone";
	property name="shipto_firstName";
	property name="shipto_lastName";
	property name="shipto_company";
	property name="shipto_address1";
	property name="shipto_address2";
	property name="shipto_city";
	property name="shipto_state";
	property name="shipto_zipCode";
	property name="shipto_email";
	property name="shipto_phone";
	property name="orderDetails" type="array" fieldtype="one-to-many" cfc="OrderDetails" singularname="orderDetail" fkcolumn="orderID" inverse="true" cascade="all-delete-orphan";
	property name="customer" fieldtype="many-to-one" fkcolumn="customerID" cfc="Customers" missingRowIgnored="true";
	property name="payments" type="array" fieldtype="one-to-many" cfc="Payments" singularname="payment" fkcolumn="orderID" inverse="true" cascade="all-delete-orphan";

	public function init()
	{
		variables.total = 0;
		variables.tax = 0;
		variables.shipping = 0;
		variables.orderDate = now();
		return this;
	}
	
	public function addItemsFromCart(cart)
	{
		var i=1;
		var orderDetail = "";
		var cartItems = cart.getCartItems();
		for (i=1;i LTE ArrayLen(cartItems);i=i+1) 
		{			
			orderDetail = EntityNew("OrderDetail");
			orderDetail.setQuantity(cartItems[i].quantity);
			orderDetail.setUnitPrice(cartItems[i].unitPrice);
			orderDetail.setProduct(EntityLoadByPK("Product",cartItems[i].productID));

			this.addOrderDetail(orderDetail);
			orderDetail.setOrder(this);
			this.save();
			orderDetail.save();
						
		}//end for 	
		
	}

	public function save()
	{
		EntitySave(this);
	}

} 
