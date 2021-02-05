import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'DetailVipHomePage.dart';


class CommonThings {
  static Size size;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("vipPub").getDocuments();
    return qn.documents;
  }

  navigateToInfo(DocumentSnapshot restaurant) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePageDetail(
                  restaurant: restaurant,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vip Pub",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("vipPub").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("loading....");
          }
          int length = snapshot.data.documents.length;
          //print("from the streamBuilder: "+ snapshot.data.documents[]);
          // print(length.toString() + " doc length");
          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: length,
            itemBuilder: (_, int index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                child: Material(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.hardLight),
                        child: GestureDetector(
                          onTap: () => navigateToInfo(doc),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: Image.network(
                              '${doc.data["res_image"]}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          doc.data["res_name"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            staggeredTileBuilder: (i) =>
                new StaggeredTile.count(2, i.isEven ? 2 : 3),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          );
        },
      ),
    );
  }
}

// Material(
// elevation: 8.0,
// borderRadius:
// new BorderRadius.all(new Radius.circular(8.0)),
// child: ColorFiltered(
// colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.hardLight),
// child: Hero(
// tag: resList,
// child: FadeInImage(
// image: NetworkImage(restoran.res_image_one),
// fit: BoxFit.fill,
// placeholder: AssetImage("assets/beerSignIn.png"),
// )),
// ),
// );
//
// height: MediaQuery.of(context).size.height,
// child: StreamBuilder<Event>(
//     stream: refRestaurant.onValue,
//     builder: (context, event) {
//       if (event.hasData) {
//         log("message");
//         var resList = List<Restaurant>();
//         print("list ${resList}");
//
//         var gelenDeyer = event.data.snapshot.value;
//         if (gelenDeyer != null) {
//           print("deyer ${gelenDeyer}");
//           gelenDeyer.forEach((key, nesne) {
//             var gelenRestaurant = Restaurant.fromJson(key, nesne);
//             resList.add(gelenRestaurant);
//             print("list ${resList}");
//           });
//         }
//         return StaggeredGridView.countBuilder(
//           shrinkWrap: true,
//           reverse: false,
//           padding: const EdgeInsets.all(8.0),
//           crossAxisCount: 4,
//           itemCount: resList.length,
//           itemBuilder: (context, index) {
//             var restoran = resList[index];
//             //String imgPath = wallpapersList[i].data['url'];
//             return Material(
//               borderRadius:  BorderRadius.circular(24.0),
//               child: Stack(
//                 children: [
//
//                   ColorFiltered(
//                     colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.hardLight),
//                     child: GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageDetail(restaurant: restoran,)));
//                       },
//                       child: Container(
//                         height: MediaQuery.of(context).size.height,
//                           child: Image.network(restoran.res_image_one,fit: BoxFit.fill,)),
//                     ),
//                   ),
//                   Center(
//                     child: Text(restoran.res_name,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                       fontSize: 32),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//
//                 ],
//               ),
//             );
//           },
//           staggeredTileBuilder: (i) =>
//               new StaggeredTile.count(2, i.isEven ? 2 : 3),
//           mainAxisSpacing: 8.0,
//           crossAxisSpacing: 8.0,
//         );
//       } else {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//     })),
