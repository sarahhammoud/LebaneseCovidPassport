import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

class NotVaccinated extends StatefulWidget {
  const NotVaccinated({Key? key}) : super(key: key);

  @override
  _NotVaccinatedState createState() => _NotVaccinatedState();
}

class _NotVaccinatedState extends State<NotVaccinated> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 110, left: 30, right: 30),
                alignment: Alignment.center,
                //width: 300,
                height: 50,
                color: Color.fromRGBO(12, 21, 35, 1.0),
                child: Text(
                  'Vaccination',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 150,
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 10),
                  ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'OOPS!! Not Vaccinated',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.timesCircle,
                        color: Colors.red,
                        size: 50,
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          width: width * 0.7,
          margin: const EdgeInsets.only(top: 30),
          child: Link(
            uri: Uri.parse("https://covax.moph.gov.lb/impactmobile/vaccine"),
            builder: (context, followLink) {
              return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(22, 21, 47, 1.0)),
                ),
                onPressed: followLink,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'More Information About\nVaccination in Lebanon',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
