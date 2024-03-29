import 'package:flutter/material.dart';
import 'package:malayalajalakam/providers/file_manager.dart';
import 'package:malayalajalakam/providers/malayalam_manager.dart';
import 'package:malayalajalakam/providers/unicode_manager.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MalayalamManager(),
    ),
    ChangeNotifierProvider(
      create: (_) => UnicodeManager(),
    ),
    ChangeNotifierProvider(
      create: (_) => FileManager(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MalayalaJalakam',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
            ),
          ),
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 30.0, fontFamily: 'Indulekha'),
            displayMedium: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontFamily: 'NotoSansMalayalam',
            ),
          )),
      home: HomePage(),
    );
  }
}
