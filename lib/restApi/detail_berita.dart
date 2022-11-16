import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_premmob/models/model_beritanew.dart';

class Detail extends StatelessWidget {
  final List list;
  final int index;
  const Detail({required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    final String font = 'Baloo 2';
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('berita').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var berita =
                snapshot.data!.docs.map((e) => Berita.fromSnapshot(e)).toList();

            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar(
                  flexibleSpace: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  ),
                  backgroundColor: Color.fromRGBO(1, 180, 220, 1),
                  elevation: 3,
                  title: Text(
                    "Berita",
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
              body: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                      top: 20,
                      right: 15,
                    ),
                    child: Text(
                      berita[index].title,
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: font,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.access_time,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Nov 22 2022',
                                style:
                                    TextStyle(fontFamily: font, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.person_outline,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Setya Novanto',
                                style:
                                    TextStyle(fontFamily: font, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15, left: 15),
                    child: Image.network(berita[index].image),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15, top: 10, left: 15),
                        child: Text(
                          berita[index].name,
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15, left: 15),
                    child: Text(
                      berita[index].text,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: font, fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
