import 'package:flutter/material.dart';
import 'constants.dart';



class Genderwidget extends StatelessWidget {
  Genderwidget({@required this.icon,@required this.gendername});
  final IconData icon;
  final String gendername;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox
          (
          height: 15.0,
        ),
        Text('$gendername', style: Klabeltextcard
        )
      ],
    );
  }
}