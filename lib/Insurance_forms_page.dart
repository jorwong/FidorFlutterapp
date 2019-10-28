import 'package:flutter/material.dart';

class InsuranceFormsPage extends StatefulWidget {
  static String tag ='InsuranceFormsPage';
  @override
  _InsuranceFormsPageState createState() => _InsuranceFormsPageState();
}

class _InsuranceFormsPageState extends State<InsuranceFormsPage> {
  @override
  Widget build(BuildContext context) {
  final producttype= TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Product Type',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final producttyp= TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Product Type',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final somepara= TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Para',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final NextButton= Material (
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent,
      elevation: 5.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42,
        onPressed: (){},
        color: Colors.lightBlueAccent,
        child: Text('Next', style: TextStyle(color: Colors.white)),
    )
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            producttype,
            SizedBox(height: 8.0,),
            producttyp,
            SizedBox(height: 24.0,),
            somepara,
            SizedBox(height: 24.0,),
            NextButton
          ],
        ),),
    );
  }
}