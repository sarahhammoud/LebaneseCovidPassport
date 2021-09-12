import 'package:covpass/Constants.dart';
import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/AppBar%20Components/Appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Status.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'sign_up_page';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _firstName = new TextEditingController();
  TextEditingController _fatherName = new TextEditingController();
  TextEditingController _lastName = new TextEditingController();
  TextEditingController _phoneNumber = new TextEditingController();
  TextEditingController _nationalId = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirmPassword = new TextEditingController();
  final dateController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit() async {
    try {
      //FireBase Initializer
      await Firebase.initializeApp();

      UserCredential FBUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
      print('signed-up : ${FBUser.user!.uid}');

      //FireCloud Data Adding.
      DataBaseService db = new DataBaseService(uid: FBUser.user!.uid);
      db.addUser(
          _firstName.text,
          _fatherName.text,
          _lastName.text,
          dateController.text,
          _phoneNumber.text,
          _nationalId.text,
          _email.text);

      await db.getData();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StatusPage(db: db)));
    } catch (e) {
      print('ERROR : $e');
    }
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    if (value.length < 3) {
      return 'Minimum 3 Characters Required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    if (value.length < 6) {
      return 'Minimum 6 Characters Required';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    if (value.length < 8) {
      return 'Minimum 6 Digits Required';
    }
    return null;
  }

  String? validateNationalIdNumber(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    if (value.length < 8) {
      return 'Minimum 12 Digits Required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  void passwordsValidation() {
    if (_password.text == _confirmPassword.text) {
      submit();
    } else {
      final snackBar = SnackBar(
        content: const Text('Passwords Mis-match!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CovPassAppBar(
          title: 'Create Account',
          appbarColor: kDarkBlueColor,
          actions: [],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                //padding: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: validateName,
                        controller: _firstName,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'First Name - الاسم',
                          labelStyle: labelTextStyle,
                        ),
                      ),
                      TextFormField(
                        validator: validateName,
                        controller: _fatherName,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Father's name - اسم الاب",
                          labelStyle: labelTextStyle,
                        ),
                      ),
                      TextFormField(
                        validator: validateName,
                        controller: _lastName,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'Last name - الشهرة',
                          labelStyle: labelTextStyle,
                        ),
                      ),
                      TextFormField(
                        controller: dateController,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Pick your Date',
                          labelText: 'Birthday - تاريخ ميلادك',
                          labelStyle: labelTextStyle,
                        ),
                        readOnly: true,
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1800),
                            lastDate: DateTime(2022),
                            //initialDatePickerMode: DatePickerMode.year, //
                            errorFormatText: 'Enter valid date',
                            errorInvalidText: 'Enter date in valid range',
                          );
                          dateController.text =
                              date.toString().substring(0, 10);
                        },
                        textAlign: TextAlign.center,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: validatePhoneNumber,
                        controller: _phoneNumber,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'Phone No - رقم الهاتف',
                          labelStyle: labelTextStyle,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: validateNationalIdNumber,
                        controller: _nationalId,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'National ID No - رقم الهوية الوطنية',
                          labelStyle: labelTextStyle,
                        ),
                      ),
                      TextFormField(
                        validator: validateEmail,
                        controller: _email,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'Email - البريد الالكتروني',
                          labelStyle: labelTextStyle,
                        ),
                      ),
                      TextFormField(
                        validator: validatePassword,
                        controller: _password,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'Password - كلمة السر',
                          labelStyle: labelTextStyle,
                        ),
                        obscureText: true,
                      ),
                      TextFormField(
                        controller: _confirmPassword,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password - تأكيد كلمة السر',
                          labelStyle: labelTextStyle,
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ButtonTheme(
                        minWidth: 175.0,
                        child: RaisedButton(
                          child: Text('Submit', style: TextStyle(fontSize: 16)),
                          color: kDarkBlueColor,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          onPressed: () {
                            passwordsValidation();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
