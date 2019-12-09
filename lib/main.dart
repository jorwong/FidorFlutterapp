import 'package:fidortry/Provider/class.dart';
import 'package:fidortry/Screens/CoveragePage/CoveragePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fidortry/Screens/Homepage/Home_page_Remodel.dart';
import 'package:fidortry/Screens/loginPage/LoginPage.dart';
import "package:fidortry/Screens/InsuranceFormPage/form_fields.dart";
import 'package:fidortry/Screens/InsuranceFormPage/theme.dart';
import 'package:fidortry/Screens/checkoutPage/checkoutPage.dart';
import 'package:fidortry/Screens/MenuPage/Menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    //LoginPage.tag: (context)=>LoginPage(),
    HomePageScreen.tag: (context) => HomePageScreen(),
    CheckoutPage.tag: (context) => CheckoutPage(),
    FormFieldsExampleForm.tag: (context) => FormFieldsExampleForm(),
  };
  @override
  Widget build(BuildContext context) {
    getToken(); //enable when u want to use the API
    return MaterialApp(
      title: 'hihi',
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
      routes: routes,
    );
  }
}
