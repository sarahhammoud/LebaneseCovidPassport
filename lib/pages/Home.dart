import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/AppBar%20Components/Appbar.dart';
import 'package:covpass/pages/AppBar%20Components/EditProfile.dart';
import 'package:covpass/pages/Certificates/Certificates.dart';
import 'package:covpass/pages/MyCovidStatus.dart';
import 'package:covpass/pages/PCRTest.dart';
import 'package:covpass/pages/Travel%20Components/Travel.dart';
import 'package:covpass/pages/Vaccination%20Components/Vaccination.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import 'AppBar Components/Settings.dart';
import 'Welcome.dart';

final String uid = FirebaseAuth.instance.currentUser!.uid;
final DataBaseService database = new DataBaseService(uid: uid);

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  HomePage({required this.db});
  final DataBaseService db;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  DataBaseService database = new DataBaseService(uid: uid);
  @override
  void initState() {
    super.initState();
    database = widget.db;
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

  List<Widget> _widgetOption() => [
        PCRTestPage(db: widget.db),
        VaccinationPage(db: widget.db),
        MyCovidStatusPage(db: widget.db),
        TravelPage(db: widget.db),
        CertificatePage(db: widget.db)
      ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOption = _widgetOption();
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
      backgroundColor: Colors.white,
      body: widgetOption[_selectedIndex],
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(12, 21, 35, 1.0),
          unselectedItemColor: Colors.white,
          selectedItemColor: Color.fromRGBO(22, 201, 47, 1.0),
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/pcr-icon.png')),
              title: Text('PCR Test'),
              backgroundColor: Color.fromRGBO(12, 21, 35, 1.0),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/vaccine-icon.png')),
              title: Text('Vaccination'),
              backgroundColor: Color.fromRGBO(12, 21, 35, 1.0),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/virus-icon.png')),
              title: Text('My Covid\nStatus', textAlign: TextAlign.center),
              backgroundColor: Color.fromRGBO(12, 21, 35, 1.0),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/travel-icon.png')),
              title: Text('Travel'),
              backgroundColor: Color.fromRGBO(12, 21, 35, 1.0),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/certificate-icon.png')),
              title: Text('Certificate'),
              backgroundColor: Color.fromRGBO(12, 21, 35, 1.0),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
