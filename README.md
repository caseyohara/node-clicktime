node-clicktime
=============

A JavaScript wrapper for the ClickTime SOAP API

**Installation**

In your node project:

	$ npm install clicktime

And in your script:

	var Clicktime = require('clicktime');


**Usage**
	
The module exports a class with a single method, `exec`, which can be used to execute any ClickTime SOAP API call. (Link to API documentation below)

	clicktime.exec(method, parameters, callback(data));

Where `method` (string) is the API method you wish to call, `parameters` (hash/object) is the API parameters represented as `name: value`, and the callback function to be performed when data is received.


**Example**

First, create an instance of the ClickTime object:

	var clicktime = new ClickTime({ key: 'your-api-key', password: 'your-api-password' });

The GetEmployeeList API method, as defined in the ClickTime API docs: 

	<GetEmployeeList xmlns="http://clicktime.com/webservices/2.2/">
  		<UserID>string</UserID>
  		<ActiveOnly>boolean</ActiveOnly>
	</GetEmployeeList>
	
To execute this query you would call the following:
	
	clicktime.exec('GetEmployeeList', {UserID: 'some-user-id', ActiveOnly: true}, function(response){
		console.log(response);
	);


ClickTime SOAP API Documentation:
============

[http://app.clicktime.com/documentation/webservices/2_2/WebServicesDocumentation_2_2.asp](http://app.clicktime.com/documentation/webservices/2_2/WebServicesDocumentation_2_2.asp)

