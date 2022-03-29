import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_temp_suspension/common/flex_router.dart';
import 'package:web_temp_suspension/view/components/home_component.dart';
import 'package:web_temp_suspension/view/named_page.dart';
import 'package:web_temp_suspension/view/temp_suspension_page.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/config/application.dart';

void main() {
  setPathUrlStrategy();
  runApp(AppComponent());
}

class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final FluroRouter router = FluroRouter();
    FlexRouter.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Application.router.generator,
      routes: {
        '/': (BuildContext context) => const MyHomePage(),
        '/name_test': (BuildContext context) => NameTest(),
        '/home': (BuildContext context) => HomeComponent(),
      },
      title: "petrichor",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'noto_sans_kr',
        primarySwatch: Colors.blue,
      ),
//      home: const MyHomePage(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Application.router.generator,
      routes: {
        '/': (BuildContext context) => const MyHomePage(),
        '/name_test': (BuildContext context) => NameTest(),
        '/home': (BuildContext context) => HomeComponent(),
      },
      title: "petrichor",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'noto_sans_kr',
        primarySwatch: Colors.blue,
      ),
//      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void te() {
    log("log Test");
  }

  @override
  Widget build(BuildContext context) {
    te();
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
