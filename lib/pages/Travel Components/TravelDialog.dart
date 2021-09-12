import 'package:covpass/Constants.dart';
import 'package:covpass/models/databases/DataSource.dart';
import 'package:covpass/pages/Travel%20Components/TravelCardModel.dart';
import 'package:flutter/material.dart';

class TravelDialog extends StatefulWidget {
  @override
  _TravelDialogState createState() => _TravelDialogState();
}

class _TravelDialogState extends State<TravelDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _travelDate = new TextEditingController();
  TextEditingController _returnDate = new TextEditingController();
  String _destination = 'Lebanon';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: kGreenColor,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: kGreenColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('Add Travel',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        //height: 50,
                        child: Text(
                          'Country ',
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: DropdownButton<String>(
                          value: _destination,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: kDarkBlueColor),
                          underline: Container(
                            height: 2,
                            color: kGreenColor,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _destination = newValue!;
                            });
                          },
                          items: <String>[
                            'Lebanon',
                            'Italy',
                            'France',
                            'Germany'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        child: Text(
                          'Travel Date ',
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          controller: _travelDate,
                          cursorColor: kGreenColor,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                          onTap: () async {
                            var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1800),
                              lastDate: DateTime(2022),
                              errorFormatText: 'Enter valid date',
                              errorInvalidText: 'Enter date in valid range',
                            );
                            _travelDate.text = date.toString().substring(0, 10);
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        //height: 50,
                        child: Text(
                          'Return Date',
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          controller: _returnDate,
                          cursorColor: kGreenColor,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                          onTap: () async {
                            var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1800),
                              lastDate: DateTime(2022),
                              //initialDatePickerMode: DatePickerMode.year, //
                              errorFormatText: 'Enter valid date',
                              errorInvalidText: 'Enter date in valid range',
                            );
                            _returnDate.text = date.toString().substring(0, 10);
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonTheme(
                          minWidth: 50.0,
                          height: 2.0,
                          child: RaisedButton(
                              child:
                                  Text('Add', style: TextStyle(fontSize: 16)),
                              color: kDarkBlueColor,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              onPressed: () {
                                setState(() {
                                  TravelCardModel t = TravelCardModel(
                                      destination: _destination,
                                      travelDate: _travelDate.text,
                                      returnDate: _returnDate.text);
                                  travelCards.add(t);
                                  Navigator.of(context).pop();
                                });
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
