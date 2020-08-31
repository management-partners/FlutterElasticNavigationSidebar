import 'package:FlutterElasticNavigationSidebar/pages/home/component/app_bar.dart';
import 'package:flutter/cupertino.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppbar(context, 'History Page'),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Text('History Page Content'),
        ),
      ],
    );
  }
}
