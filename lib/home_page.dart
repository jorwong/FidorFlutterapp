import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: Center(child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
           
          ],
        ),
      ),
    );
    
  }
}

