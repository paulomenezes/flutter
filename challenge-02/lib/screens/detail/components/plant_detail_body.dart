import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlantDetailBody extends StatelessWidget {
  Plant plant;

  PlantDetailBody({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          verticalDirection: VerticalDirection.up,
          children: [
            Container(
                height: size.height * 0.5,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.topCenter,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: SvgPicture.asset(
                      "assets/icons/back_arrow.svg",
                      color: Colors.black,
                    ))),
            Expanded(child: Column()),
            Container(
              height: size.height * 0.6,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(63),
                    bottomLeft: Radius.circular(63)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 60,
                      color: kPrimaryColor.withOpacity(0.29))
                ],
                image: DecorationImage(
                  image: NetworkImage(plant.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.fontSize),
                      ),
                      Row(children: [
                        Text(
                          plant.country,
                          style: const TextStyle(
                              fontSize: 16, color: kPrimaryColor),
                        ),
                        const Spacer(),
                        Text(
                          plant.carelevel,
                          style: const TextStyle(
                              fontSize: 16, color: kPrimaryColor),
                        )
                      ]),
                      Text(
                        "\$${plant.price}",
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline5?.fontSize,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        plant.description,
                        style:
                            const TextStyle(fontSize: 16, color: kPrimaryColor),
                      ),
                    ])),
            SizedBox(
              width: size.width / 2,
              height: 84,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context)!.buyNow),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20)))),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(AppLocalizations.of(context)!
                          .featureNotImplemented)));
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
