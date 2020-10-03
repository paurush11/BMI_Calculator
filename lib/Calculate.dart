import 'package:flutter/material.dart';
import 'constants.dart';

class Calculate extends StatelessWidget {
  Calculate({@required this.onpress,@required this.Value});
  final Function onpress;
  final String Value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(top: 10),
      color: Color(KBottomColor),
      width: double.infinity,
      height: KBottomContainerHeight,
      child: GestureDetector(
        onTap: onpress,
        child: Center(
            child: Text(Value , style: KCalculateButtonStyle)
        ),
      ),
    );
  }
}