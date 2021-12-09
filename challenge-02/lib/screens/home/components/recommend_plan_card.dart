import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/providers/plant_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RecomendedPlanCard extends StatelessWidget {
  final Plant plant;

  const RecomendedPlanCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/detail", arguments: plant);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: [
                SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: plant.image,
                        placeholder: (context, url) => const SizedBox(
                            height: 16,
                            width: 16,
                            child: Center(
                                child: CircularProgressIndicator(
                              color: kPrimaryColor,
                              strokeWidth: 1.5,
                            ))),
                        fit: BoxFit.cover,
                        height: 130,
                      ),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Consumer<PlantProvider>(
                        builder: (context, value, child) => GestureDetector(
                            onTap: () async {
                              value.favorite(plant.id);
                            },
                            child: SvgPicture.asset(
                              value.isFavorited(plant.id)
                                  ? "assets/icons/heart.svg"
                                  : "assets/icons/heart-outline.svg",
                              color: kPrimaryColor,
                            ))),
                  ),
                ),
              ]),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        plant.name
                            .substring(0, min(14, plant.name.length))
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.button),
                    Row(children: [
                      Text(
                          plant.country
                              .substring(0, min(10, plant.country.length))
                              .toUpperCase(),
                          style:
                              TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                      const Spacer(),
                      Text(
                        "\$${plant.price}",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: kPrimaryColor),
                      )
                    ])
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
