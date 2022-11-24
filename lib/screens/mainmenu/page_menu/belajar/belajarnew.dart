import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_premmob/screens/mainmenu/page_menu/belajar/belajar_model.dart';
import 'package:project_premmob/screens/mainmenu/page_menu/belajar/detail_belajar.dart';
import 'package:project_premmob/screens/mainmenu/page_menu/belajar/rating.dart';

class Belajarku extends StatefulWidget {
  const Belajarku({super.key});

  @override
  State<Belajarku> createState() => _BelajarkuState();
}

class _BelajarkuState extends State<Belajarku> {
  final double _borderRadius = 24;
  final font = 'Baloo 2';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('belajar').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var belajar =
              snapshot.data!.docs.map((e) => Belajar.fromSnapshot(e)).toList();

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100), // Set this height
              child: Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: Text("Cendekia",
                    style: TextStyle(
                      color: Color.fromRGBO(1, 180, 220, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 40.0,
                      fontFamily: 'Baloo 2',
                    )),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(index);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new DetailBelajar(
                                list: belajar,
                                index: index,
                              )));
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, left: 16.0, top: 10),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_borderRadius),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(1, 180, 220, 1),
                                      Color.fromRGBO(138, 233, 239, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(138, 233, 239, 1),
                                    blurRadius: 12,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: CustomPaint(
                                size: Size(100, 150),
                                painter: CustomCardShapePainter(
                                  _borderRadius,
                                  Color.fromRGBO(1, 180, 220, 1),
                                  Color.fromRGBO(138, 233, 239, 1),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(15),
                                      child: ClipOval(
                                        child: Image.network(
                                          belajar[index].image,
                                        ),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          belajar[index].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: font,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          belajar[index].text,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: font,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.person_outline_rounded,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Flexible(
                                              child: Text(
                                                belajar[index].author,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: font,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          belajar[index].rating.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: font,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        RatingBar(
                                            rating: belajar[index].rating),
                                        //const SizedBox(height: 8),
                                        Text(
                                          "Cendekia",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: font,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: belajar.length),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            value: 0.20,
          ),
        );
      },
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
