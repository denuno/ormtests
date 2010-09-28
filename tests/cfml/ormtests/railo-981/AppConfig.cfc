component persistent="false" accessors="true"
{ 
	property name="smtpServer";
	property name="smtpUsername";
	property name="smtpPassword";
	property name="customerServiceEmail"; //used as from address for email receipts and such
		
	public function init(config)
	{
		variables.smtpServer = arguments.config.smtpServer;
		variables.smtpUsername= arguments.config.smtpUsername;
		variables.smtpPassword = arguments.config.smtpPassword;
		variables.customerServiceEmail = arguments.config.customerServiceEmail;
		return this;
	}
} 
