import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/AppBar%20Components/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants.dart';

class VaccinationCertificatePage extends StatefulWidget {
  VaccinationCertificatePage({required this.db});
  final DataBaseService db;

  @override
  _VaccinationCertificatePageState createState() =>
      _VaccinationCertificatePageState();
}

class _VaccinationCertificatePageState
    extends State<VaccinationCertificatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CovPassAppBar(
          title: 'Vaccination',
          actions: [],
          appbarColor: kDarkBlueColor,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.jpg',
                  height: 120,
                  width: 80,
                ),
              ),
              Text(
                'Covid-19 Vaccine Certificate',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  color: Color.fromRGBO(12, 21, 35, 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Color(0xFF16C92F),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Beneficiary Details:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name: ' + widget.db.lastName,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'First Name: ' + widget.db.firstName,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Date of Birth: ' + widget.db.birthday,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'National ID: ' + widget.db.id,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      child: QrImage(
                        data: widget.db.certificate,
                        version: QrVersions.auto,
                        size: 99,
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromRGBO(12, 21, 35, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
              widget.db.certificate != ''
                  ? Column(
                      children: [
                        Text(
                          'Click on this link:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          child: Text(
                            widget.db.certificate,
                            textAlign: TextAlign.center,
                          ),
                          onTap: () => launch(widget.db.certificate),
                        ),
                        SizedBox(height: 20)
                      ],
                    )
                  : SizedBox(height: 1),
              Container(
                color: Color(0xFF16C92F),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Vaccination Details:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vaccination Name: ' + widget.db.vaccine,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'First Dose Given in: ' + widget.db.firstDoseDate,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Second Dose Given in: ' + widget.db.secondDoseDate,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Vaccinated By: ' + widget.db.hospital,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
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
