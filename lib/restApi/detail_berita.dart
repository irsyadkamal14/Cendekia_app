import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_premmob/restApi/model_beritanew.dart';

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
                    child: Image.network(berita[index].image),
                  ),
                  Container(
                    child: Text(berita[index].name),
                  ),
                  Container(
                    child: Text(berita[index].text),
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
