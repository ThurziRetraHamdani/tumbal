import 'package:flutter/material.dart';
import 'package:tumbal/tampilan_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  final SharedPreferences pref;
  const Profil(this.pref, {Key? key}) : super(key: key);
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    String nama = "";

    void getData() {
      nama = widget.pref.getString("nama") ?? "";
    }

    @override
    void initState() {
      getData();
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(title: Text("Profil"), actions: [
        InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Login(widget.pref)),
              );
            },
            child: Icon(Icons.logout)),
      ]),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "lib/assets/perut buncit.jpg",
                width: 100,
                height: 100,
              ),
              SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text("Hi Orang Mager!"),
                  Text(nama == "" ? Login.nama : nama),
                  Text("Yuk Mulai Dietnya"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
