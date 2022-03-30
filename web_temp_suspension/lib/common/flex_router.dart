import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_temp_suspension/common/route_handlers.dart';

class FlexRouter {
  static String root = '/';
  static String demoPage = '/name_test/fixedtrans';
  static String demoPageFixedTrans = '/home';
  static String sample ="/sample";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      log("not Found Handler");
      return;
    });
    router.define(sample, handler: sampleHandler);
    router.define(root, handler: rootHandler);
    router.define(demoPage, handler: demoRouteHandler);
    router.define(demoPageFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
  }
}
