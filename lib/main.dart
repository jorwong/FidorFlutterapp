import 'package:fidortry/Provider/class.dart';
import 'package:fidortry/Screens/checkout_page.dart';
import 'package:fidortry/Screens/home_page.dart';
import 'package:fidortry/Screens/home_page2.dart';
import 'package:fidortry/Screens/home_page2.dart' as prefix0;
import 'package:fidortry/Screens/login_page.dart' as prefix1;
import 'package:flutter/material.dart';
import 'Screens/login_page.dart';
import 'Screens/Insurance_forms_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fidortry/Screens/Homepage/Home_page_Remodel.dart';
import 'package:fidortry/Screens/loginPage/LoginPage.dart';
import "package:fidortry/Screens/InsuranceFormPage/form_fields.dart";
import 'package:fidortry/Screens/InsuranceFormPage/theme.dart';
import 'package:fidortry/Screens/checkoutPage/checkoutPage.dart';
import 'package:fidortry/Screens/MenuPage/HomeMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    //LoginPage.tag: (context)=>LoginPage(),
    HomePageScreen.tag: (context) => HomePageScreen(),
    InsuranceFormsPage.tag: (context) => InsuranceFormsPage(),
    CheckoutPage.tag: (context) => CheckoutPage(),
    FormFieldsExampleForm.tag: (context) => FormFieldsExampleForm(),
  };
  @override
  Widget build(BuildContext context) {
    getToken(); //enable when u want to use the API
    return MaterialApp(
      title: 'hihi',
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
      routes: routes,
    );
  }
}
