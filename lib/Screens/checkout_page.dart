import 'package:fidortry/Screens/home_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fidortry/Provider/class.dart';

class CheckoutPage2 extends StatefulWidget{
  int amountsGGTrans;
  CheckoutPage2({Key key, @required this.amountsGGTrans}) : super(key: key);
  static String tag = 'Checkoutpage';
  @override
  _CheckoutPageState createState() => new _CheckoutPageState(amountsGGTrans);
  }

class _CheckoutPageState extends State<CheckoutPage2>{
  int  recordObject;
 _CheckoutPageState(this. recordObject);
  Future<void> _askForConfirmation() async {
    return await showDialog<void>(
      context: context,
      builder: (context)=>
      AlertDialog(
        title: Text("Confirm the Payment of \$$recordObject ?"),
        actions: <Widget>[
          MaterialButton(
            child: Text("Confirm"),
            onPressed: (){
              makeTrans(recordObject);
            },
          ),
          MaterialButton(
            child: Text("Back"),
            onPressed: ()=> Navigator.pop(context),
          )
        ],
      )
    );
  }

    void makeTrans(int amount) async{
      await postTransfer(amount,context).then((resp){
        Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
              new HomePage2()
            ));
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
                          _askForConfirmation();
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
      body: 
      Center(child: ListView(
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
