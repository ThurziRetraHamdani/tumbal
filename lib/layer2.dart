import 'package:flutter/material.dart';

class layer2 extends StatefulWidget {
  const layer2({Key? key}) : super(key: key);

  @override
  State<layer2> createState() => _layer2State();
}

class _layer2State extends State<layer2> {
  bool centang = false;
  bool centang2 = false;
  bool centang3 = false;
  bool centang4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu Diet Hari Ini"),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context,true);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "lib/assets/dietfood.jpg",
                  height: 200,
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("SARAPAN"),
                    Text("Omelet sayur dan alpukat"),
                    InkWell(
                        onTap: () {
                          setState(() {
                            centang = !centang;
                          });
                        },
                        child: Icon(
                          centang == true ? Icons.done : Icons.cancel,
                          color: centang == true ? Colors.green : Colors.red,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "lib/assets/dietfood.jpg",
                  height: 200,
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("MAKAN SIANG"),
                    Text("Sayur Mayur"),
                    InkWell(
                        onTap: () {
                          setState(() {
                            centang2 = !centang2;
                          });
                        },
                        child: Icon(
                          centang2 == true ? Icons.done : Icons.cancel,
                          color: centang2 == true ? Colors.green : Colors.red,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "lib/assets/dietfood.jpg",
                  height: 200,
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("MAKAN MALAM"),
                    Text("kacang dan biji-bijian"),
                    InkWell(onTap: () {
                      setState(() {
                        centang3 = !centang3;
                      });
                    },child: Icon(centang3 == true ? Icons.done : Icons.cancel,color:centang3 == true ?Colors.green : Colors.red,))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "lib/assets/dietfood.jpg",
                  height: 200,
                  width: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text("CEMILAN"), Text("yogurt"),InkWell(onTap: () {
                    setState(() {
                      centang4 = !centang4;
                    });
                  },child: Icon(centang4 == true ? Icons.done : Icons.cancel,color:centang4 == true ?Colors.green : Colors.red,))],
                )
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        )));
  }
}
