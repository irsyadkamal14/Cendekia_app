import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:project_premmob/login_register/komponen/accountcheck.dart';
import 'package:project_premmob/login_register/komponen/user_model.dart';
import 'package:project_premmob/login_register/page_login.dart';
import 'package:project_premmob/splash_screen/page_awal.dart';

import '../halaman_utama/home.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // editing Controller
  final nameeditController = new TextEditingController();
  final usernameeditController = new TextEditingController();
  final emaileditController = new TextEditingController();
  final passwordeditController = new TextEditingController();
  //final confirmPasswordEditingController = new TextEditingController();

  // our form key
  final _formKey = GlobalKey<FormState>();
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;
  bool _checkBoxVal = false;
  void _toggle() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  final items = [
    'Jenjang',
    'SMP',
    'SMA',
    'SMK',
    'UMUM',
  ];
  int index = 0;
  final String font = 'Baloo 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80),
            alignment: Alignment.center,
            child: Text("Cendekia",
                style: TextStyle(
                  color: Color.fromRGBO(1, 180, 220, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 40.0,
                  fontFamily: 'Baloo 2',
                )),
          ),
          const SizedBox(height: 15),
          Container(
              child: Column(
            children: <Widget>[
              Text("Daftar",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                    fontFamily: 'Baloo 2',
                  )),
              Container(
                padding: EdgeInsets.only(right: 50, left: 50),
                child: Text(
                  "Buat akun Cendekia kamu untuk dapat menggunakan fitur Cendekia",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: 'Baloo 2',
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
          const SizedBox(height: 20),
          // nama lengkap
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: 325,
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      controller: nameeditController,
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.person,
                              color: Color.fromRGBO(1, 180, 220, 1)),
                        ),
                        hintText: 'Nama Lengkap',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Name cannot be Empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid name(Min. 3 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        nameeditController.text = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // username
                Container(
                  width: 325,
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      controller: usernameeditController,
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.alternate_email,
                              color: Color.fromRGBO(1, 180, 220, 1)),
                        ),
                        hintText: 'Username',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Username cannot be Empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid name(Min. 3 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usernameeditController.text = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // email
                Container(
                  width: 325,
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      controller: emaileditController,
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.email,
                              color: Color.fromRGBO(1, 180, 220, 1)),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        // reg expression for email validation
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emaileditController.text = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // no telephone
                Container(
                  width: 325,
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.phone,
                              color: Color.fromRGBO(1, 180, 220, 1)),
                        ),
                        hintText: 'No. Telepon',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // password
                Container(
                  width: 325,
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      controller: passwordeditController,
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.lock,
                            color: Color.fromRGBO(1, 180, 220, 1),
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                            onTap: _toggle,
                            child: Icon(
                                _obscured
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                                color: Color.fromRGBO(1, 180, 220, 1)),
                          ),
                        ),
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      obscureText: true,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                      },
                      onSaved: (value) {
                        passwordeditController.text = value!;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // jenjang
                Container(
                  width: 325,
                  child: Container(
                    width: 325,
                    child: GestureDetector(
                        child: TextField(
                          enabled: false,
                          textInputAction: TextInputAction.none,
                          autofocus: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(Icons.people,
                                  color: Color.fromRGBO(1, 180, 220, 1)),
                            ),
                            hintText: items[index],
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.8,
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 14, right: 18),
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Selesai",
                                                style: TextStyle(
                                                    fontFamily: font,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: Color.fromRGBO(
                                                        1, 180, 220, 1)),
                                              ))),
                                      SizedBox(
                                        height: 300,
                                        child: CupertinoPicker(
                                          looping: true,
                                          itemExtent: 64,
                                          children: items
                                              .map((item) => Center(
                                                    child: Text(
                                                      item,
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontFamily: font,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromRGBO(
                                                              1, 180, 220, 1)),
                                                    ),
                                                  ))
                                              .toList(),
                                          onSelectedItemChanged: (index) {
                                            setState(() => this.index = index);
                                            final item = items[index];
                                            print(index);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        }),
                  ),
                ),
                const SizedBox(height: 15),
                // asal provinsi
                Container(
                  width: 325,
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.location_pin,
                              color: Color.fromRGBO(1, 180, 220, 1)),
                        ),
                        hintText: 'Asal Provinsi',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // asal kota
                Container(
                  width: 325,
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.location_pin,
                              color: Color.fromRGBO(1, 180, 220, 1)),
                        ),
                        hintText: 'Asal Kota',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // tahun lahir
                Container(
                  width: 325,
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.date_range,
                              color: Color.fromRGBO(1, 180, 220, 1)),
                        ),
                        hintText: 'Tahun Lahir',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                //Check Box
                Container(
                  width: 325,
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _checkBoxVal,
                        onChanged: (value) {
                          _checkBoxVal = value!;
                          setState(() {});
                        },
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Saya telah menyetujui ",
                                style: const TextStyle(
                                  fontFamily: "Baloo 2",
                                  fontSize: 15,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Syarat dan",
                                  style: const TextStyle(
                                    color: Color.fromRGBO(1, 180, 220, 1),
                                    fontFamily: "Baloo 2",
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "ketentuan ",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(1, 180, 220, 1),
                                      fontFamily: "Baloo 2",
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Text(
                                  "yang berlaku",
                                  style: const TextStyle(
                                    fontFamily: "Baloo 2",
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // tombol datar
                Container(
                  width: 325,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(1, 180, 220, 1),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      signUp(emaileditController.text,
                          passwordeditController.text);
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                          fontFamily: "Baloo 2",
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // auto cek
                AccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameeditController.text;
    userModel.username = usernameeditController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
