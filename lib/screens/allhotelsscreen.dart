import 'package:Service/main.dart';
import 'package:Service/models/palette.dart';
import 'package:Service/screens/hotelscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';

class AllHotelsScreen extends StatefulWidget {
  var route = '/all_hotels';
  @override
  _AllHotelsScreenState createState() => _AllHotelsScreenState();
}

class _AllHotelsScreenState extends State<AllHotelsScreen> {
  var strm;
  @override
  void initState() {
    super.initState();
    strm = FirebaseFirestore.instance.collection('hotels').snapshots();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: Drawer(),
            body: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
                //     height: ScreenUtil().setHeight(150),
                decoration: BoxDecoration(
                  color: palettecolor.secondary[800],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(ScreenUtil().setWidth(25)),
                    bottomRight: Radius.circular(ScreenUtil().setWidth(25)),
                  ),
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(20),
                        bottom: ScreenUtil().setHeight(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        Text(
                          'HOTELS',
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(5),
                        ),
                        Text(
                          'of your choice',
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                height: ScreenUtil().setHeight(40),
                                padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(10)),
                                child: FlatButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      //  Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => Home(1)));
                                    },
                                    child: Row(children: <Widget>[
                                      Icon(
                                        Icons.search,
                                        size: ScreenUtil().setWidth(30),
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(10),
                                        width: ScreenUtil().setWidth(5),
                                      ),
                                      Text(
                                        'Search',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: ScreenUtil().setSp(12)),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(10),
                                        width: ScreenUtil().setWidth(360) -
                                            ScreenUtil().setWidth(120) -
                                            ScreenUtil().setSp(14) * 6,
                                      ),
                                    ]))),
                            IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: palettecolor.secondary[800],
                                ),
                                onPressed: null),
                          ],
                        )
                      ],
                    )),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10),
                  right: ScreenUtil().setWidth(5),
                  left: ScreenUtil().setWidth(5),
                ),
                height: ScreenUtil().setHeight(690),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(15),
                    ),
                    StreamBuilder(
                        stream: strm,
                        builder: (ctx, dataSnapshot) {
                          if (dataSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final dataDocs = dataSnapshot.data.docs;
                          return Container(
                              height: ScreenUtil().setHeight(600),
                              child: ListView.builder(
                                  itemCount: dataDocs.length,
                                  itemBuilder: (ctx, index) => GestureDetector(
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ScreenUtil()
                                                            .setWidth(20))),
                                            elevation: 5,
                                            shadowColor:
                                                palettecolor.secondary[200],
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ScreenUtil()
                                                            .setWidth(20)),
                                              ),
                                              // height: ScreenUtil()
                                              //   .setHeight(130),
                                              padding: EdgeInsets.only(
                                                  top: ScreenUtil()
                                                      .setHeight(10),
                                                  bottom: ScreenUtil()
                                                      .setHeight(10),
                                                  //   right: ScreenUtil()
                                                  //     .setWidth(5),
                                                  left:
                                                      ScreenUtil().setWidth(5)),
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                        left: ScreenUtil()
                                                            .setWidth(20),
                                                        right: ScreenUtil()
                                                            .setWidth(40),
                                                      ),
                                                      child: Container(
                                                        padding: EdgeInsets.only(
                                                            right: ScreenUtil()
                                                                .setHeight(20)),
                                                        height: ScreenUtil()
                                                            .setHeight(90),
                                                        width: ScreenUtil()
                                                            .setWidth(125),
                                                        decoration: BoxDecoration(
                                                            color: palettecolor
                                                                .secondary[100],
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    ScreenUtil()
                                                                        .setWidth(
                                                                            20)),
                                                            image: DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: NetworkImage(
                                                                    dataDocs[index]
                                                                            .data()[
                                                                        'hotel_img_url']))),
                                                      )),
                                                  Column(children: <Widget>[
                                                    SizedBox(
                                                        height: ScreenUtil()
                                                            .setHeight(20)),
                                                    Container(
                                                        width: ScreenUtil()
                                                            .setWidth(150),
                                                        child: Text(
                                                            dataDocs[index]
                                                                .data()['name'],
                                                            style: GoogleFonts.lato(
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            16),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800))),
                                                    Container(
                                                      width: ScreenUtil()
                                                          .setWidth(150),
                                                      child: Text(
                                                          dataDocs[index]
                                                              .data()['city'],
                                                          style: GoogleFonts.lato(
                                                              color: Colors
                                                                  .grey[700],
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          10),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenUtil()
                                                          .setHeight(10),
                                                    ),
                                                    Container(
                                                        width: ScreenUtil()
                                                            .setWidth(150),
                                                        child: Text(
                                                            'Rs. ${dataDocs[index].data()['price']}',
                                                            style: GoogleFonts.lato(
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            12),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600))),
                                                    SizedBox(
                                                      height: ScreenUtil()
                                                          .setHeight(10),
                                                    ),
                                                    Container(
                                                      width: ScreenUtil()
                                                          .setWidth(150),
                                                      //              alignment: Alignment
                                                      //                .centerRight,
                                                      child: Text(
                                                          '${dataDocs[index].data()['rooms']} Room , ${dataDocs[index].data()['guests']} Guest',
                                                          style: GoogleFonts.lato(
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ),
                                                    SizedBox(
                                                      height: ScreenUtil()
                                                          .setHeight(10),
                                                    ),
                                                  ]),
                                                ],
                                              ),
                                            )),
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HotelScreen(dataDocs[index]
                                                        .data()['hotel id']))),
                                      )));
                        })
                  ],
                ),
              )
            ])));
  }
}
