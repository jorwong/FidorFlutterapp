import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async{
  String code='8fa4e51beb2b9f159b1414e937e603aa';
  final response = await http.post('http://apm.sandboxpresales.fidorfzco.com/oauth/token?grant_type=authorization_code&client_id=2d9f97613542093e&client_secret=1f527b70f6c8dc24e7f8e44b8a7cd5b7&code='+code+'&redirect_uri=http://localhost:3000/OAuth2callback');
  print (response.statusCode);
  Map<String, dynamic> jsonn= json.decode(response.body);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('access', jsonn['access_token']);
  return jsonn['access_token'];
}

