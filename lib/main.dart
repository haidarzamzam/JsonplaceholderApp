import 'package:case_devido/app.dart';
import 'package:case_devido/utils/endpoint.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  App.configure(apiBaseURL: Endpoint.baseURL, appTitle: 'Github App');

  await App().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
