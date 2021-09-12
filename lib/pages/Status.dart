import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/AppBar%20Components/Appbar.dart';
import 'package:covpass/pages/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import 'AppBar Components/EditProfile.dart';
import 'AppBar Components/Settings.dart';
import 'Welcome.dart';

final CollectionReference vaccinationDataCollection =
    FirebaseFirestore.instance.collection('VaccinationData');
final String uid = FirebaseAuth.instance.currentUser!.uid;

class StatusPage extends StatefulWidget {
  StatusPage({required this.db});
  final DataBaseService db;
  static const String id = 'status_page';

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    XFile? xFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    final path = xFile!.path;
    final bytes = await File(path).readAsBytes();
    final img.Image? image = img.decodeImage(bytes);
    setState(() {
      File _image = image as File;
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      File _image = image as File;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void choiceAction(String choice) {
    if (choice == settings) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ),
      );
    } else if (choice == EditProfile) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditProfilePage(),
        ),
      );
    } else if (choice == LogOut) {
      logout();
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ln', false);
    print('ln is set to false');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CovPassAppBar(
          title: 'Lebanese \nCovid Passport',
          appbarColor: kDarkBlueColor,
          actions: [
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return choices.map(
                  (String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  },
                ).toList();
              },
            ),
          ],
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height * 0.2,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Welcome ' + widget.db.firstName + '!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 40.0),

                //TODO: solve image problem
                /*Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        //_showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFF16C92F),
                        child: path != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(105),
                                child: Image.file(
                                  File(path),
                                  width: 190,
                                  height: 190,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(105)),
                                width: 190,
                                height: 190,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 45,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),*/
                SizedBox(height: 30.0),
                Text(
                  'Stay Home, Stay Safe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonTheme(
                  minWidth: width * 0.7,
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('View My Covid Status',
                          style: TextStyle(fontSize: 22)),
                      color: kGreenColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(db: widget.db),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
