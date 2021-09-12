import 'package:covpass/models/databases/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Constants.dart';

class MyCovidStatusPage extends StatefulWidget {
  static const String id = 'my_covid_status_page';

  MyCovidStatusPage({required this.db});
  final DataBaseService db;

  @override
  _MyCovidStatusPageState createState() => _MyCovidStatusPageState();
}

class _MyCovidStatusPageState extends State<MyCovidStatusPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              color: widget.db.numberOfDoses == '0'
                  ? Colors.red
                  : widget.db.numberOfDoses == '1'
                      ? Colors.amberAccent
                      : kGreenColor,
              child: widget.db.numberOfDoses == '0'
                  ? Column(
                      children: [
                        Text(
                          "You're not vaccinated yet!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Icon(
                          FontAwesomeIcons.exclamationTriangle,
                          color: Colors.white,
                          size: 100,
                        )
                      ],
                    )
                  : QrImage(
                      data:
                          "https://covax.moph.gov.lb/impactmobile/vaccine/certificate?code=LELIOAECH0",
                      version: QrVersions.auto,
                      size: 250.0,
                      backgroundColor: widget.db.numberOfDoses == '0'
                          ? Colors.red
                          : widget.db.numberOfDoses == '1'
                              ? Colors.amberAccent
                              : kGreenColor,
                      foregroundColor: Colors.white,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: widget.db.numberOfDoses == '0'
                    ? Colors.red
                    : widget.db.numberOfDoses == '1'
                        ? Colors.amberAccent
                        : kGreenColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                    ),
                    Text(
                      widget.db.numberOfDoses == '0'
                          ? 'HIGH RISK'
                          : widget.db.numberOfDoses == '1'
                              ? 'MEDIUM RISK'
                              : 'LOW RISK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Color.fromRGBO(12, 21, 35, 1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        FontAwesomeIcons.user,
                        color: Colors.grey,
                        size: 20,
                        //icon
                      ),
                    ),
                    Text(
                      'My Covid-19 Status',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue.shade800,
                        radius: 10.0,
                        /*foregroundImage:
                                  AssetImage('assets/images/profile.jpeg'),*/
                      ),
                    ),
                    Text(
                      'Name: ' +
                          widget.db.firstName +
                          ' ' +
                          widget.db.fathersName +
                          ' ' +
                          widget.db.lastName +
                          '\nBirthday: ' +
                          widget.db.birthday,
                      textAlign: TextAlign.left,
                      style: covPassBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
