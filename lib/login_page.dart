import 'package:flutter/material.dart';
import 'main.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'Loginpage';
  @override
  _LoginPageState createState() => new _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
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
          Navigator.of(context).pushNamed(HomePage.tag);
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
