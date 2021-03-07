import 'package:Service/main.dart';
import 'package:Service/screens/allhotelsscreen.dart';
import 'package:Service/screens/allvendorsscreen.dart';
import 'package:Service/widgets/homeservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class HomeScreen extends StatefulWidget {
  final route = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Drawer(),
      body: Container(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10),
          right: ScreenUtil().setWidth(5),
          left: ScreenUtil().setWidth(5),
        ),
        height: ScreenUtil().setHeight(690),
        child: ListView(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(40),
              decoration: BoxDecoration(
                  color: palettecolor.primary,
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Builder(
                      builder: (context) => IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer())),
                  Text(
                    'HOME',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: palettecolor.primary,
                      ),
                      onPressed: null),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            Container(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10),
                right: ScreenUtil().setWidth(10),
                left: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setHeight(10),
              ),
              width: ScreenUtil().setHeight(340),
              // height: ScreenUtil().setHeight(130),
              decoration: BoxDecoration(
                color: palettecolor.primary[100],
                // borderRadius:
                //   BorderRadius.circular(ScreenUtil().setHeight(30))
              ),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.food_bank_rounded,
                      color: palettecolor.primary[600],
                    ),
                    Text(
                      'PRODUCTS',
                      style: TextStyle(
                          color: palettecolor.primary[600],
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Container(
                    height: ScreenUtil().setHeight(10) +
                        ScreenUtil().setWidth(60) +
                        ScreenUtil().setSp(10),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ServiceIcon(
                              Icons.local_grocery_store_rounded,
                              'Grocery',
                              () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllVendorsScreen()))),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.electrical_services_rounded,
                              'Electrician', null),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.dry_cleaning, 'Dry Clean', null),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.car_repair, 'Car Repair', null),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.bike_scooter, 'Bike Rent', null)
                        ]))
              ]),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(300),
              child: Container(
                color: palettecolor.secondary[100],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            Container(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10),
                right: ScreenUtil().setWidth(10),
                left: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setHeight(10),
              ),
              //  height: ScreenUtil().setHeight(130),
              decoration: BoxDecoration(
                color: palettecolor.primary[100],
                // borderRadius:
                //   BorderRadius.circular(ScreenUtil().setHeight(30))
              ),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.settings_applications_rounded,
                      color: palettecolor.primary[600],
                    ),
                    Text(
                      'SERVICES',
                      style: TextStyle(
                          color: palettecolor.primary[600],
                          fontSize: ScreenUtil().setSp(14),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Container(
                    width: ScreenUtil().setWidth(340),
                    height: ScreenUtil().setHeight(10) +
                        ScreenUtil().setWidth(60) +
                        ScreenUtil().setSp(10),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ServiceIcon(
                              Icons.hotel,
                              'Hotel',
                              () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllHotelsScreen()))),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.electrical_services_rounded,
                              'Electrician', null),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.dry_cleaning, 'Dry Clean', null),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.car_repair, 'Car Repair', null),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          ServiceIcon(Icons.bike_scooter, 'Bike Rent', null)
                        ]))
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
