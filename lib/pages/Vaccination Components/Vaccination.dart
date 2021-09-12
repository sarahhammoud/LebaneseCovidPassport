import 'package:covpass/models/databases/DataBase.dart';
import 'package:covpass/pages/Vaccination%20Components/NotVaccinated.dart';
import 'package:covpass/pages/Vaccination%20Components/VaccinationCard.dart';
import 'package:flutter/material.dart';

class VaccinationPage extends StatefulWidget {
  static const String id = 'vaccination_page';

  VaccinationPage({required this.db});
  final DataBaseService db;
  @override
  _VaccinationPageState createState() => _VaccinationPageState();
}

class _VaccinationPageState extends State<VaccinationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: widget.db.numberOfDoses == '0'
              ? NotVaccinated()
              : VaccinationCard(db: widget.db)),
    );
  }
}
