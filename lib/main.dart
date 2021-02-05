
import 'package:beerbeertap/screen/addPub/AddGridView.dart';
import 'package:beerbeertap/screen/homeVippage/HomePage.dart';
import 'package:beerbeertap/screen/set/Setler.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() async{
 // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MaterialApp(
    title: 'Page Routes',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 1;
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> allPages;
  HomePage homePage;
  MyListPage addPage;
  SetPage setPage;


  @override
  void initState() {
    super.initState();
    homePage = HomePage();
    addPage = MyListPage();
    setPage = SetPage();
    allPages = [homePage, addPage,setPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allPages[currentIndex],
      bottomNavigationBar:  BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        backgroundColor: Colors.amber.shade200,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/beerblack.svg',
                width: 25,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/beer.svg',
                width: 25,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Vip Pub")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/addicon.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/addicon.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Pub Extra")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/setler.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/setler.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              title: Text("Setler")),
        ],
      ),
    );
  }
}
