import 'package:flutter/material.dart';

Align buildAppbar(BuildContext context, String name) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.orange),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
