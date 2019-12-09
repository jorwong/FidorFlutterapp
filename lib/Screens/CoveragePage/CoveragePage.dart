import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fidortry/Provider/class.dart';
import 'package:flushbar/flushbar.dart';
import 'package:fidortry/Screens/Homepage/Home_page_Remodel.dart';
import 'package:fidortry/Screens/checkoutPage/checkoutPage.dart';

bool check=false;

class CoveragePage extends StatefulWidget{
  static String tag = 'Coveragepage';

  @override
  _CoveragePageState createState() => _CoveragePageState();
}

Future navigateToSubPage(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => CheckoutPage()));
}

class _CoveragePageState extends State<CoveragePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coverage"),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      //The whole application area
      body: Container(
        width: double.infinity,
        child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            height: 150,
            child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.umbrella, size: 50,),
                  SizedBox(width: 25,),
                  Container(
                    alignment: Alignment(-1.0, 0),
                    width: 300,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("How are you covered?", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      SizedBox(height: 10),
                      Text("One year worldwide coverage for theft and accidental damage from screen breakage, liquid, sand and fire."),
                      
                    ],),)
                  

              ],)
          ),
          Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.grey.shade300,
                    Colors.grey.shade300,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            width: 350.0,
            height: 1.0,),
          Container(
            padding: EdgeInsets.all(10),
            height: 150,
            child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.sadTear, size: 50,),
                  SizedBox(width: 25,),
                  Container(
                    alignment: Alignment(-1.0, 0),
                    width: 300,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("What's not covered?", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      SizedBox(height: 10),
                      Text("Electrical and mechanical breakdown, cosmetic damage (e.g. scratches, dents, etc.), theft or loss due to negligence and damages prior to policy purchase."),
                      
                    ],),)
                  

              ],)
          ),
          Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.grey.shade300,
                    Colors.grey.shade300,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            width: 350.0,
            height: 1.0,),
          Container(
            padding: EdgeInsets.all(10),
            height: 150,
            child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.moneyBill, size: 50,),
                  SizedBox(width: 25,),
                  Container(
                    alignment: Alignment(-1.0, 0),
                    width: 300,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Deductable", 
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                      SizedBox(height: 10),
                      Text("10% of the claim amount or minimum amount of 250 AED, whichever is higher."),
                      
                    ],),)
                  

              ],)
          ),
          
          
          Container(

            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Colors.grey.shade300,
                    Colors.grey.shade300,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            width: 350.0,
            height: 1.0,),
          Container(
            padding: EdgeInsets.all(20),
            child: 
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Row(
                    children: <Widget>[
                    Text("I agree with the "),
                    Text("Terms & Conditions", style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                  Text("because without it I can't go through with this...",style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),)
                ],),
                Checkbox(value: check, onChanged: (bool value){
                  setState(() {
                    check=true;
                  });
                })

              ],
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(15),
            elevation: 5,
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
            child: Text("Insure me!", style: TextStyle(fontSize: 20, color: Colors.white),), onPressed: () {
              //_onAlertButtonsPressed(context, 180);
              navigateToSubPage(context);
            },)
        ],),)
    );
  }
}

showSubmitRequestSnackBar(BuildContext context) async {

  Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: "Request Successfully Saved",
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.red,
    ),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 5),
    leftBarIndicatorColor: Colors.red,

  )
    ..show(context).then((r)=> Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePageScreen())));
}


_onAlertButtonsPressed(context,int amountbtn) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Confirm Transaction?",
      desc: "You will be paying \$$amountbtn for the insurance",
      buttons: [
        DialogButton(
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            postTransfer(amountbtn,context)
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
