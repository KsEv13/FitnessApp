import 'package:flutter/material.dart';
import 'package:sport_app/constants.dart';
import 'package:sport_app/widgets/bottom_bar.dart';
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
      ),
      routes: {
        '/main': (context) => MainScreen(),
      },
      initialRoute: '/main',
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _widgetIndex = 0;

  static final List<Widget> _widgetObjects = <Widget>[
    Profile(),
    DailyPlan(),
    TrainingCalendar(),
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
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemSelected: (index) => onSelectTab(index),
          selectedIndex: _widgetIndex,
          items: [
            CustomBottomBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
            CustomBottomBarItem(
              icon: Icon(Icons.alarm),
              title: Text('Today'),
            ),
            CustomBottomBarItem(
              icon: Icon(Icons.calendar_month),
              title: Text('Calendar'),
            ),
          ],
        ));
  }
}
