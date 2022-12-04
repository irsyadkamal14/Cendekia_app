import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project_premmob/models/model_beritanew.dart';

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

          //UI di masukkan dibawah
          return Scaffold();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
