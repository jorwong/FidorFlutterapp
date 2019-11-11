import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InsuranceFormsPage extends StatefulWidget {
  static String tag ='Insuranceformpage';
  @override
  _InsuranceFormsPageState createState() => _InsuranceFormsPageState();
}

class _InsuranceFormsPageState extends State<InsuranceFormsPage> {

  Future<void> _takepicture() async {
   final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
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
        onPressed: _takepicture,
        color: Colors.lightBlueAccent,
        child: Text('Next', style: TextStyle(color: Colors.white)),
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