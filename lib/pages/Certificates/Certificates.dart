import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/Certificates/PCRCertificate.dart';
import 'package:covpass/pages/Certificates/VaccinationCertificate.dart';
import 'package:flutter/material.dart';

class CertificatePage extends StatefulWidget {
  static const String id = 'certificate_page';

  CertificatePage({required this.db});
  final DataBaseService db;
  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/status-background.jpg'),
        fit: BoxFit.cover,
      )),
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 275,
            ),
            Text(
              'Certificate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Color.fromRGBO(12, 21, 35, 1.0),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  'Vaccination Certificate',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VaccinationCertificatePage(db: widget.db),
                      ));
                },
                color: Color.fromRGBO(12, 21, 35, 1.0),
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  'PCR Test Certificate',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PCRCertificatePage(db: widget.db),
                      ));
                },
                color: Color.fromRGBO(12, 21, 35, 1.0),
                textColor: Colors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
