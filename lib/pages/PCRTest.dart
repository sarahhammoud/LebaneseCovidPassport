import 'package:covpass/models/databases/DataBase.dart';
import 'package:flutter/material.dart';

class PCRTestPage extends StatefulWidget {
  static const String id = 'pcr_test_page';

  PCRTestPage({required this.db});
  final DataBaseService db;

  @override
  _PCRTestPageState createState() => _PCRTestPageState();
}

class _PCRTestPageState extends State<PCRTestPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
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
                              radius: 15.0,
                              foregroundImage: AssetImage('assets/logo.jpg'),
                            ),
                          ),
                          Container(
                            height: 94,
                            child: VerticalDivider(
                              thickness: 1.5,
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
                                            fontSize: 20,
                                            height: 1.2),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'PCR Test ',
                                          style: TextStyle(
                                              color: Color(0xFF16C92F),
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Name',
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
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Result',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.db.result,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
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
                              'Sample taken in: ' + widget.db.result,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.5),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'CT: ' + widget.db.ct,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.5),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Reported by: ' + widget.db.laboratory,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.5),
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
      ),
    );
  }
}
