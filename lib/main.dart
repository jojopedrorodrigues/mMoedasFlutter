import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'View/Screen.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   

  SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moedas',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Screen(),
    );
  }
}
