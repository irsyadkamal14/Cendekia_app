import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Belajar {
  String author;
  String image;
  String text;
  String title;
  double rating;
  int startColor;
  int endColor;

  Belajar(
      {required this.image,
      required this.text,
      required this.title,
      required this.author,
      required this.rating,
      required this.startColor,
      required this.endColor});

  Map<String, dynamic> tojson() {
    return {
      'image': image,
      'name': author,
      'text': text,
      'title': title,
      'star': rating,
      'startColor': startColor,
      'endColor': endColor,
    };
  }

  factory Belajar.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Belajar(
        image: json['image'],
        text: json['text'],
        title: json['title'],
        author: json['author'],
        rating: json['rating'],
        startColor: json['startColor'],
        endColor: json['endColor']);
  }
}
