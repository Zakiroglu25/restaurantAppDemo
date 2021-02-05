import 'package:beerbeertap/screen/set/SetAdd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonThings {
  static Size size;
}

class SetPage extends StatefulWidget {
  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {

  Widget divider() {
    return Divider(
      color: Colors.black,
    );
  }


  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Pub Cafeler',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("set").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          int length = snapshot.data.documents.length;
          return ListView.builder(
            itemCount: length,
            itemBuilder: (_, int index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];
              return Container(
                padding: new EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: new EdgeInsets.all(5.0),
                                child: Image.network(
                                  '${doc.data["image"]}' + '?alt=media',
                                  fit: BoxFit.fill,
                                ),
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width / 2,
                              ),
                              Container(
                                width: _screenSize.width * 0.4,
                              //  height: _screenSize,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(doc.data["set_desc"],style: TextStyle(
                                      fontSize: 16
                                    ),),
                                    // divider(),
                                    // Text("Cerez sayi - " +
                                    //     doc.data["cerez_count"],style: TextStyle(
                                    //     fontSize: 16
                                    // ),),
                                    // divider(),
                                    // Text("Address - " + doc.data["pub_address"],style: TextStyle(
                                    //     fontSize: 16
                                    // ),),
                                    // divider(),
                                    // Text("Pub Nomre - " + doc.data["number"],style: TextStyle(
                                    //     fontSize: 16
                                    // ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            color: Colors.black,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  doc.data["pub_name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21.0,
                                  ),
                                ),
                                //  onTap: () => navigateToInfo(doc),
                                Container(
                                    color: Colors.amber,
                                    width: 80,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        doc.data["set_price"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pive sayi - " + doc.data["beer_count"],style: TextStyle(
                                    fontSize: 16
                                ),),
                                divider(),
                                Text("Cerez sayi - " +
                                    doc.data["cerez_count"],style: TextStyle(
                                    fontSize: 16
                                ),),
                                divider(),
                                Text("Address - " + doc.data["pub_address"],style: TextStyle(
                                    fontSize: 16
                                ),),
                                divider(),
                                Text("Pub Nomre - " + doc.data["number"],style: TextStyle(
                                    fontSize: 16
                                ),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: RaisedButton(
                                      onPressed: () {
                                        launch((doc.data["number"]));
                                      },
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        "Zeng et",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                    height: 100,
                                    child: Image.asset("assets/beerSignIn.png")),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width / 3,
                                    child: RaisedButton(
                                      onPressed: () {
                                        launch(("tel//:"+doc.data["number"]));
                                      },
                                      color: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: Text(
                                        "Paylash",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => SetAdd());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
