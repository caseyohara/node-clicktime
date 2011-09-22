{XMLHttpRequest} = require "xmlhttprequest"
parser = require 'xml2json'


class ClickTime

  endpoint  = 'https://app.clicktime.com/webservices/2_2/userdataexchange.asmx'
  xmlns     = 'http://clicktime.com/webservices/2.2/'

  constructor: ({@key, @password})->

  send : (body)->
    xml = '<?xml version="1.0" encoding="utf-8"?>' +
      '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">' +
        '<soap:Header>' +
          '<CredentialsSoapHeader xsi:type="WebServiceKeyCredentials" xmlns="http://clicktime.com/webservices/2.2/">' +
            '<Key>' + @key + '</Key>' +
            '<Password>' + @password + '</Password>' +
          '</CredentialsSoapHeader>' +
        '</soap:Header>' +
        '<soap:Body>' +
          body +
        '</soap:Body>' +
      '</soap:Envelope>';
    @xmlhttp.send xml


  set_callback : (fn)->
    @xmlhttp.onreadystatechange = =>
     if @xmlhttp.readyState is 4
       json_string = parser.toJson @xmlhttp.responseText
       json = JSON.parse json_string
       fn json['soap:Envelope']['soap:Body']


  exec : (method, params, callback) ->
    @xmlhttp = new XMLHttpRequest
    @xmlhttp.open "POST", endpoint ,true
    @xmlhttp.setRequestHeader "Content-Type", "text/xml"
    @set_callback callback
    body = '<' + method +  ' xmlns="' + xmlns + '">'
    body +=  "<#{key}>#{value}</#{key}>" for key, value of params
    body += '</' + method + '>'
    @send body

module.exports = ClickTime