import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AddPage.dart';
import 'AddGridviewDetail.dart';


class CommonThings {
  static Size size;
}


class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {


  TextEditingController phoneInputController;
  TextEditingController nameInputController;
  final db = Firestore.instance;

  String id;
  String name;
  String phone;
  String address;
  bool visible = false;


  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyInfoPage(
              ds: ds,
            )));
  }
  @override
  void setState(fn) {
    print("girdi");
    _sorgula();
    super.setState(fn);
  }
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Pub Cafeler',style: TextStyle(color: Colors.black),),
      ),
      body: StreamBuilder(
        stream: db.collection("colrecipes").where("visible",isEqualTo: true).snapshots() ,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ) {
            return CircularProgressIndicator();
          }
          int length = snapshot.data.documents.length;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: length,
            itemBuilder: (_, int index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];
              return  Container(
                padding: new EdgeInsets.all(3.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.7,
                  child: GestureDetector(
                    onTap: () => navigateToInfo(doc),
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          new Container(
                            padding: new EdgeInsets.all(5.0),
                            child: Image.network(
                              '${doc.data["image"]}' + '?alt=media',fit: BoxFit.fill,
                            ),
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    doc.data["name"],textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  onTap: () => navigateToInfo(doc),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
          Route route = MaterialPageRoute(builder: (context) => MyAddPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
  void _sorgula() async{
    print("girdi");
    db.collection("colrecipes").where("visible", isEqualTo: true).getDocuments();
  }
}
