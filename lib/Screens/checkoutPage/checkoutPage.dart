import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fidortry/Provider/class.dart';

class CheckoutPage extends StatefulWidget {
  static String tag = 'Checkoutpage';
  CheckoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  String selected = "blue";
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The whole application area
      body:SafeArea(
          child: Column(
            children: <Widget>[
            hero(),
            spaceVertical(20),
            //Center Items
            Expanded (
              child: sections(),
            ),

              //Bottom Button
              purchase()
          ],
          ),
      ),
    );
  }


  ///************** Hero   ***************************************************/

  Widget hero(){
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset("lib/asset/iphone-xr-black.png",), //This
          // should be a paged
          // view.
          Positioned(child: appBar(),top: 0,),
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

        ],
      ),
    );
  }



  Widget appBar(){
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: new Image.asset("lib/asset/back_button.png"),
            onPressed: () {
              Navigator.pop(context);
            },),
          Container(
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
      "Price: \$1500 \n"
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
  Widget purchase(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(child: Text("Fidor Pay",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)
            ),
          ), color: Colors.transparent,
            onPressed: (){
              _onAlertButtonsPressed(context);
            },),
          Text(r"$1000",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w100,
                color: Color(0xFF2F2F3E)
            ),
          )
        ],
      ),
    );
  }

  /***** End */



_onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Confirm Transaction?",
      desc: "You will be paying \$1000 for the insurance",
      buttons: [
        DialogButton(
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            if(identical(postTransfer(1000),201)){
              
            }
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