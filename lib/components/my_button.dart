import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;
  final Function onPress;
  final Color menuColor;

  MyButton(
      {this.text,
      this.iconData,
      this.textSize,
      this.height,
      this.onPress,
      this.menuColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: menuColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: menuColor, fontSize: textSize),
          ),
        ],
      ),
      onPressed: onPress,
    );
  }
}
