//import 'package:Service/screens/homescreen.dart';
import 'package:Service/models/palette.dart';
import 'package:Service/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

Palette palettecolor = Palette();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return LayoutBuilder(builder: (_, BoxConstraints constraint) {
      ScreenUtil.init(constraint,
          designSize: Size(360, 690), allowFontScaling: false);
      return FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, appSnapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Scaffold(
                body: SplashScreen(),
              ),
            );
          });
    });
  }
}
