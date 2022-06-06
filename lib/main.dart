import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tumbal/tampilan_home.dart';
import 'package:tumbal/tampilan_login.dart';
import 'package:tumbal/tampilan_profil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  final SharedPreferences pref;
  const MyApp(this.pref, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLogin = pref.getBool("isLogin") ?? false;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogin ? Profil(pref) : Login(pref),
    );
  }
}
