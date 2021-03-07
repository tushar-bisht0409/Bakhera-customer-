import 'package:Service/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class HotelFeatures extends StatelessWidget {
  String nameof;
  var iconn;
  HotelFeatures(this.iconn, this.nameof);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Icon(
        iconn,
        size: 25,
        color: palettecolor.secondary,
      ),
      SizedBox(
        height: ScreenUtil().setHeight(3),
      ),
      Text(
        nameof,
        style: TextStyle(fontSize: ScreenUtil().setSp(12)),
      )
    ]);
  }
}
