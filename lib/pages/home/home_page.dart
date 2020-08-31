import 'package:FlutterElasticNavigationSidebar/components/drawer_painter.dart';
import 'package:FlutterElasticNavigationSidebar/components/my_button.dart';
import 'package:FlutterElasticNavigationSidebar/pages/history/history_page.dart';
import 'package:FlutterElasticNavigationSidebar/pages/home/home_content_page.dart';
import 'package:FlutterElasticNavigationSidebar/pages/order/order_page.dart';
import 'package:FlutterElasticNavigationSidebar/pages/product/product_page.dart';
import 'package:FlutterElasticNavigationSidebar/pages/profile/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];

  bool isMenuOpen = false;

  Widget loading = HomeContentPage();
  String pageName = '';
  Color menuColor = Colors.white;

  @override
  void initState() {
    limits = [0, 0, 0, 0, 0, 0];
    WidgetsBinding.instance.addPostFrameCallback(getPosition);
    super.initState();
  }

  getPosition(duration) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit - start) / 5;
    limits = [];
    for (double x = start; x <= contLimit; x = x + step) {
      limits.add(x);
    }
    setState(() {
      limits = limits;
    });
  }

  double getSize(int x) {
    double size =
        (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 25 : 20;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.6;
    double menuContainerHeight = mediaQuery.height / 2;

    switch (pageName) {
      case 'Home':
        loading = HomeContentPage();
        break;
      case 'Profile':
        loading = ProfilePage();
        break;
      case 'Product':
        loading = ProductPage();
        break;
      case 'Order':
        loading = OrderPage();
        break;
      case 'History':
        loading = HistoryPage();
        break;
      default:
        loading = HomeContentPage();
        break;
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 65, 108, 1.0),
                Color.fromRGBO(255, 75, 73, 1.0)
              ],
            ),
          ),
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              Center(
                child: loading,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1500),
                left: isMenuOpen ? 0 : -sidebarSize + 20,
                top: 0,
                curve: Curves.elasticOut,
                child: SizedBox(
                  width: sidebarSize,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.localPosition.dx <= sidebarSize) {
                        setState(() {
                          _offset = details.localPosition;
                        });
                      }

                      if (details.localPosition.dx > sidebarSize - 20 &&
                          details.delta.distanceSquared > 2) {
                        setState(() {
                          isMenuOpen = true;
                        });
                      }
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _offset = Offset(0, 0);
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(sidebarSize, mediaQuery.height),
                          painter: DrawerPainter(offset: _offset),
                        ),
                        Container(
                          // height: mediaQuery.height,
                          // color: Colors.red[100],
                          width: sidebarSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                height: mediaQuery.height * 0.25,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pageName = 'Home';
                                            isMenuOpen = false;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          "assets/icons/user.svg",
                                          width: sidebarSize / 2,
                                        ),
                                      ),
                                      Text(
                                        "User Name",
                                        style: TextStyle(color: menuColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              Container(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: <Widget>[
                                    MyButton(
                                      text: "Profile",
                                      iconData: Icons.person,
                                      textSize: getSize(0),
                                      menuColor: menuColor,
                                      height: (menuContainerHeight) / 5,
                                      onPress: () {
                                        setState(() {
                                          pageName = 'Profile';
                                          isMenuOpen = false;
                                        });
                                      },
                                    ),
                                    MyButton(
                                      text: "Product",
                                      iconData: Icons.portrait,
                                      menuColor: menuColor,
                                      textSize: getSize(1),
                                      height: (menuContainerHeight) / 5,
                                      onPress: () {
                                        setState(() {
                                          pageName = 'Product';
                                          isMenuOpen = false;
                                        });
                                      },
                                    ),
                                    MyButton(
                                      text: "Order",
                                      iconData: Icons.shopping_bag,
                                      menuColor: menuColor,
                                      textSize: getSize(2),
                                      height: (mediaQuery.height / 2) / 5,
                                      onPress: () {
                                        setState(() {
                                          pageName = 'Order';
                                          isMenuOpen = false;
                                        });
                                      },
                                    ),
                                    MyButton(
                                      text: "History",
                                      iconData: Icons.history,
                                      menuColor: menuColor,
                                      textSize: getSize(3),
                                      height: (menuContainerHeight) / 5,
                                      onPress: () {
                                        setState(() {
                                          pageName = 'History';
                                          isMenuOpen = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // button close sidebar
                        // AnimatedPositioned(
                        //   duration: Duration(milliseconds: 400),
                        //   right: (isMenuOpen) ? 10 : sidebarSize,
                        //   bottom: 30,
                        //   child: IconButton(
                        //     enableFeedback: true,
                        //     icon: Icon(
                        //       Icons.keyboard_backspace,
                        //       color: Colors.black45,
                        //       size: 30,
                        //     ),
                        //     onPressed: () {
                        //       this.setState(() {
                        //         isMenuOpen = false;
                        //       });
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
