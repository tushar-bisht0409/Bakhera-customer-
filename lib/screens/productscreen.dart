import 'package:Service/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  var route = '/product';
  String productId;
  ProductScreen(this.productId);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var strm;
  int pquantity = 0;
  @override
  void initState() {
    super.initState();
    strm = FirebaseFirestore.instance
        .collection('products')
        .doc(widget.productId)
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
                              alignment: Alignment.topLeft,
                              child: Padding(
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
                              height: ScreenUtil().setHeight(300),
                              width: ScreenUtil().setWidth(360),
                              decoration: BoxDecoration(
                                  //   color: palettecolor.secondary[100],
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.7),
                                          BlendMode.dstATop),
                                      image: NetworkImage(
                                        datad.data()['product_img_url'],
                                      ))))),
                      Positioned(
                          top: ScreenUtil().setHeight(280),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(10),
                                left: ScreenUtil().setWidth(20),
                                right: ScreenUtil().setWidth(20)),
                            width: ScreenUtil().setWidth(360),
                            height: ScreenUtil().setHeight(500),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(ScreenUtil().setWidth(25)),
                                topRight:
                                    Radius.circular(ScreenUtil().setWidth(25)),
                              ),
                            ),
                            child: ListView(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                Container(
                                    width: ScreenUtil().setWidth(150),
                                    child: Text(datad.data()['product_name'],
                                        style: GoogleFonts.lato(
                                            fontSize: ScreenUtil().setSp(22),
                                            fontWeight: FontWeight.w800))),
                                            Container(child: Row(children: <Widget>[
                                              
                                            ],),)
                                            ]),
                                SizedBox(
                                  height: ScreenUtil().setHeight(15),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: ScreenUtil().setWidth(150),
                                      child: Row(children: <Widget>[
                                        Text(
                                            'Rs. ${datad.data()['product_max_price']}',
                                            style: GoogleFonts.lato(
                                                color: Colors.red,
                                                fontSize:
                                                    ScreenUtil().setSp(18),
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          width: ScreenUtil().setWidth(20),
                                        ),
                                        Text(
                                            'Rs. ${datad.data()['product_sell_price']}',
                                            style: GoogleFonts.lato(
                                                color: Colors.green,
                                                fontSize:
                                                    ScreenUtil().setSp(18),
                                                fontWeight: FontWeight.w600))
                                      ]),
                                    ),
                                    Text(
                                        ' ${datad.data()['product_weight']} gm',
                                        style: GoogleFonts.lato(
                                            fontSize: ScreenUtil().setSp(16),
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(20),
                                ),
                                Container(
                                  height: ScreenUtil().setHeight(1),
                                  width: ScreenUtil().setWidth(360),
                                  color: Colors.grey[300],
                                ),
                              ],
                            ),
                          ))
                    ],
                  );
                })));
  }
}
