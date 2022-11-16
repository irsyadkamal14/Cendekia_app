import 'package:flutter/material.dart';
import 'package:project_premmob/screens/mainmenu/page_menu/komunitas.dart';

class Menu extends StatelessWidget {
  final String title;
  final String gambar;
  final Function? press;
  // ignore: use_key_in_widget_constructors
  const Menu({required this.title, required this.gambar, this.press});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          //margin: EdgeInsets.only(right: 19, left: 19),
          width: 65,
          height: 65,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
                onTap: press as void Function()?,
                splashColor: Color.fromRGBO(91, 213, 240, 1),
                child: Center(
                    child: Image(
                  image: AssetImage(gambar),
                  height: 35,
                  width: 35,
                ))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0.1, bottom: 5),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Baloo 2',
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
