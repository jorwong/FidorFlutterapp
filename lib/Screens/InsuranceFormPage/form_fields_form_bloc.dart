import 'package:fidortry/Screens/checkoutPage/checkoutPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_bloc/form_bloc.dart';
import 'dart:io';

Future navigateToSubPage(context,int amount)async {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage(amount: amount)));
}

class FormFieldsExampleFormBloc extends FormBloc<String, String> {
  final textField = TextFieldBloc(
    validators: [FieldBlocValidators.requiredTextFieldBloc],
  );

  final textFieldamt = TextFieldBloc(
    validators: [FieldBlocValidators.requiredTextFieldBloc],
  );

  final booleanField = BooleanFieldBloc();
  final imageField = InputFieldBloc<File>();


  final selectField1 = SelectFieldBloc(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );

  final selectField2 = SelectFieldBloc(
    items: ['Option 1', 'Option 2'],
  );

  final multiSelectField = MultiSelectFieldBloc<String>(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        textField,
        textFieldamt,
        booleanField,
        selectField1,
        selectField2,
        multiSelectField,
      ];


  void Navigate(BuildContext context){
    navigateToSubPage(context, textFieldamt.valueToInt);
  }
  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    // Awesome logic...

    // Get the fields values:
    print(textField.value);
    print(booleanField.value);
    print(selectField1.value);
    print(selectField2.value);
    print(multiSelectField.value);
    
    await Future<void>.delayed(Duration(seconds: 2));
    yield state.toSuccess('Success');

    // yield `state.toLoaded()` because
    // you can't submit if the current state is `FormBlocSuccess`.
    // In most cases you don't need to do this,
    // because you only want to submit only once,
    // but in this case you want the user to submit more than once.
    // See: https://pub.dev/documentation/form_bloc/latest/form_bloc/FormBloc/onSubmitting.html
    yield state.toLoaded();
  }


}