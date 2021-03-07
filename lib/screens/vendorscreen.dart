import 'package:Service/main.dart';
import 'package:Service/screens/productscreen.dart';
import 'package:Service/widgets/hotelfeatures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:google_fonts/google_fonts.dart';

class VendorScreen extends StatefulWidget {
  String vendorname;
  String vendorsub;
  String vendortag;
  final route = '/vendor';
  VendorScreen(this.vendorname, this.vendortag, this.vendorsub);
  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  TextStyle ss = GoogleFonts.lato(
      //    color: palettecolor.secondary[900],
      fontSize: ScreenUtil().setSp(12),
      fontWeight: FontWeight.w600);
  var strm;
  @override
  void initState() {
    super.initState();
    strm = FirebaseFirestore.instance.collection('products').snapshots();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                    widget.vendorname.toUpperCase(),
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Text(
                    widget.vendorsub.toUpperCase(),
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w300),
                  ),
                ]),
          )),
      StreamBuilder(
          stream: strm,
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final datad = dataSnapshot.data.docs;
            int cc = 0;
            for (int i = 0; i < datad.length; i++) {
              if (datad[i].data()['product_vendor'] == widget.vendortag) {
                cc++;
              }
            }
            return Container(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                height: ScreenUtil().setHeight(600),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cc,
                    itemBuilder: (ctx, index) => datad[index]
                                .data()['product_vendor'] ==
                            widget.vendortag
                        ? GestureDetector(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(20))),
                                elevation: 5,
                                shadowColor: palettecolor.secondary[200],
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(20)),
                                  ),
                                  // height: ScreenUtil()
                                  //   .setHeight(130),
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(10),
                                      bottom: ScreenUtil().setHeight(10)),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(20),
                                            right: ScreenUtil().setWidth(40),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                right:
                                                    ScreenUtil().setHeight(20)),
                                            height: ScreenUtil().setHeight(90),
                                            width: ScreenUtil().setWidth(125),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(datad[
                                                                index]
                                                            .data()[
                                                        'product_img_url']))),
                                          )),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            SizedBox(
                                                height:
                                                    ScreenUtil().setHeight(20)),
                                            Container(
                                                width:
                                                    ScreenUtil().setWidth(150),
                                                child: Text(
                                                    datad[index]
                                                        .data()['product_name'],
                                                    style: GoogleFonts.lato(
                                                        fontSize: ScreenUtil()
                                                            .setSp(18),
                                                        fontWeight:
                                                            FontWeight.w800))),
                                            SizedBox(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                            ),
                                            Container(
                                              width: ScreenUtil().setWidth(150),
                                              child: Row(children: <Widget>[
                                                Text(
                                                    'Rs. ${datad[index].data()['product_max_price']}',
                                                    style: GoogleFonts.lato(
                                                        color: Colors.red,
                                                        fontSize: ScreenUtil()
                                                            .setSp(14),
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  width:
                                                      ScreenUtil().setWidth(20),
                                                ),
                                                Text(
                                                    'Rs. ${datad[index].data()['product_sell_price']}',
                                                    style: GoogleFonts.lato(
                                                        color: Colors.green,
                                                        fontSize: ScreenUtil()
                                                            .setSp(14),
                                                        fontWeight:
                                                            FontWeight.w600))
                                              ]),
                                            ),
                                            SizedBox(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                            ),
                                            Container(
                                                width:
                                                    ScreenUtil().setWidth(150),
                                                child: Row(children: <Widget>[
                                                  Text(
                                                      ' ${datad[index].data()['product_weight']} gm',
                                                      style: GoogleFonts.lato(
                                                          fontSize: ScreenUtil()
                                                              .setSp(12),
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  SizedBox(
                                                    width: ScreenUtil()
                                                        .setWidth(20),
                                                  ),
                                                  IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .local_grocery_store_rounded,
                                                        size: 30,
                                                        color: palettecolor
                                                            .secondary,
                                                      ),
                                                      onPressed: null)
                                                ])),
                                            SizedBox(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                            ),
                                          ]),
                                    ],
                                  ),
                                )),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                        datad[index].data()['product_id']))),
                          )
                        : SizedBox()));
          }),
    ])));
  }
}
