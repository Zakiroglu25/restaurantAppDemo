import 'package:beerbeertap/auth/LoginPage.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: SizedBox(
                width: 140, child: Image.asset("assets/beerSignIn.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "BeerBeerTap",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Kicik pub cafe applikasiyasi",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),

          Column(
            children: [

              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0)),
                  color: Colors.amber,
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 60, 0, 0),
                      child: Text(
                        "Xoş gəlmisiniz",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 20, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Text(
                          "Əgər Qeydiyyatdan keçmisinizsə,"
                              "Daxil ol düymısini seçərək daxil ola bilərsiniz."
                              "Əgər qeydiyyatınız yoxdursa Abunə ol düyməsini klikliyərək, daxil ola bilərsinizi ",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,height: 1.8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 180,
                            child: RaisedButton(onPressed: (){
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                            },color: Colors.black,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Text("Daxil Ol",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 180,
                            child: RaisedButton(onPressed: (){},color: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Text("Abune Ol",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
