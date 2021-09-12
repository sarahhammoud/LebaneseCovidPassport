import 'package:covpass/Constants.dart';
import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/AppBar%20Components/Appbar.dart';
import 'package:covpass/pages/Status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  void submit() async {
    try {
      await Firebase.initializeApp();
      UserCredential FBUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _username.text, password: _password.text);
      if (FBUser != null) {
        print('signed-in : ${FBUser.user!.uid}');
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('uid', FBUser.user!.uid);
        prefs.setBool('ln', true);
        DataBaseService db = new DataBaseService(uid: FBUser.user!.uid);
        await db.getData();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StatusPage(db: db)));
      }
    } catch (e) {
      print('ERROR : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CovPassAppBar(
          title: 'Lebanese \nCovid Passport',
          appbarColor: kGreenColor,
          actions: [],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.9,
          decoration: BoxDecoration(
            color: kDarkBlueColor,
            image: DecorationImage(
              image: AssetImage('assets/login-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * 0.35,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: width * 0.9,
                height: 50.0,
                child: TextField(
                  controller: _username,
                  cursorColor: Color(0xFF16C92F),
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Email / البريد الالكتروني',
                    contentPadding: EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: width * 0.9,
                height: 50.0,
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  cursorColor: Color(0xFF16C92F),
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Password / كلمة السر',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: RaisedButton(
                          child: Text('Login', style: TextStyle(fontSize: 18)),
                          color: Color(0xFF16C92F),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(14),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          onPressed: () {
                            submit();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
