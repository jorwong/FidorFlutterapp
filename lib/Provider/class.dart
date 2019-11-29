import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:fidortry/Screens/Homepage/Home_page_Remodel.dart';

Future navigateToSubPage(context)async {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));
}

Future<String> getToken() async{
  String code='8dabc7b1e83eb72494f0d3769bde2138';
  final response = await http.post('http://apm.sandboxpresales.fidorfzco.com/oauth/token?grant_type=authorization_code&client_id=2d9f97613542093e&client_secret=1f527b70f6c8dc24e7f8e44b8a7cd5b7&code='+code+'&redirect_uri=http://localhost:3000/OAuth2callback');
  print (response.statusCode);
  Map<String, dynamic> jsonn= json.decode(response.body);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('access', jsonn['access_token']);
  return jsonn['access_token'];
}

Future<Customer> getCustomers() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token=(prefs.getString('access'));
  final response =await http.get('http://eg-api.sandboxpresales.fidorfzco.com/fidor_banking/accounts',
  headers: {
    'Content-Type':"application/json",
    'Accept':"application/vnd.fidor.de; version=1,text/json",
    'Authorization':"Bearer "+token
  });
  Map<String, dynamic> decoded = json.decode(response.body);
  print(decoded['data'][0]['id']);
  Customer cust= Customer(decoded['data'][0]['id'], decoded['data'][0]['customers'][0]['first_name'], decoded['data'][0]['customers'][0]['last_name'], decoded['data'][0]['balance']);
  int amount=decoded['data'][0]['balance'];
  return cust;
}

Future<void> postTransfer(int amountTrans,BuildContext context) async{
  var uuid = Uuid();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token=(prefs.getString('access'));
  final response =await http.post('http://eg-api.sandboxpresales.fidorfzco.com/fidor_banking/internal_transfers',
  body: json.encode(
  {
  "account_id": "79054921",
  "receiver": "26857779",
  "external_uid": uuid.v4() ,
  "amount": amountTrans,
  "subject": "my share of yesterday evening"
  }),
  headers: {
    'Content-Type':"application/json",
    'Accept':"application/vnd.fidor.de; version=1,text/json",
    'Authorization':"Bearer "+ token
  });
  print(response.statusCode.toString());

  // return (response.statusCode.toString());
  navigateToSubPage(context);
}

class Customer{
  String accountid;
  String firstName;
  String lastName;
  int balance;

  Customer(String id, String fName, String lName, int bal){
    this.accountid=id;
    this.firstName=fName;
    this.firstName=lName;
    this.balance=bal;
  }

  String get custId{
    return accountid;
  }

  String get firName{
    return firstName;
  }

  String get lasName{
    return lastName;
  }

  int get bal{
    return balance;
  }
}

