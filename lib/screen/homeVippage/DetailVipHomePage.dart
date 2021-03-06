import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'mapVip.dart';

class HomePageDetail extends StatefulWidget {
  final DocumentSnapshot restaurant;

  HomePageDetail({this.restaurant});

  @override
  _HomePageDetailState createState() => _HomePageDetailState();
}

class _HomePageDetailState extends State<HomePageDetail> {
  String productImage;
  String id;
  String name;
  String recipe;

  @override
  void initState() {
    super.initState();
    productImage = widget.restaurant.data["res_image"];
    print(productImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.network(
                  productImage,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 240.0),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 25, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.restaurant["res_name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
                        child: Text(widget.restaurant["res_about"]),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 30, 18, 0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.black,
                            elevation: 4,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                  child: Text(
                                    " Adress :" +
                                        widget.restaurant["res_address"],
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                  child: Text(
                                    " Telefon Nomresi :" +
                                        widget.restaurant["res_phone_number"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                  child: Text(
                                    " Kabinet: " +
                                        widget.restaurant["res_cabinet"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                  child: Text(
                                    " Pub Acilma Vaxti: " +
                                        widget.restaurant["open_res"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  child: Text(
                                    " Pub Baglanma Vaxti: " +
                                        widget.restaurant["close_res"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 22, 0, 0),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.7,
                              child: RaisedButton(
                                onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> MapsPage()));
                                },
                                color: Colors.black,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Xeriteden bax",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 22, 0, 0),
                            child: SizedBox(
                              height: 60,
                              child: RaisedButton(
                                onPressed: () {
                                  launch(widget.restaurant["res_phone_number"]);
                                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=> MapPage()));
                                  print("basildi");
                                },
                                color: Colors.amber,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Zeng et",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
