import 'package:covpass/Constants.dart';
import 'package:flutter/material.dart';

import 'Appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _oldPassword = new TextEditingController();
  TextEditingController _newPassword = new TextEditingController();
  TextEditingController _confirmpass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CovPassAppBar(
          title: 'Settings',
          actions: [],
          appbarColor: kDarkBlueColor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/status-background.jpg'),
          fit: BoxFit.cover,
        )),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.all(45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _oldPassword,
                      obscureText: true,
                      cursorColor: Color(0xFF16C92F),
                      decoration: InputDecoration(
                        hintText: 'Old Password',
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _newPassword,
                      obscureText: true,
                      cursorColor: Color(0xFF16C92F),
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _confirmpass,
                      obscureText: true,
                      cursorColor: Color(0xFF16C92F),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 30, left: 55, right: 55),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(22, 21, 47, 1.0),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.3,
                              ),
                            ),
                          ),
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
    );
  }
}
