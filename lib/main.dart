import 'package:flutter/material.dart';
import 'pages/plan_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PlanPage(),
    );
  }
}