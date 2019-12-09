import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fidortry/Provider/class.dart';
import 'package:fidortry/Screens/Homepage/Home_page_Remodel.dart';
import 'package:fidortry/Screens/loginPage/LoginPageTheme.dart' as Theme;
import 'package:fidortry/Screens/CoveragePage/CoveragePage.dart';

class CheckoutPage extends StatefulWidget {
  static String tag = 'Checkoutpage';
  CheckoutPage({Key key, @required this.amount}) : super(key: key);
  
  final int amount;
  final String title='checkout';

  @override
  _CheckoutPageState createState() => _CheckoutPageState(amount);
}

Future navigateToSubPage(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => CoveragePage()));
}

// showSubmitRequestSnackBar(BuildContext context) async {

//   Flushbar(
//     flushbarPosition: FlushbarPosition.BOTTOM,
//     message: "Request Successfully Saved",
//     icon: Icon(
//       Icons.info_outline,
//       size: 28.0,
//       color: Colors.red,
//     ),
//     backgroundColor: Colors.red,
//     duration: Duration(seconds: 5),
//     leftBarIndicatorColor: Colors.red,

//   )
//     ..show(context).then((r)=> Navigator.push(
//         context, MaterialPageRoute(builder: (context) => HomePageScreen())));
// }

class _CheckoutPageState extends State<CheckoutPage> {
  int amountstate;

  _CheckoutPageState(this.amountstate);
  String selected = "blue";
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      //The whole application area
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          ),
          child: 
        Column(
            children: <Widget>[
            hero(),
            Card(
              margin: prefix0.EdgeInsets.symmetric(horizontal: 60),
              elevation: 5,
              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10)),
              color: Colors.white,
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.phone_iphone),
                  SizedBox(width: 5,),
                  Text("Product: ",
                  style: prefix0.TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("IPhone XR", style: prefix0.TextStyle(fontSize: 16, fontWeight: prefix0.FontWeight.normal))
                ],),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                  Icon(Icons.receipt,),
                  SizedBox(width: 5,),
                  Text("Receipt Received: ",
                  style: prefix0.TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.check,size: 30, color: Colors.green,)
                ],),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                  Icon(FontAwesomeIcons.umbrella),
                  SizedBox(width: 5,),
                  Text("Coverage: ",
                  style: prefix0.TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Level 3", style: prefix0.TextStyle(fontSize: 16),)
                ],),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                  Icon(FontAwesomeIcons.dollarSign),
                  SizedBox(width: 5,),
                  Text("Premium/Month: ",
                  style: prefix0.TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("150 AED", style: prefix0.TextStyle(fontSize: 16),)
                ],),
                SizedBox(height: 5,),
              ],),),
              Container(
                margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  color: Colors.grey.shade400,
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: prefix0.EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Text("Fidor Pay"),
                          Text("(XXXX-1234)"),
                        ],),),
                    purchase(amountstate)
                  ],),)
                
            //Center Items
            // Expanded (
            //   child: sections(),
            // ),

              //Bottom Button
            
            
          ],
        ),

      ),
    
        
         
    );
  }


  ///************** Hero   ***************************************************/

  Widget hero(){
    return Container(
      child: 
          Image.asset("lib/asset/iphone-xr-black.png")//This
          // should be a paged
          // view.
          // Positioned(child: appBar(),top: 0,)
          // Positioned(child: FloatingActionButton(
          //   elevation: 2,
          //   child:Image.asset(favourite? "images/heart_icon.png" : "images/heart_icon_disabled.png",
          //     width: 30,
          //     height: 30,),
          //     backgroundColor: Colors.white,
          //     onPressed: (){
          //      setState(() {
          //        favourite = !favourite;
          //      });
          //     }
          //     ),
          //   bottom: 0,
          //   right: 20,
          // ),
        );
  }



  Widget appBar(){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: new Image.asset("lib/asset/back_button.png"),
            onPressed: () {
              Navigator.pop(context);
            },),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
             children: <Widget>[
               Text("Checkout",style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 24
               ),),
               Text("Insurance for IPhone-XR", style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w100,
                 color: Color(0xFF2F2F3E)
               ),),
             ],
            ),
            
          ),
              spaceHorizontal(22),
        ],
      ),
    );
  }

  /***** End */






  ///************ SECTIONS  *************************************************/

  Widget sections(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          description(),
          spaceVertical(50),
          //property(),
        ],
      ),
    );
  }

  Widget description(){
    return Text(
      "Product: IPhone X-R \n"
      "Id: 7392084-13840 \n"
      "Price: 1500 AED \n"
      "Receipt Provided: Yes",
      textAlign: TextAlign.left,
      
      style: TextStyle(height: 1.5, color: Color(0xFF6F8398),fontSize: 15),);
  }

  Widget property(){
    return Container(
      padding: EdgeInsets.only(right: 20,left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("COLOR", textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)
              ),
              ),
              spaceVertical(10),
              //colorSelector(),
            ],
          ),
          size()
        ],
      ),
    );
  }

  Widget size(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Size", textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F2F3E)
          ),
        ),
        spaceVertical(10),
        Container(
          width: 70,
          padding: EdgeInsets.all(10),
          color: Color(0xFFF5F8FB),
          child: Text("10.1",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)
            ),
          ),
        ),
      ],
    );
  }

  /***** End */



  ///************** BOTTOM BUTTON ********************************************/
  Widget purchase(int amt){
    return Container(
      decoration: prefix0.BoxDecoration(color: Colors.blue, borderRadius: prefix0.BorderRadius.circular(5)),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: prefix0.CrossAxisAlignment.start,
            children: <Widget>[
            Text('150 AED',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Colors.white,
            ),
          ),
          Text("Total", style: prefix0.TextStyle(color: Colors.white),),
          ],),
          prefix0.FlatButton(
            child: Text("Fidor Pay",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
          ), color: Colors.transparent,
            onPressed: (){
              _onAlertButtonsPressed(context, 150);
            },),
            Icon(Icons.arrow_right, color: Colors.white, size: 40,),
        ],
      ),
    );
  }

  /***** End */



_onAlertButtonsPressed(context,int amountbtn) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Confirm Transaction?",
      desc: "You will be paying $amountbtn AED for the insurance",
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

  ///************** UTILITY WIDGET ********************************************/

  Widget spaceVertical(double size){
    return SizedBox(height: size,);
  }

  Widget spaceHorizontal(double size){
    return SizedBox(width: size,);
  }
 /***** End */
}