import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoveragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coverage"),
        backgroundColor: Colors.blue,
      ),
      //The whole application area
      body: Container(
        width: double.infinity,
        child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10)),
            color: Colors.grey.shade50,
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.umbrella),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("How are you covered?", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    
                  ],)

            ],),)
        ],),)
    );
  }
}