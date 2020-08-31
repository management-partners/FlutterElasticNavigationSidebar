import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/app_bar.dart';

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppbar(context, 'Home Page'),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Text('Home Page Content'),
        ),
      ],
    );
  }
}
