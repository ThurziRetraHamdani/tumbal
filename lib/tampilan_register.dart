import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tumbal/auth.dart';
import 'package:tumbal/dummy_data.dart';
import 'package:tumbal/tampilan_profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class register extends StatefulWidget {
  static String nama = "";
  final SharedPreferences pref;
  const register(this.pref, {Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool? isLogin;
  String? usernameData;
  String? namaData;

  bool checkAccount(String usernameInput, String passwordInput) {
    for (int i = 0; i < DummyData.data.length; i++) {
      if (usernameInput == DummyData.data[i]['username']) {
        if (passwordInput == DummyData.data[i]['password']) {
          // setGlobalNama(DummyData.data[i][Keys.nama]);
          print("Data found ${DummyData.data[i]['nama']} ${namaData}");
          register.nama = DummyData.data[i]['nama'];
          save(DummyData.data[i]);
          return isLogin = true;
        }
      }
    }
    return isLogin = false;
  }

  void save(Map<String, dynamic> data) {
    widget.pref.setBool("isLogin", true);
    widget.pref.setString("nama", data['nama']);
    print(widget.pref.setString("nama", data['nama']));
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Diet Yuk")),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Image.asset("lib/assets/diet.png"),
            SizedBox(height: 32,),
            TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                )),
            SizedBox(
              height: 24,
            ),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                )),
            Spacer(),
            ElevatedButton(
              onPressed: (() {
                AuthenticationService service = AuthenticationService(FirebaseAuth.instance);

                service.signUp(email: usernameController.text, password: passwordController.text).then((value) {
                  if (value){
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Profil(widget.pref)),
                  );
                  }else {
                    if (checkAccount(
                    usernameController.text, passwordController.text)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Profil(widget.pref)),
                  );
                } else {}
                  }
                });
                
              }),
              child: Text("Daftar"),
            )
          ],
        ),
      )),
    );
  }
}
