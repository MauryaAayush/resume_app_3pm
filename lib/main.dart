import 'package:flutter/material.dart';
import 'package:resume_app_3pm/screens/home/view/home_screen.dart';

void main()
{
  runApp(ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomeScreen(),
      },
    );
  }
}
