import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import "package:fidortry/Screens/InsuranceFormPage/form_fields_form_bloc.dart";
import 'package:fidortry/Screens/InsuranceFormPage/widgets.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fidortry/Screens/checkoutPage/checkoutPage.dart';
import 'dart:io';

Future navigateToSubPage(context, int amount) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => CheckoutPage(amount: amount)));
}

class FormFieldsExampleForm extends StatelessWidget {
  static String tag = 'Insuranceformpage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormFieldsExampleFormBloc>(
      builder: (context) => FormFieldsExampleFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<FormFieldsExampleFormBloc>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Phone Insurance'),
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.grey,
            body: Card(
              margin: EdgeInsets.all(20),
              elevation: 5,
              child:
                  FormBlocListener<FormFieldsExampleFormBloc, String, String>(
                onSubmitting: (context, state) => LoadingDialog.show(context),
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);
                  Notifications.showSnackBarWithSuccess(
                      context, state.successResponse);
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);
                  Notifications.showSnackBarWithError(
                      context, state.failureResponse);
                },
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    TextFieldBlocBuilder(
                      textFieldBloc: formBloc.textField,
                      decoration: InputDecoration(
                        labelText: 'IPhone-XR 256GB',
                        prefixText: 'IPhone-XR 256GB',
                        prefixIcon: Icon(Icons.phone_iphone),
                      ),
                      errorBuilder: (context, error) {
                        switch (error) {
                          case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                            return 'You must write amazing text.';
                            break;
                          default:
                            return 'This text is nor valid.';
                        }
                      },
                    ),
                    ImageFieldBlocBuilder(
                      fileFieldBloc: formBloc.imageField,
                      formBloc: formBloc,
                    ),
                    TextFieldBlocBuilder(
                      textFieldBloc: formBloc.textFieldamt,
                      decoration: InputDecoration(
                        labelText: 'Amount Paid',
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                      errorBuilder: (context, error) {
                        switch (error) {
                          case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                            return 'You must write amazing text.';
                            break;
                          default:
                            return 'This text is nor valid.';
                        }
                      },
                    ),
                    DropdownFieldBlocBuilder<String>(
                      selectFieldBloc: formBloc.selectField1,
                      decoration: InputDecoration(
                        labelText: 'DropdownFieldBlocBuilder',
                        prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                      ),
                      itemBuilder: (context, value) => value,
                    ),
                    CheckboxFieldBlocBuilder(
                      booleanFieldBloc: formBloc.booleanField,
                      body: Text('I assure you, the information is correct.'),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10)),
                            height: 35,
                            minWidth: 125,
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                              elevation: 5,
                              textColor: Colors.white,
                              color: Colors.green,
                              onPressed: () {
                                formBloc.submit;
                                formBloc.Navigate(context);
                              },
                              child: Center(child: Text('SUBMIT')),
                            ),
                          ),
                          SizedBox(width: 10),
                          ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10)),
                            height: 35,
                            minWidth: 125,
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                              elevation: 5,
                              textColor: Colors.white,
                              color: Colors.red,
                              onPressed: formBloc.clear,
                              child: Center(child: Text('CLEAR')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageFieldBlocBuilder extends StatelessWidget {
  final FormBloc formBloc;
  final InputFieldBloc<File> fileFieldBloc;
  const ImageFieldBlocBuilder({
    Key key,
    @required this.formBloc,
    @required this.fileFieldBloc,
  })  : assert(formBloc != null),
        assert(fileFieldBloc != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormBlocState>(
      bloc: formBloc,
      builder: (context, formState) {
        return BlocBuilder<InputFieldBloc<File>, InputFieldBlocState<File>>(
          bloc: fileFieldBloc,
          builder: (context, fieldState) {
            return Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      elevation: 16,
                      color: fieldState.value != null
                          ? Colors.grey[700]
                          : Colors.white,
                      child: Opacity(
                        opacity: formState.canSubmit ? 1 : 0.5,
                        child: fieldState.value != null
                            ? Image.file(
                                fieldState.value,
                                height: 120,
                                width: 120,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                height: 120,
                                width: 120,
                                child: Icon(
                                  Icons.add_photo_alternate,
                                  color: Colors.black87,
                                  size: 70,
                                ),
                              ),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor:
                              Theme.of(context).accentColor.withAlpha(50),
                          highlightColor:
                              Theme.of(context).accentColor.withAlpha(50),
                          borderRadius: BorderRadius.circular(60),
                          onTap: formState.canSubmit
                              ? () async {
                                  final image = await ImagePicker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  if (image != null) {
                                    fileFieldBloc.updateValue(image);
                                  }
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: fieldState.canShowError ? 30 : 0,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 8),
                        Text(
                          'Please select an Image',
                          style: TextStyle(
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
