import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'belajar_model.dart';

class DetailBelajar extends StatefulWidget {
  final List list;
  final int index;
  const DetailBelajar({required this.index, required this.list});

  @override
  State<DetailBelajar> createState() => _DetailBelajarState();
}

class _DetailBelajarState extends State<DetailBelajar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('belajar').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var belajar = snapshot.data!.docs
                .map((e) => Belajar.fromSnapshot(e))
                .toList();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
