import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//import 'dart:html' as html;

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.2),
        actions: [
          Icon(Icons.shopping_cart),
          Icon(Icons.add),
        ],
        leading: Row(
          children: [
            Icon(Icons.menu),
            Icon(Icons.search),
          ],
        ),
        centerTitle: true,
        title: FittedBox(
          child: Text("FLEXME"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkResponse(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("Naver"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Text("1"),
            Text("1"),
            SizedBox(
              height: 500,
            ),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            SizedBox(
              height: 500,
              child: Text("12312"),
            ),
            SizedBox(
              height: 500,
              child: Text("12312"),
            ),
            Text("1"),
            Text("1"),
            Text("1"),
            GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                  childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
                  mainAxisSpacing: 40, //수평 Padding
                  crossAxisSpacing: 50, //수직 Padding
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Text("123"),
                  );
                })
//          SliverAppBar(title: Text("123"),)
          ],
        ),
      ),
    );
  }
}
