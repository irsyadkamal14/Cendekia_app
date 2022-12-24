import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:project_premmob/screens/mainmenu/home.dart';
import 'package:project_premmob/restApi/Loading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_premmob/screens/splashScreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

FirebaseAuth _auth = FirebaseAuth.instance;
Stream<User?> get streamAuthStatus => _auth.authStateChanges();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: snapshot.data != null && snapshot.data!.emailVerified == true
                ? Home()
                : SplashScreen(),
          );
        }
        return Loading();
      },
    );
  }
}
