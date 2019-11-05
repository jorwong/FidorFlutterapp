import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Token> getToken() async{
  String code='bb187bc869466636fda2b3074a76fa0e';
  final response = await http.post('http://apm.sandboxpresales.fidorfzco.com/oauth/token?grant_type=authorization_code&client_id=2d9f97613542093e&client_secret=1f527b70f6c8dc24e7f8e44b8a7cd5b7&code='+code+'&redirect_uri=http://localhost:3000/OAuth2callback');
  final responseJson=json.decode(response.body);
  return Token.fromJson(responseJson);
}

class Token{
  final String access_token;
  final String refresh_token;

  Token({this.access_token,this.refresh_token});

  factory Token.fromJson(Map<String, dynamic> json) {
    Token(
      access_token: json['access_token'],
      refresh_token: json['refresh_token'],
    );
  }
}