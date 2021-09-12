import 'package:covpass/Constants.dart';
import 'package:covpass/pages/Travel%20Components/TravelCardModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class TravelCard extends StatefulWidget {
  final TravelCardModel travelCardModel;

  TravelCard(this.travelCardModel);

  @override
  _TravelCardState createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  Widget breakLine() {
    return Container(
      height: 1,
      color: kDarkBlueColor,
    );
  }

  Widget row(String title, String field) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            title + ': ',
            style: TextStyle(
                color: kDarkBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            field,
            style: TextStyle(
                color: Color(0xFF0C1523),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: kDarkBlueColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
              ),
            ],
          ),
          child: Text(
            'Travel Info',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10),
          ]),
          child: Column(
            children: [
              row('Destination', widget.travelCardModel.destination),
              breakLine(),
              row('Travel Date', widget.travelCardModel.travelDate),
              breakLine(),
              row('Return Date', widget.travelCardModel.returnDate),
              breakLine(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Link(
                      uri: widget.travelCardModel.destination == 'Italy'
                          ? Uri.parse(
                              "https://edition.cnn.com/travel/article/italy-travel-covid-19/index.html")
                          : widget.travelCardModel.destination == 'Germany'
                              ? Uri.parse(
                                  "https://www.germany.info/us-en/covid-19/2321562")
                              : widget.travelCardModel.destination == 'Lebanon'
                                  ? Uri.parse(
                                      "https://www.diplomatie.gouv.fr/en/coming-to-france/coronavirus-advice-for-foreign-nationals-in-france/")
                                  : Uri.parse(
                                      "https://www.mea.com.lb/english/covid19-and-travel/travel-forms"),
                      builder: (context, followLink) {
                        return ElevatedButton(
                          onPressed: followLink,
                          child: Text(
                            'For more info about traveling to ' +
                                widget.travelCardModel.destination,
                            style: TextStyle(fontSize: 12),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
