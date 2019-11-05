import 'package:flutter/material.dart';
import 'Insurance_forms_page.dart';
import 'package:fidortry/Provider/class.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  static String tag = 'Homepage';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final imageBG= Image.asset('',
    width: size.width,
    height: size.height,
    fit: BoxFit.fill
    );

    final financeText= Text(
      ,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
    );

    final button1 = SizedBox (
      width: 50.0,
      height: 50.0,
      
      child: FloatingActionButton(
        heroTag:'1st',
        backgroundColor: Colors.lightBlue,
        onPressed: (){},
        hoverElevation: 2.0,
        child: Icon(
        Icons.favorite,
        color: Colors.white,
        size: 19.0,
      ),
      )
    );

final button2 = SizedBox (
      width: 90.0,
      height: 90.0,
      
      child: FloatingActionButton(
        heroTag: '2nd',
        backgroundColor: Colors.lightBlue,
        onPressed: (){
          Navigator.of(context).pushNamed(InsuranceFormsPage.tag);
        },
        hoverElevation: 2.0,
        child: Icon(
        Icons.favorite,
        color: Colors.white,
        size: 30.0,
      ),
      )
    );

final button3 = SizedBox (
      width: 50.0,
      height: 50.0,
      
      child: FloatingActionButton(
        heroTag: '3rd',
        backgroundColor: Colors.lightBlue,
        onPressed: (){
          
        },
        hoverElevation: 2.0,
        child: Icon(
        Icons.favorite,
        color: Colors.white,
        size: 19.0,
      ),
      )
    );
  

    return Scaffold( 
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
      )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 180.0),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            financeText,
            SizedBox(height: 120,),
            Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                button1,
                button2,
                button3
              ],
              ),
            ],
            )
          ],
      ),
    )
    );
    
  }
}

