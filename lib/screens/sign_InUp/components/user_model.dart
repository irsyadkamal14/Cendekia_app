import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? name;
  String? username;
  String? email;
  String? no_telepone;
  String? password;
  String? jenjang;
  String? prov;
  String? kota;
  String? lahir;

  UserModel(
      {this.uid,
      this.name,
      this.username,
      this.email,
      this.no_telepone,
      this.password,
      this.jenjang,
      this.prov,
      this.kota,
      this.lahir});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      no_telepone: map['no_telepone'],
      password: map['password'],
      jenjang: map['jenjang'],
      prov: map['prov'],
      kota: map['kota'],
      lahir: map['lahir'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'username': username,
      'email': email,
      'no_telepone': no_telepone,
      'password': password,
      'jenjang': jenjang,
      'prov': prov,
      'kota': kota,
      'lahir': lahir,
    };
  }

  // factory UserModel.fromSnapshot(
  //     QueryDocumentSnapshot<Map<String, dynamic>> json) {
  //   return UserModel(
  //     uid: json['uid'],
  //     name: json['name'],
  //     username: json['username'],
  //     email: json['email'],
  //   );
  // }
}
