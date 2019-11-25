import 'package:fidortry/Screens/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:fidortry/main.dart';
import 'home_page.dart';
import 'package:fidortry/Provider/class.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage2 extends StatefulWidget {
  static String tag = 'Loginpage';
  String token;
  @override
  _LoginPageState createState() => new _LoginPageState();
  }
Future navigateToSubPage(context)async {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage2()));
}
class _LoginPageState extends State<LoginPage2> {
    
    @override
    Widget build(BuildContext context) {
    final email= TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Email',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password= TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Password',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final LoginPageButton = Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent,
      elevation: 5.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42,
        onPressed: (){
         navigateToSubPage(context);
        },
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
       ),
      ),
    );

    
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Center(child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            email,
            SizedBox(height: 8.0,),
            password,
            SizedBox(height: 24.0,),
            LoginPageButton
          ],
        ),
      ),
    );
  }
}
