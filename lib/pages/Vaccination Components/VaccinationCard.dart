import 'package:covpass/models/databases/DataBase.dart';
import 'package:flutter/material.dart';

class VaccinationCard extends StatefulWidget {
  VaccinationCard({required this.db});
  final DataBaseService db;

  @override
  _VaccinationCardState createState() => _VaccinationCardState();
}

class _VaccinationCardState extends State<VaccinationCard> {
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
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 230,
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Color(0xFF0C1523),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 10),
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 17, left: 17, bottom: 17, right: 5),
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10.0,
                            foregroundImage: AssetImage('assets/logo.jpg'),
                          ),
                        ),
                        Container(
                          height: 90,
                          child: VerticalDivider(
                            color: Color(0xFF16C92F),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Covid-19 ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          height: 1.2),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'VACC History ',
                                        style: TextStyle(
                                            color: Color(0xFF16C92F),
                                            fontSize: 19),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Name:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.db.firstName +
                                            ' ' +
                                            widget.db.lastName,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Vaccine:',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.db.vaccine,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Color(0xFF16C92F),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Vaccinated by: ' + widget.db.hospital,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Date of first dose: ' + widget.db.firstDoseDate,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Date of second dose: ' + widget.db.secondDoseDate,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                        ],
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
