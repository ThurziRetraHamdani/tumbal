//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class TampilanProfil extends StatelessWidget {
  bool iscomplete = false;
  // void PrintToken()async {
  //    debugPrint("Token: ${(await FirebaseMessaging.instance.getToken()).toString()}");
  // }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    // PrintToken();
   
    return Scaffold(
        appBar: AppBar(
            title: Text("Selamat Datang"), leading: Icon(Icons.menu_outlined)),
        backgroundColor: const Color(0xFFE9E9E9),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: ("home"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: ("search"),
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: ("profil"),
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body:
            ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return widgetmakanan();
          },
        ));
  }
}

class widgetmakanan extends StatelessWidget {
  const widgetmakanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'lib/assets/buah.jpg',
          height: 300,
          width: 100,
        ),
        Text("buah serta yogurt yang memiliki banyak khasiat."),
      ],
    );
  }
}
