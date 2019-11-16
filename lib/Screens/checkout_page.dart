import 'package:fidortry/Screens/home_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fidortry/Provider/class.dart';

class CheckoutPage extends StatefulWidget{
  static String tag = 'Checkoutpage';
  @override
  _CheckoutPageState createState() => new _CheckoutPageState();
  }

class _CheckoutPageState extends State<CheckoutPage>{

    void makeTrans() async{
      await postTransfer(1000).then((resp){
        Navigator.of(context).pushNamed(HomePage2.tag);
      });
    }

    @override
    Widget build(BuildContext context) {
        final textDisplay= Text("hello");
        final amountDisplay= Text("hello");

        final rowofButs= Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("Fidor"),
                        onPressed: () {
                          makeTrans();
                        },
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        child: Text("Visa"),
                        onPressed: () => null,
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        child: Text("MasterCard"),
                        onPressed: () => null,
                      ),
                    )
                  ]
        );

  return Scaffold( 
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: new Text("Checkout"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
      )
        ],
      ),
      body: Center(child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            textDisplay,
            amountDisplay,
            rowofButs
          ]
        )
      )
    );
    }
  }
