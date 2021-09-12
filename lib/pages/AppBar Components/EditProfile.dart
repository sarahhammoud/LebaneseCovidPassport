import 'package:flutter/material.dart';

import '../../Constants.dart';
import 'Appbar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  final dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CovPassAppBar(
          title: 'Settings',
          actions: [],
          appbarColor: kDarkBlueColor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/status-background.jpg'),
          fit: BoxFit.cover,
        )),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0C1523),
                      ),
                    ),
                    TextField(
                      controller: _username,
                      cursorColor: Color(0xFF16C92F),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0C1523),
                      ),
                    ),
                    TextField(
                      controller: _email,
                      cursorColor: Color(0xFF16C92F),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0C1523),
                      ),
                    ),
                    TextField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xFF16C92F),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0C1523),
                      ),
                    ),
                    TextField(
                      controller: dateController,
                      cursorColor: Color(0xFF16C92F),
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(hintText: 'Pick your Date'),
                      onTap: () async {
                        var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1800),
                          lastDate: DateTime(2022),
                          errorFormatText: 'Enter valid date',
                          errorInvalidText: 'Enter date in valid range',
                        );
                        dateController.text = date.toString().substring(0, 10);
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(22, 21, 47, 1.0),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Update Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
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
