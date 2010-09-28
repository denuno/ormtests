component persistent="false" accessors="true"
{ 

	property name="cartItems";
	property name="affiliateCode";
	property name="shipping";

	
	public function init()
	{
		variables.cartItems = ArrayNew(1);
		variables.affiliateCode = "";
		variables.shipping = 0.00;
		return this;
	}
		
	public function addItem(product,quantity,unitPrice)
	{
		//loop through the cart items and increase qty if exists
		var i = 1;
		for (i=1;i LTE ArrayLen(variables.cartItems); i=i+1)
		{
			if (variables.cartItems[i].productID EQ product.getProductID())
			{
				variables.cartItems[i].quantity = variables.cartItems[i].quantity + quantity;
				return;
			}
		}
		//productID didn't exist so add it
		var item = {};
		item.productID = product.getProductID();
		item.quantity = quantity;
		item.unitPrice = unitPrice; //TODO get price from a service call
		item.name = product.getName();
		arrayAppend(variables.cartItems, item);
	}
	
	//clear/empty the cart2
	public function clear()
	{
		variables.cartItems = ArrayNew(1);
		variables.affiliateCode = "";
	}
	
	public function isEmpty()
	{
		return (arrayLen(variables.cartItems) EQ 0);
	}
	
	public function getTotal()
	{
		var i = 1;
		var total = 0.00;
		for (i=1;i LTE ArrayLen(variables.cartItems);i=i+1) 
		{
			total = total + (variables.cartItems[i].quantity * variables.cartItems[i].unitPrice);
		}//end for 
		total = total + variables.shipping;	
		return total;
	}
	
	public function removeItem(productID)
	{		
		var i=1;
		for (i=1;i LTE ArrayLen(variables.cartItems);i=i+1) 
		{
			//writelog(text="#variables.cartItems[i].sku# #sku#",file="application",application="no");
			if (ucase(variables.cartItems[i].productID) eq ucase(productID))
			{
			arrayDeleteAt( variables.cartItems, i);
			}
		}//end for 	
	}
	
	public function getQuantityForProduct(product)
	{
		var i=1;
		for (i=1;i LTE ArrayLen(variables.cartItems);i=i+1) 
		{
			
			if (ucase(variables.cartItems[i].productID) eq ucase(product.getProductID()))
			{
				return variables.cartItems[i].quantity;
			}
		}//end for 	
		return 0;
	}
	
	public function setQuantityForProduct(product,quantity)
	{
		var i=1;
		for (i=1;i LTE ArrayLen(variables.cartItems);i=i+1) 
		{
			
			if (ucase(variables.cartItems[i].productID) eq ucase(product.getProductID()))
			{
				variables.cartItems[i].quantity = quantity;
			}
		}//end for		
	}
	
	public function updateCart(newCartItems)
	{
		variables.cartItems = newCartItems;
	}
	
	//number of items in the cart
	public function getItemCount()
	{
		return ArrayLen(variables.cartItems);
	}
	
	public function getItemNumber(lineItem)
	{
		if (lineItem LTE ArrayLen(variables.cartItems))
		{
			return variables.cartItems[lineItem];
		}
		return;
	}
	
	public function removeItemNumber(lineItem)
	{
		arrayDeleteAt( variables.cartItems, lineItem);
	}
	

} 
