// import 'package:beerbeertap/screen/HomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FlatButton(onPressed: () {}, child: Text("Qeydiyyat")),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(22, 30, 0, 0),
//               child: Text(
//                 "Xoş gəlmisiniz",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(22, 20, 0, 25),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.5,
//                 child: Text(
//                   "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
//                   style: TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.bold, height: 1.8),
//                 ),
//               ),
//             ),
//             Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(40.0),
//                       topLeft: Radius.circular(40.0)),
//                   color: Colors.white,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(22, 45, 22, 0),
//                       child: Container(
//                         height: 60,
//                         child: TextField(
//                           decoration: InputDecoration(
//                               hintText: "istifadeci adi",
//                               filled: true,
//                               fillColor: Colors.blueGrey[50],
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                   borderRadius: BorderRadius.circular(40))),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
//                       child: Container(
//                         height: 90,
//                         child: TextField(
//                           decoration: InputDecoration(
//                               hintText: "Sifre",
//                               filled: true,
//                               fillColor: Colors.blueGrey[50],
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none,
//                                   borderRadius: BorderRadius.circular(40))),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                             onTap: () {
//                               print("forgot");
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(0, 0, 22, 0),
//                               child: Text(
//                                 "Sifreni unutmusan?",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             )),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(22, 22, 0, 0),
//                       child: SizedBox(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width / 1.1,
//                         child: RaisedButton(
//                           onPressed: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
//                           },
//                           color: Colors.black,
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(40.0),
//                           ),
//                           child: Text(
//                             "Daxil Ol",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(22, 80, 0, 0),
//                       child: SizedBox(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width / 1.1,
//                         child: RaisedButton(
//                           onPressed: () {},
//                           color: Colors.white,
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(40.0),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset("assets/google.png"),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 120),
//                                 child: Text(
//                                   "Google ile daxil Ol",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(22, 22, 0, 0),
//                       child: SizedBox(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width / 1.1,
//                         child: RaisedButton(
//                           onPressed: () {},
//                           color: Colors.white,
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(40.0),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset("assets/face.png"),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 100),
//                                 child: Text(
//                                   "Facebook ile daxil Ol",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//
//     }
//   }
//
