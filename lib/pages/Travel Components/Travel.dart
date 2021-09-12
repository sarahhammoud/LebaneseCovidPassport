import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/models/databases/DataSource.dart';
import 'package:covpass/pages/Travel%20Components/TravelCard.dart';
import 'package:covpass/pages/Travel%20Components/TravelDialog.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  static const String id = 'travel_page';

  TravelPage({required this.db});
  final DataBaseService db;

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: travelCards.length,
        itemBuilder: (BuildContext context, int index) {
          return TravelCard(travelCards[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          setState(
            () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TravelDialog();
                },
              ).then((_) => setState(() {}));
            },
          );
        },
      ),
    );
  }
}
