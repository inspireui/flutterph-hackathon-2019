import 'package:flutter_web/material.dart';
import 'package:flutterph_hackathon2019/screens/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: DashboardScreen(),
    );
  }
}