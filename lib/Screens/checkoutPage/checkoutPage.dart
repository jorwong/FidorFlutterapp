import 'package:flutter/material.dart';

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
          Image.asset("images/shoe_$selected.png",), //This
          // should be a paged
          // view.
          Positioned(child: appBar(),top: 0,),
          Positioned(child: FloatingActionButton(
            elevation: 2,
            child:Image.asset(favourite? "images/heart_icon.png" : "images/heart_icon_disabled.png",
              width: 30,
              height: 30,),
              backgroundColor: Colors.white,
              onPressed: (){
               setState(() {
                 favourite = !favourite;
               });
              }
              ),
            bottom: 0,
            right: 20,
          ),

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
          Image.asset("images/back_button.png"),
          Container(
            child: Column(
             children: <Widget>[
               Text("MEN'S ORIGINAL",style: TextStyle(
                 fontWeight: FontWeight.w100,
                 fontSize: 14
               ),),
               Text("Smiths Shoes", style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.bold,
                 color: Color(0xFF2F2F3E)
               ),),
             ],
            ),
          ),
          Image.asset("images/bag_button.png", width: 27, height: 30,),
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
          property(),
        ],
      ),
    );
  }

  Widget description(){
    return Text(
      "A style icon gets some love from one of today's top "
          "trendsetters. Pharrell Williams puts his creative spin on these "
          "shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
      textAlign: TextAlign.justify,
      style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),);
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
              colorSelector(),
            ],
          ),
          size()
        ],
      ),
    );
  }

  Widget colorSelector(){
    return Container(
      child: Row(
        children: <Widget>[
          ColorTicker(color: Colors.blue,selected: selected == "blue",
              selectedCallback:
                  (){
                setState(() {
                  selected = "blue";
                });
              }
          ),

          ColorTicker(color: Colors.green,selected: selected == "green",
              selectedCallback:
                  (){
                setState(() {
                  selected = "green";
                });
              }),

          ColorTicker(color: Colors.yellow,selected: selected == "yellow",
            selectedCallback: (){
              setState(() {
                selected = "yellow";
              });
            },
          ),
          ColorTicker(color: Colors.pink,selected: selected == "pink",
            selectedCallback: (){
              setState(() {
                selected = "pink";
              });
            },
          ),
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
        )

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
          FlatButton(child: Text("ADD TO BAG +",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)
            ),
          ), color: Colors.transparent,
            onPressed: (){},),
          Text(r"$95",
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





  ///************** UTILITY WIDGET ********************************************/

  Widget spaceVertical(double size){
    return SizedBox(height: size,);
  }

  Widget spaceHorizontal(double size){
    return SizedBox(width: size,);
  }
 /***** End */
}


class ColorTicker extends StatelessWidget{
  final Color color;
  final bool selected;
  final VoidCallback selectedCallback;
  ColorTicker({this.color,this.selected,this.selectedCallback});


  @override
  Widget build(BuildContext context) {
    print(selected);
    return
      GestureDetector(
        onTap: (){
          selectedCallback();
        },
        child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.all(5),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.7)),
                 child: selected ? Image.asset("images/checker.png") :
               Container(),
        )
      );
  }

}