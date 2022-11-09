import 'package:flutter/material.dart';
import 'package:sport_app/constants.dart';
import 'package:sport_app/widgets/pages/daily_plan.dart';
import 'package:sport_app/widgets/pages/profile.dart';
import 'package:sport_app/widgets/pages/training_calendar.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: kAppBarColor,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: kAppBarColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          )),
      routes: {
        '/main': (contex) => MainScreen(),
      },
      initialRoute: '/main',
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _widgetIndex = 0;
  static List<Widget> _widgetObjects = <Widget>[
    Profile(),
    TrainingCalendar(),
    DailyPlan()
  ];

  void onSelectTab(int index) {
    if (_widgetIndex == index) return;
    setState(() {
      _widgetIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FitnessApp'),
        ),
        body: Center(
          child: _widgetObjects[_widgetIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _widgetIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
          ],
          onTap: (index) => onSelectTab(index),
        ));
  }
}
