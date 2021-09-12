import 'package:flutter/material.dart';

class CovPassAppBar extends StatelessWidget {
  CovPassAppBar(
      {required this.appbarColor, required this.title, required this.actions});

  final Color appbarColor;
  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Image.asset(
              'assets/logo.jpg',
              height: 45,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
            )
          ],
        ),
      ),
      backgroundColor: appbarColor,
      actions: actions,
    );
  }
}
