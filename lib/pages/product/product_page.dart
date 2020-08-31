import 'package:FlutterElasticNavigationSidebar/pages/home/component/app_bar.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppbar(context, 'Product Page'),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Text('Product Page Content'),
        ),
      ],
    );
  }
}
