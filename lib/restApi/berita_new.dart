import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_premmob/restApi/detail_berita.dart';

import 'package:project_premmob/models/model_beritanew.dart';
import '../constants.dart';

class Berita_new extends StatefulWidget {
  const Berita_new({super.key});

  @override
  State<Berita_new> createState() => _Berita_newState();
}

class _Berita_newState extends State<Berita_new> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('berita').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var berita =
              snapshot.data!.docs.map((e) => Berita.fromSnapshot(e)).toList();

          return Container(
            height: 280,
            //margin: EdgeInsets.only(right: 17, left: 17),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // onTap: () {
                    //   return print(index);
                    // },
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                                list: berita,
                                index: index,
                              )));
                    },

                    child: Card(
                        elevation: 5,
                        margin: EdgeInsets.only(
                          right: kDefaultPadding,
                          top: kDefaultPadding / 2,
                          bottom: kDefaultPadding / 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.network(
                                berita[index].image,
                                width: 250,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 220,
                              padding: EdgeInsets.only(top: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                berita[index].name,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Baloo 2',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              width: 220,
                              margin: EdgeInsets.only(right: 5, left: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                berita[index].text,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Baloo 2',
                                  fontSize: 13,
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: berita.length),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
