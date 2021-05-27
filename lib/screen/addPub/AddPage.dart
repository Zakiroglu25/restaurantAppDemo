import 'dart:io';
import 'package:beerbeertap/screen/addPub/AddGridView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../main.dart'; //formateo hora

File image;
String filename;

class CommonThings {
  static Size size;
}

class MyAddPage extends StatefulWidget {
  @override
  _MyAddPageState createState() => _MyAddPageState();
}

class _MyAddPageState extends State<MyAddPage> {
  TextEditingController recipeInputController;
  TextEditingController nameInputController;
  TextEditingController imageInputController;
  bool _isDialogShowing = false;

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String address;
  String cabinet;
  String phone_number;
  String sosial_network;
  String desc;
  bool visible;

  pickerCam() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  void createData() async {
    visible = false;
    DateTime now = DateTime.now();
    String nuevoformato = DateFormat('kk:mm:ss:MMMMd').format(now);
    var fullImageName = 'nomfoto-$nuevoformato' + '.jpg';
    var fullImageName2 = 'nomfoto-$nuevoformato' + '.jpg';

    final StorageReference ref =
    FirebaseStorage.instance.ref().child(fullImageName);
    final StorageUploadTask task = ref.putFile(image);

    var part1 =
        'https://firebasestorage.googleapis.com/v0/b/beerbeer-46b3d.appspot.com/o/';
    var fullPathImage = part1 + fullImageName2;
    //  print(fullPathImage);

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('colrecipes').add({
        'name': '$name',
        'address': '$address',
        'cabinet': '$cabinet',
        'phone_number': '$phone_number',
        'sosial_network': '$sosial_network',
        'desc': '$desc',
        'visible': '$visible',
        'image': '$fullPathImage'
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Elave Et'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.blueAccent),
                      ),
                      padding: new EdgeInsets.all(5.0),
                      child: image == null ? Text('Add') : Image.file(image),
                    ),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.camera_alt), onPressed: pickerCam),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.image), onPressed: pickerGallery),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Restoran Adi *',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Zehmet olmasa Xanani Doldurun';
                        }
                      },
                      onSaved: (value) => name = value,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Addres *',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Zehmet olmasa Xanani Doldurun';
                        }
                      },
                      onSaved: (value) => address = value,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Kapinet meselen  "Var *',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Zehmet olmasa Xanani Doldurun';
                        }
                      },
                      onSaved: (value) => cabinet = value,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tel: 050 000 00 00 *',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Zehmet olmasa Xanani Doldurun';
                        }
                      },
                      onSaved: (value) => phone_number = value,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Sosial Shebeke Linki',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      onSaved: (value) => sosial_network = value,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Etrafli Melumat',
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                      onSaved: (value) => desc = value,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.7,
                  child: RaisedButton(
                    onPressed: () {
                      createData();
                      _showDialog();
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> MapPage()));
                    },
                    color: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      "Yadda Saxla",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showDialog() {
    _isDialogShowing = true; // set it `true` since dialog is being displayed
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Elaniniz yoxlanimasi ucun Qeyde Alind"),
          actions: <Widget>[
            FlatButton(
              child: Text("Elani Yersleshdir"),
              onPressed: () {
                _isDialogShowing = false; // set it `false` since dialog
                Navigator.of(context).pop();
                setState(() => id);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            )
          ],
        );
      },
    );
  }
}
