import 'dart:io';
import 'package:fidortry/Screens/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InsuranceFormsPage extends StatefulWidget {
  static String tag ='Insuranceformpage';
  int amount;
  @override
  _InsuranceFormsPageState createState() => _InsuranceFormsPageState();
}

class _InsuranceFormsPageState extends State<InsuranceFormsPage> {
  TextEditingController amountText = TextEditingController();
  File _pickedPicture;
  void _takepicture() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (context)=>
      AlertDialog(
        title: Text("Select the image source"),
        actions: <Widget>[
          MaterialButton(
            child: Text("Gallery"),
            onPressed: ()=> Navigator.pop(context, ImageSource.gallery),
          ),
          MaterialButton(
            child: Text("Camera"),
            onPressed: ()=> Navigator.pop(context, ImageSource.camera),
          )
        ],
      )
    );
    if (imageSource!=null){
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file != null){
        setState(()=> _pickedPicture=file);
      }
    }
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
      decoration: InputDecoration(hintText: 'Product Name',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final somepara= TextFormField(
      controller: amountText,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(hintText: 'Amount',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final PictureButton= Material (
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent,
      elevation: 5.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42,
        onPressed: _takepicture,
        color: Colors.lightBlueAccent,
        child: Text('Pick an Image', style: TextStyle(color: Colors.white)),
    )
    );

    final NextButton= Material (
      
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent,
      elevation: 5.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42,
        onPressed:(){
          int amountTrans= int.parse(amountText.text);
          Navigator.push(context,MaterialPageRoute(builder: (context)=> CheckoutPage(amountsGGTrans: amountTrans)));
        },
        color: Colors.lightBlueAccent,
        child: Text('Next', style: TextStyle(color: Colors.white)),
    )
    );

    final ChosenImage= Center(
      child: _pickedPicture==null?
      Text("No Image") :
      Image(image: FileImage(_pickedPicture)),
    );

    return Scaffold(
      
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        title: Text("Insurance", style:  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
            PictureButton,
            SizedBox(height: 12.0,),
            ChosenImage,
            SizedBox(height: 12.0,),
            NextButton
          ],
        ),),
    );
  }
}