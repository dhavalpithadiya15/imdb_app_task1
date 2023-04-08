import 'package:flutter/material.dart';
import 'package:imbd_app_task/Screens/home_screen.dart';
import 'package:imbd_app_task/Screens/profile_screen.dart';
import 'package:imbd_app_task/Screens/search_screen.dart';
import 'package:imbd_app_task/Screens/vedio_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages=[HomeScreen(),SearchScreen(),VediosScreen(),ProfileScreen()];

  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentIndex=value;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_filled),
            ),BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.search),
            ),BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.video_camera_back_outlined),
            ),BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.person),
            )
          ],
        ),
        body: pages.elementAt(currentIndex),
      ),
    );
  }
}
