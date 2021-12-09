import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:challenge_ui_plant_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWithSearchBox extends StatelessWidget {
  bool isWifiEnabled = false;

  HeaderWithSearchBox({
    Key? key,
    required this.screenSize,
  }) {
    teste();
  }

  final Size screenSize;

  void teste() async {
    var platform = const MethodChannel('samples.flutter.dev/wifi');

    try {
      isWifiEnabled = await platform.invokeMethod("isWifiEnabled");
    } on PlatformException catch (e) {/* ... */}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: screenSize.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            height: 130,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Platform.isAndroid
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(AppLocalizations.of(context)!.wifi,
                                style: const TextStyle(color: Colors.white)),
                            Switch(
                              value: isWifiEnabled,
                              onChanged: (value) {},
                              activeColor: Colors.white,
                            ),
                          ])
                    : Row()
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    )
                  ]),
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffixIcon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/search.svg",
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
