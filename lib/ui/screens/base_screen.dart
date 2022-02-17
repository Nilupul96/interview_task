import 'package:flutter/material.dart';
import 'package:interview_task/styles.dart';
import 'package:interview_task/ui/screens/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    Key? key,
  }) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen()
  ];
  int? _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex!],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex!,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black.withOpacity(0.3),
        selectedItemColor: DefaultBlueColor,
        onTap: onTabTapped,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.send_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),
    );
  }
}
