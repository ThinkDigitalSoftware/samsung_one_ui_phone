import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:samsung_one_ui_phone/keypad.dart';

class PhoneHome extends StatefulWidget {
  @override
  _PhoneHomeState createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  int bottomNavigationBarIndex = 0;
  PageController pageController = PageController();

  bool showBottomNavigationBar = true;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 180 * 4.0,
          width: 90 * 4.0,
          child: Scaffold(
              body: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: <Widget>[
                  Keypad(
                    showBottomNavigationBar: (value) {
                      if (showBottomNavigationBar != value) {
                        setState(() {
                          showBottomNavigationBar = value;
                        });
                      }
                    },
                  ),
                  NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          expandedHeight: 300,
                          floating: false,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            stretchModes: [StretchMode.fadeTitle],
                            collapseMode: CollapseMode.parallax,
                            title: Text('Phone'),
                            titlePadding: EdgeInsets.all(10),
                          ),
                        )
                      ];
                    },
                    body: Text('Body'),
                  )
                ],
              ),
              bottomNavigationBar: AnimatedOpacity(
                opacity: showBottomNavigationBar ? 1 : 0,
                duration: Duration(milliseconds: 100),
                child: BottomNavigationBar(
                  currentIndex: bottomNavigationBarIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: Container(), title: Text('Keypad')),
                    BottomNavigationBarItem(
                      icon: Container(),
                      title: Text('Recents'),
                    ),
                    BottomNavigationBarItem(
                      icon: Container(),
                      title: Container(
                        child: Text('Contacts'),
                        decoration: BoxDecoration(shape: BoxShape.rectangle),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Container(),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Places'),
                      ),
                    ),
                  ],
                  selectedFontSize: 14.0,
                  unselectedFontSize: 14,
                  selectedLabelStyle: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dotted,
                    color: Colors.green,
                  ),
                  onTap: (index) {
                    setState(() {
                      bottomNavigationBarIndex = index;
                    });
                  },
                ),
              )),
        ),
      ],
    );
  }
}
