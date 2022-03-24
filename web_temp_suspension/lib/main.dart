import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_temp_suspension/view/temp_suspension_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flexme_test",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'noto_sans_kr',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: TempSuspension(
          title: '',
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
