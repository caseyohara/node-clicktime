var ClickTime = require("./lib/clicktime");

CT = new ClickTime({key: 'your-web-service-key', password: 'your-web-service-key'});

CT.exec('GetEmployeeList', { UserID : 'your-user-id', ActiveOnly : true },
  function(data){
    console.log(data);
  }
);

