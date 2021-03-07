import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class AuthenticationScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
          right: ScreenUtil().setWidth(20),
          left: ScreenUtil().setWidth(20),
        ),
      ),
    ));
  }
}
