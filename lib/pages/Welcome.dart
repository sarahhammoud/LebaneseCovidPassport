import 'package:covpass/Constants.dart';
import 'package:covpass/pages/Login.dart';
import 'package:covpass/pages/SignUp.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcome_page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //TODO: animation screen before welcome
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome-background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.5,
              ),
              Container(
                child: Text(
                  'Welcome to the Lebanese Covid Passport',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    height: 1.3,
                    color: kDarkBlueColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                padding: const EdgeInsets.all(30.0),
              ),
              SizedBox(
                height: 15,
              ),
              ButtonTheme(
                minWidth: 230.0,
                height: 30.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RaisedButton(
                    child:
                        Text('Create Account', style: TextStyle(fontSize: 18)),
                    //new Image.asset(name),

                    color: kDarkBlueColor,
                    textColor: kGreenColor,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                  ),
                ),
              ),
              Container(child: SizedBox(height: 20.0)),
              ButtonTheme(
                minWidth: 230.0,
                height: 30.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RaisedButton(
                    child: Text('Log in', style: TextStyle(fontSize: 18)),
                    color: kDarkBlueColor,
                    textColor: kGreenColor,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
