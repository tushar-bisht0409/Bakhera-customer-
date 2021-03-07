import 'package:Service/main.dart';
import 'package:Service/widgets/hotelfeatures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelScreen extends StatefulWidget {
  String hotelId;
  final route = '/hotel';
  HotelScreen(this.hotelId);
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  TextStyle ss = GoogleFonts.lato(
      //    color: palettecolor.secondary[900],
      fontSize: ScreenUtil().setSp(12),
      fontWeight: FontWeight.w600);
  var strm;
  @override
  void initState() {
    super.initState();
    strm = FirebaseFirestore.instance
        .collection('hotels')
        .doc(widget.hotelId)
        .snapshots();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: StreamBuilder(
          stream: strm,
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final datad = dataSnapshot.data;
            return Stack(
              children: <Widget>[
                Container(
                    alignment: Alignment.topCenter,
                    height: ScreenUtil().setHeight(690),
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(10),
                                      left: ScreenUtil().setWidth(10)),
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: palettecolor.secondary[800],
                                            size: 25,
                                          ),
                                          onPressed: () =>
                                              Navigator.of(context).pop()))),
                              Container(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(50),
                                      bottom: ScreenUtil().setHeight(50)),
                                  child: Text(datad.data()['name'],
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(24),
                                          fontWeight: FontWeight.w800))),
                            ]),
                        height: ScreenUtil().setHeight(200),
                        width: ScreenUtil().setWidth(360),
                        decoration: BoxDecoration(
                            //   color: palettecolor.secondary[100],
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.7),
                                    BlendMode.dstATop),
                                image: AssetImage(
                                  'lib/assets/images/hotel.png',
                                ))))),
                Positioned(
                    top: ScreenUtil().setHeight(180),
                    child: Container(
                      width: ScreenUtil().setWidth(360),
                      height: ScreenUtil().setHeight(500),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ScreenUtil().setWidth(25)),
                          topRight: Radius.circular(ScreenUtil().setWidth(25)),
                        ),
                      ),
                      child: ListView(
                        children: <Widget>[
                          Container(
                              padding:
                                  EdgeInsets.all(ScreenUtil().setHeight(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Per Night',
                                    style: ss,
                                  ),
                                  Text(
                                    'Rs. ${datad.data()['price']}',
                                    style: ss,
                                  )
                                ],
                              )),
                          Container(
                            height: ScreenUtil().setHeight(1),
                            width: ScreenUtil().setWidth(360),
                            color: Colors.grey[300],
                          ),
                          Container(
                              padding:
                                  EdgeInsets.all(ScreenUtil().setHeight(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Hotel Features',
                                    style: GoogleFonts.lato(
                                      fontSize: ScreenUtil().setSp(14),
                                      fontWeight: FontWeight.w600,
                                      //   color: palettecolor.secondary[900]
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(
                                          ScreenUtil().setHeight(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          datad.data()['wifi'] == true
                                              ? HotelFeatures(
                                                  Icons.wifi, 'Free Wifi')
                                              : SizedBox(),
                                          datad.data()['ac'] == true
                                              ? HotelFeatures(
                                                  Icons.ac_unit_rounded, 'A/C')
                                              : SizedBox(),
                                          datad.data()['dining'] == true
                                              ? HotelFeatures(
                                                  Icons.dinner_dining, 'Dining')
                                              : SizedBox(),
                                        ],
                                      )),
                                  Container(
                                      padding: EdgeInsets.all(
                                          ScreenUtil().setHeight(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          datad.data()['parking'] == true
                                              ? HotelFeatures(
                                                  Icons.local_parking_rounded,
                                                  'Parking')
                                              : SizedBox(),
                                          datad.data()['breakfast'] == true
                                              ? HotelFeatures(
                                                  Icons.breakfast_dining,
                                                  'Breakfast')
                                              : SizedBox(),
                                          datad.data()['tv'] == true
                                              ? HotelFeatures(Icons.tv, 'T.V')
                                              : SizedBox(),
                                        ],
                                      )),
                                  Container(
                                    height: ScreenUtil().setHeight(1),
                                    width: ScreenUtil().setWidth(360),
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setHeight(10)),
                                    child: Text(
                                      'Location  :   ${datad.data()['city']}',
                                      style: GoogleFonts.lato(
                                        fontSize: ScreenUtil().setSp(14),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ))
              ],
            );
          }),
    ));
  }
}
