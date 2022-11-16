import 'package:flutter/material.dart';
import 'package:project_premmob/screens/sign_InUp/page_login.dart';

import 'package:project_premmob/screens/sign_InUp/page_register.dart';

class PageAwal extends StatelessWidget {
  const PageAwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 80, top: 50),
            child: Text(
              "Cendekia",
              style: TextStyle(
                color: Color.fromRGBO(1, 180, 220, 1),
                fontWeight: FontWeight.w700,
                fontSize: 40.0,
                fontFamily: 'Baloo 2',
              ),
            ),
          ),
          Container(
              height: 275,
              width: 247.67,
              child: Image.asset(
                "assets/images/gambar_home.png",
                fit: BoxFit.cover,
              )),
          Container(
            padding: EdgeInsets.only(bottom: 30),
            margin: EdgeInsets.all(40),
            child: Text(
              "Tempat Belajar dan Diskusi mengenai segala hal yang berkaitan dengan sekolah",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(1, 180, 220, 1),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login1();
                    },
                  ),
                );
              },
              child: Text(
                "Daftar",
                style: TextStyle(
                    fontFamily: "Baloo 2", fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                "Masuk",
                style: TextStyle(
                    fontFamily: "Baloo 2",
                    fontSize: 20,
                    color: Color.fromRGBO(1, 180, 220, 1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
