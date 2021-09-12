class CPUser {
  final String firstName;
  final String fathersName;
  final String lastName;
  final String birthday;
  final String id;
  final String email;
  final String vaccine;
  final String hospital;
  final String firstDoseDate;
  final String secondDoseDate;
  final String numberOfDoses;
  final String certificate;
  final String result;
  final String ct;
  final String laboratory;
  final String nurse;

  CPUser(
      {required this.firstName,
      required this.fathersName,
      required this.lastName,
      required this.birthday,
      required this.id,
      required this.email,
      required this.vaccine,
      required this.hospital,
      required this.firstDoseDate,
      required this.secondDoseDate,
      required this.numberOfDoses,
      required this.certificate,
      required this.ct,
      required this.laboratory,
      required this.nurse,
      required this.result});
}
