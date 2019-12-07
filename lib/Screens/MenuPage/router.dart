import 'package:flutter/material.dart';
import 'package:fidortry/Screens/MenuPage/HomeMenu.dart';
import 'package:fidortry/Screens/MenuPage/product_details.dart';

const String homeViewRoute = '/';
const String productDetailsViewRoute = 'product_details';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case productDetailsViewRoute:
      return MaterialPageRoute(
        builder: (_) => ProductDetailsPage(
          product: settings.arguments,
        ),
      );
      break;
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
