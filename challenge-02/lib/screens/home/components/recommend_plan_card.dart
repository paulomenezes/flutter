import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:challenge_ui_plant_app/constants.dart';
import 'package:challenge_ui_plant_app/models/plant.dart';
import 'package:challenge_ui_plant_app/utils/favorites_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecomendedPlanCard extends StatefulWidget {
  final Function onFavorite;
  final Plant plant;
  final bool isFavorited;
  final bool isGrid;

  const RecomendedPlanCard(
      {Key? key,
      required this.plant,
      required this.onFavorite,
      required this.isFavorited,
      required this.isGrid})
      : super(key: key);

  @override
  _RecomendedPlanCardState createState() => _RecomendedPlanCardState();
}

class _RecomendedPlanCardState extends State<RecomendedPlanCard> {
  final FavoritesDataSource dataSource = FavoritesDataSource();
  bool isFavorite = false;

  List<String> favorites = [];

  bool isFavorited(String id) {
    return favorites.contains(id);
  }

  _RecomendedPlanCardState() {
    dataSource.getFavorite().then((value) => setState(() {
          favorites = value;

          isFavorite = isFavorited(widget.plant.id);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/detail", arguments: widget.plant);
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
                        imageUrl: widget.plant.image,
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
                    child: GestureDetector(
                        onTap: () async {
                          favorites =
                              await dataSource.toggleFavorite(widget.plant.id);
                          widget.onFavorite();
                          isFavorite = !isFavorite;
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          (widget.isFavorited ||
                                  (!widget.isFavorited &&
                                      widget.isGrid &&
                                      isFavorite))
                              ? "assets/icons/heart.svg"
                              : "assets/icons/heart-outline.svg",
                          color: kPrimaryColor,
                        )),
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
                        widget.plant.name
                            .substring(0, min(14, widget.plant.name.length))
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.button),
                    Row(children: [
                      Text(
                          widget.plant.country
                              .substring(
                                  0, min(10, widget.plant.country.length))
                              .toUpperCase(),
                          style:
                              TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                      const Spacer(),
                      Text(
                        "\$${widget.plant.price}",
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
