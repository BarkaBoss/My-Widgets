import 'package:flutter/material.dart';
import 'package:my_widgets/screens/drag_target.dart';
import 'package:my_widgets/screens/empty.dart';
import 'package:my_widgets/screens/home.dart';
import 'package:my_widgets/screens/animated_item.dart';
import 'package:my_widgets/screens/yoga_lady.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DragToTarget(),
    );
  }
}

