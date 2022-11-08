import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_premmob/halaman_utama/komponen/nav-drawer.dart';
import 'package:project_premmob/halaman_utama/page_menu/soal.dart';
import 'package:project_premmob/halaman_utama/komponen/menu.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_premmob/halaman_utama/page_menu/belajar.dart';
import 'package:project_premmob/halaman_utama/page_menu/diskusi.dart';
import 'package:project_premmob/halaman_utama/page_menu/komunitas.dart';
import 'package:project_premmob/restApi/berita_new.dart';
import '../login_register/komponen/accountcheck.dart';
import '../restApi/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailPage(),
    );
  }
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String font = 'Baloo 2';

    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 0.9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        key: _scaffoldKey,
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          ),
          backgroundColor: Color.fromRGBO(1, 180, 220, 1),
          elevation: 3,
          title: Text(
            "   Cendekia",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
              fontFamily: font,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
        ),
      ),
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: ImageSlideshow(
                indicatorColor: Colors.blue,
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                },
                autoPlayInterval: 50000,
                isLoop: true,
                children: [
                  Image.asset(
                    'assets/images/Rectangle9.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/Rectangle1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/Rectangle2.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              //height: 900,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(children: <Widget>[
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(1, 180, 220, 1),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15), bottom: Radius.circular(15)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                  title: "Belajar",
                                  gambar: "assets/images/icon_book.png",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Belajar();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                  title: "Diskusi",
                                  gambar: "assets/images/icon_message.png",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Diskusi();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                  title: "Komunitas",
                                  gambar: "assets/images/icon_people.png",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Discord();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                  title: "Event",
                                  gambar: "assets/images/icon_bulb.png",
                                  press: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                    title: "Soal",
                                    gambar: "assets/images/icon_book_open.png",
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return RegistrationScreen();
                                          },
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                    title: "Video",
                                    gambar: "assets/images/icon_play.png",
                                    press: () {}),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                    title: "Konsul",
                                    gambar: "assets/images/icon_headphones.png",
                                    press: () {}),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Menu(
                                    title: "Game",
                                    gambar: "assets/images/icon_puzzle.png",
                                    press: () {}),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 110,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                    top: 14, left: 17, right: 150),
                                child: Text(
                                  "Event Terbaru",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 180, 220, 1),
                                      fontFamily: font,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              width: 70,
                              height: 25,
                              margin: EdgeInsets.only(top: 14),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Lihat',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: font,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(1, 180, 220, 1),
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            )
                          ],
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 17, right: 17),
                            child: Text(
                              'Berbagai informasi tentang event-event menarik yang bisa kamu ikuti!',
                              style: TextStyle(
                                  fontFamily: font,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 14, left: 17),
                          child: Text(
                            "Beritaku",
                            style: TextStyle(
                                color: Color.fromRGBO(1, 180, 220, 1),
                                fontFamily: font,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 17),
                          child: Text(
                            'Berita menarik untuk menambah wawasanmu',
                            style: TextStyle(
                                fontFamily: font,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )),
                      Berita_new()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Build By ",
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Cendekia",
                      style: TextStyle(
                          fontFamily: font,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(1, 180, 220, 1)),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}