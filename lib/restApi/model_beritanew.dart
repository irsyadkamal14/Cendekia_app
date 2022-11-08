import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_premmob/halaman_utama/page_menu/belajar.dart';

class Berita {
  String name;
  String image;
  String text;

  Berita({required this.image, required this.text, required this.name});

  Map<String, dynamic> tojson() {
    return {
      'image': image,
      'name': name,
      'text': text,
    };
  }

  factory Berita.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Berita(image: json['image'], text: json['text'], name: json['name']);
  }
}
