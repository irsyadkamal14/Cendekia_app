class UserModel {
  String? uid;
  String? name;
  String? username;
  String? email;

  UserModel({this.uid, this.name, this.username, this.email});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'username': username,
      'email': email,
    };
  }
}
