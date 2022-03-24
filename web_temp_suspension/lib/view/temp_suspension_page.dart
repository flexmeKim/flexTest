import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class TempSuspension extends StatelessWidget {
  TempSuspension({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    final double flexibleWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 88,
          ),
//          if (kIsWeb)
//            SvgPicture.network("assets/images/stop_img2.svg")
//          else
          SvgPicture.asset("assets/images/stop_img2.svg"),
          const SizedBox(
            height: 29,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: TextRenderer(
              text: "플렉스미 홈페이지",
              child: Padding(
                padding: EdgeInsets.only(
                    left: flexibleWidth * 0.395, right: flexibleWidth * 0.376),
                child: const Text(
                  "플렉스미 홈페이지",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xff00788D),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: TextRenderer(
              text: "임시 중단 안내",
              child: Padding(
                padding: EdgeInsets.only(
                    left: flexibleWidth * 0.355, right: flexibleWidth * 0.337),
                child: const Text("임시 중단 안내",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 0.95,
                        fontWeight: FontWeight.bold,
                        fontSize: 64,
                        color: Color(0xff00788D))),
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
//          if (kIsWeb)
//            SvgPicture.network(
//              "assets/images/line_img.svg",
//            )
//          else
          SvgPicture.asset("assets/images/line_img.svg"),
          const SizedBox(
            height: 23,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: EdgeInsets.only(
                  left: flexibleWidth * 0.163, right: flexibleWidth * 0.163),
              child: const Text(
                "더 나은 서비스 개선을 위하여\n 플렉스미 홈페이지 서비스를 임시 중단합니다.\n 이용에 불편을 드려서 죄송합니다.",
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(top: 19, bottom: 41),
            decoration: const BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: 566,
            height: 159,
            child: Column(
              children: [
                if (kIsWeb)
                  const Text(
                    "-임시 중단 기간-",
                    style: TextStyle(
                      fontSize: 26,
                      color: Color(0xff5E5E5E),
                    ),
                  )
                else
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: flexibleWidth * 0.336,
                        right: flexibleWidth * 0.336,
                      ),
                      child: const Text(
                        "-임시 중단 기간-",
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xff5E5E5E),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 23,
                ),
                if (kIsWeb)
                  const Text(
                    "03월28일14시 - 03월31일22시",
                    style: TextStyle(
                      fontSize: 26,
                      color: Color(0xffFF0012),
                    ),
                  )
                else
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: flexibleWidth * 0.18,
                          right: flexibleWidth * 0.18),
                      child: const Text(
                        "03월28일14시 - 03월31일22시",
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xffFF0012),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: EdgeInsets.only(
                  left: flexibleWidth * 0.362, right: flexibleWidth * 0.361),
              child: const Text(
                "※중단 기간은 당사 사정에 의해 변동 될 수 있습니다.",
                style: TextStyle(color: Color(0xff868686), fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 65,
          ),
//          if (kIsWeb)
//            ImageRenderer(
//                child: SvgPicture.network("assets/images/logo_img.svg"),
//                alt: "FLEXME")
//          else
          SvgPicture.asset("assets/images/logo_img.svg"),
        ],
      ),
    );
  }
}

//        {
//            "src": "icons/Icon-maskable-192.png",
//            "sizes": "192x192",
//            "type": "image/png",
//            "purpose": "maskable"
//        },
//        {
//            "src": "icons/Icon-maskable-512.png",
//            "sizes": "512x512",
//            "type": "image/png",
//            "purpose": "maskable"
//        }