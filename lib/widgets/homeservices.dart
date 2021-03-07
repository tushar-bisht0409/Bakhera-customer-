import 'package:Service/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class ServiceIcon extends StatelessWidget {
  String nameof;
  var iconn;
  var onpres;
  ServiceIcon(this.iconn, this.nameof, this.onpres);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(
          radius: ScreenUtil().setWidth(30),
          backgroundColor: Colors.white,
          child: IconButton(
              icon: Icon(
                iconn,
                color: palettecolor.primary,
              ),
              onPressed: onpres)),
      SizedBox(
        height: ScreenUtil().setHeight(3),
      ),
      Text(
        nameof,
        style: TextStyle(
            color: palettecolor.primary, fontSize: ScreenUtil().setSp(10)),
      )
    ]);
  }
}
