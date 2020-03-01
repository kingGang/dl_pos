import 'package:flutter/material.dart';
import '../pages/home/home.dart';
import '../pages/mrket/mrket.dart';
import '../pages/mine/mine.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key, int index}) : super(key: key);

  @override
  _TabsState createState({int index = 0}) => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [Home(), Mrket(), Mine()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("POS客户端"),
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff4380F1),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: this._pageList[this._currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          type: BottomNavigationBarType.fixed, //支持多个显示
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), title: Text("销售单")),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity), title: Text("我的")),
          ]),
    );
  }
}
