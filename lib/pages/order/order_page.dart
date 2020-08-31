import 'package:FlutterElasticNavigationSidebar/pages/home/component/app_bar.dart';
import 'package:flutter/cupertino.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppbar(context, 'Order Page'),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Text('Order Page Content'),
        ),
      ],
    );
  }
}
