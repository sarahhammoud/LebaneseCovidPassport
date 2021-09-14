import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/AppBar%20Components/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../Constants.dart';

class PCRCertificatePage extends StatefulWidget {
  PCRCertificatePage({required this.db});
  final DataBaseService db;

  @override
  _PCRCertificatePageState createState() => _PCRCertificatePageState();
}

class _PCRCertificatePageState extends State<PCRCertificatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CovPassAppBar(
          title: 'PCR Test',
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
                'PCR Test Certificate',
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
                        size: 90.0,
                        backgroundColor: Colors.white,
                        foregroundColor: Color.fromRGBO(12, 21, 35, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFF16C92F),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'PCR Test Details:',
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
                          'Result: ' + widget.db.result,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Test Result reported by: ' + widget.db.laboratory,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Service Provided by: ' + widget.db.nurse,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Ct: ' + widget.db.ct,
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
