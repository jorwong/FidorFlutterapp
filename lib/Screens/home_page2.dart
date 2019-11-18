import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Insurance_forms_page.dart';
import 'package:fidortry/Provider/class.dart';
import 'package:http/http.dart' as http;

class HomePage2 extends StatefulWidget{
  static String tag = 'Homepage';
  
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage2>{
  String token="";
  String amount="";
  String amountDisplay="";
  int control=1;
  void getTokensfromSP()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token=(prefs.getString('access'));
  }
  void getCust() async{
    getCustomers().then((Customer cust){
        amount=cust.balance.toString();
        amountDisplay="\$ $amount";
        setState(() { 
          control=2;
          setControl(2);
        });
    });
  }

  void setControl(int num) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('control', num);
  }

  void getControl() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    control=(prefs.getInt('control'));
  }

  @override
  Widget build(BuildContext context) {

    if(control==1){
      getCust();
    }
    if(token==""){
      getTokensfromSP();
    }
    //showInSnackBar();
    Size size = MediaQuery.of(context).size;
    final imageBG= Image.asset('lib/images/homepage.png',
    width: size.width,
    height: size.height,
    fit: BoxFit.fill
    );

    final financeText= Text(
      amountDisplay,
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


    void showInSnackBar(BuildContext contex) {
      final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
      Scaffold.of(contex).showSnackBar(snackBar);
      }


    final button2 = SizedBox (
      width: 90.0,
      height: 90.0,
      
      child: FloatingActionButton(
        heroTag: '2nd',
        backgroundColor: Colors.lightBlue,
        onPressed: (){
          setControl(1);
          Navigator.of(context).pushNamed(InsuranceFormsPage.tag);
          //showInSnackBar(context);

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
  

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/asset/homepage.png"), fit: BoxFit.fitHeight)),
      child: Scaffold( 
      backgroundColor: Colors.transparent,
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
      body: Builder(
        builder: (context) =>
      Container(
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
    ) )
      )
    )
    );
    
  }
}