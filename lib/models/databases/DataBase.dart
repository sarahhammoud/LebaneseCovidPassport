import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseService {
  final String uid;
  String firstName = '';
  String fathersName = '';
  String lastName = '';
  String birthday = '';
  String phoneNumber = '';
  String id = '';
  String email = '';
  String vaccine = '';
  String hospital = '';
  String numberOfDoses = '';
  String firstDoseDate = '';
  String secondDoseDate = '';
  String certificate = '';
  String ct = '';
  String date = '';
  String laboratory = '';
  String result = '';
  DataBaseService({required this.uid});

  //Collection Reference
  final CollectionReference VaccinationDataCollcetion =
      FirebaseFirestore.instance.collection('VaccinationData');

  Future addUser(String firstName, String fathersName, String lastName,
      String birthday, String phoneNumber, String id, String email) async {
    return await FirebaseFirestore.instance
        .collection('VaccinationData')
        .doc(uid)
        .set({
      'First Name': firstName,
      'Father Name': fathersName,
      'Last Name': lastName,
      'Birthday': birthday,
      'Phone': phoneNumber,
      'ID': id,
      'Email': email,
      'Number Of Doses': 0,
      'First Dose Date': '',
      'Second Dose Date': '',
      'Hospital': '',
      'Vaccine': '',
      'Certificate': '',
      'Result': '',
      'CT': '',
      'Laboratory': '',
      'Date': '',
    });
  }

  Future<void> getData() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("VaccinationData")
        .doc(firebaseUser!.uid)
        .get()
        .then((value) {
      firstName = value.data()!["First Name"];
      lastName = value.data()!["Last Name"];
      fathersName = value.data()!["Father Name"];
      email = value.data()!["Email"];
      birthday = value.data()!["Birthday"];
      id = value.data()!["ID"];
      vaccine = value.data()!["Vaccine"];
      hospital = value.data()!["Hospital"];
      firstDoseDate = value.data()!["First Dose Date"];
      secondDoseDate = value.data()!["Second Dose Date"];
      numberOfDoses = value.data()!["Number Of Doses"].toString();
      phoneNumber = value.data()!["Phone"];
      certificate = value.data()!["Certificate"];
      ct = value.data()!["CT"];
      result = value.data()!["Result"];
      date = value.data()!["Date"];
      laboratory = value.data()!["Laboratory"];
    });
  }
}
