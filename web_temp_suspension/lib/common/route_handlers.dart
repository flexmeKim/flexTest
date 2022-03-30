import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:web_temp_suspension/view/components/home_component.dart';
import 'package:web_temp_suspension/view/components/simple_component.dart';
import 'package:web_temp_suspension/view/sample/sample.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomeComponent();
});

var sampleHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SamplePage();
});

var demoRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? message = params["message"]?.first;
  String? colorHex = params["color_hex"]?.first;
  String? result = params["result"]?.first;
  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = Color(fromHexString(colorHex));
  }
  return DemoSimpleComponent(
      message: message ?? 'Testing', color: color, result: result);
});

int fromHexString(String argbHexString) {
  String useString = argbHexString;
  if (useString.startsWith("#")) {
    useString = useString.substring(1); // trim the starting '#'
  }
  if (useString.length < 8) {
    useString = "FF" + useString;
  }
  if (!useString.startsWith("0x")) {
    useString = "0x" + useString;
  }
  return int.parse(useString);
}
