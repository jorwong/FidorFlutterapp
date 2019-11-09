import 'package:fidortry/Provider/class.dart';
import 'package:fidortry/Screens/home_page.dart';
import 'package:fidortry/Screens/home_page2.dart';
import 'package:fidortry/Screens/home_page2.dart' as prefix0;
import 'package:flutter/material.dart';
import 'Screens/login_page.dart';
import 'Screens/Insurance_forms_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //Future<Token> post;
  // void initState() {
  //   post = getToken();
  //   post.then((onValue) async{
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('access', onValue.access_token);
  //   });
  // }
  
  

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context)=>LoginPage(),
    HomePage.tag: (context)=>HomePage2(),
    InsuranceFormsPage.tag: (context)=>InsuranceFormsPage(),
  };
  @override
  Widget build(BuildContext context) {
    getToken();
    return MaterialApp(title: 'hihi',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.lightBlue
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
