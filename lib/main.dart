import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/pages/dashboard.dart';

void main() => runApp(HackathonApp());

class HackathonApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter PH Hackathon 2019',
      theme: ThemeData(
        fontFamily: 'FontTheme',
        primarySwatch: Colors.blue,
      ),
      home: HackathonScreen(),
    );
  }
}

class HackathonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashboardPage();
  }
}
