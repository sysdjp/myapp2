import 'package:flutter/material.dart';
import 'package:myapp2/view/account/account_page.dart';
import 'package:myapp2/view/time_line/post_page.dart';
import 'package:myapp2/view/time_line/time_line_page.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectindex = 0;
  List<Widget> pageList = [
    TimeLinePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectindex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_outlined), label: 'Account'),
          ],
          currentIndex: selectindex,
          onTap: (index) {
            setState(() {
              selectindex = index;
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostPage()));
        },
      ),
    );
  }
}
