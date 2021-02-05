import 'dart:io';

import 'package:beerbeertap/main.dart';
import 'package:beerbeertap/screen/set/Setler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

File image;

class SetAdd extends StatefulWidget {
  @override
  _SetAddState createState() => _SetAddState();
}

class _SetAddState extends State<SetAdd> {
  final _text = TextEditingController();
  bool _validate = false;

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String beer_count;
  String cerez_count;
  String number;
  String pub_address;
  String pub_name;
  String set_desc;
  String set_price;
  bool visible;

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
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
      DocumentReference ref = await db.collection('set').add({
        'beer_count': '$beer_count',
        'cerez_count': '$cerez_count',
        'number': '$number',
        'pub_address': '$pub_address',
        'pub_name': '$pub_name',
        'set_desc': '$set_desc',
        'visible': '$visible',
        'set_price': '$set_price Azn',
        'image': '$fullPathImage'
      });
      setState(() => id);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyApp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(
          "Set Elave Et",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  new Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black),
                    ),
                    padding: new EdgeInsets.all(20.0),
                    child: image == null ? Text('Resim') : Image.file(image),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      width: 90,
                      height: 90,
                      child: IconButton(
                        icon: new Icon(Icons.image),
                        onPressed: pickerGallery,
                        iconSize: 33,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                "Restoran haqqinda",
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: _text,
                    decoration: InputDecoration(
                      errorText: _validate ? "Bu xana bos qala bilmez" : null,
                      errorStyle: TextStyle(
                        color: Colors.black
                      ),
                      border: InputBorder.none,
                      hintText: 'Restoran adi',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => pub_name = value,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    decoration: InputDecoration(
                      errorText: _validate ? "Bu xana bos qala bilmez" : null,
                      errorStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: InputBorder.none,
                      hintText: 'Restoran Adresi',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => pub_address = value,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: _validate ? "Bu xana bos qala bilmez" : null,
                      errorStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: InputBorder.none,
                      hintText: 'Restoran Nomresi',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => number = value,
                  ),
                ),
              ),
              Text(
                "Pive ve Cerez sayi",
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: _validate ? "Bu xana bos qala bilmez" : null,
                      errorStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: InputBorder.none,
                      hintText: 'Pive Sayi',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => beer_count = value,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: _validate ? "Bu xana bos qala bilmez" : null,
                      errorStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: InputBorder.none,
                      hintText: 'Cerez Sayi',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => cerez_count = value,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                "Set e daxil olan,Cerezler",
                style: TextStyle(fontSize: 22),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    minLines: 10,
                    maxLines: 15,
                    autocorrect: false,
                    decoration: InputDecoration(
                      errorText: _validate ? "Bu xana bos qala bilmez" : null,
                      errorStyle: TextStyle(
                          color: Colors.black
                      ),
                      hintText: 'Sete daxil olan cerezler',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => set_desc = value,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: _validate ? "Bu xana bos qala bilmez" : null,
                      errorStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: InputBorder.none,
                      hintText: 'Set Qiymeti',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    onSaved: (value) => set_price = value,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 22, 0, 22),
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            if(image != null){
                              createData();
                              _text.text.isEmpty ? _validate = true : _validate = false;
                            }
                          });
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> MapPage()));
                        },
                        color: Colors.black,
                        elevation: 10,
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
        ),
      ),
    );
  }
}
