import 'package:fidortry/home_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context)=>LoginPage(),
    HomePage.tag: (context)=>HomePage(),
  };
  @override
  Widget build(BuildContext context) {
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
