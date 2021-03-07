import 'dart:async';
import 'package:Service/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox.expand(
          child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(100),
          ),
          Image.asset(
            'lib/assets/images/logo.png',
            height: ScreenUtil().setHeight(150),
            width: ScreenUtil().setHeight(150),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(100),
          ),
          SpinKitDoubleBounce(
            color: Colors.deepPurple,
          )
        ],
      )),
    ));
  }
}
