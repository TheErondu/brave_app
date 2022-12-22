// ignore_for_file: unnecessary_new

import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:estatio/src/components/default_appbar.dart';
import 'package:estatio/src/data/services/storage/user_storage_controller.dart.dart';
import 'package:estatio/src/data/models/user.dart';
import 'package:estatio/src/utils/bonjour.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends ConsumerWidget {
  HomePageView({Key? key}) : super(key: key);
  static const routeName = '/home';

  final String greeting = Bonjour().greeting();
  final IconData timeOfDayIcon = Bonjour().timeOfDayIcon();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserData? user = UserStorageService().loadUserData();
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$greeting,\n${user?.name}👋",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: CarouselSlider(
                  items: imgList
                      .map((item) => ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                                errorWidget: (context, url, error) {
                                  return Text(error);
                                },
                                progressIndicatorBuilder:
                                    (context, url, progress) {
                                  return const SizedBox(
                                      width: 4,
                                      height: 4,
                                      child: Center(
                                          child: CircularProgressIndicator()));
                                },
                                imageUrl: item,
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    quicklinks.length *
                    0.045,
                child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 4,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(quicklinks.length, (index) {
                      return Card(
                        color: Theme.of(context).colorScheme.primary,
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                    quicklinks.entries.elementAt(index).value),
                                onPressed: () {
                                  Navigator.restorablePushNamed(
                                      context,
                                      quicklinks.entries
                                          .elementAt(index)
                                          .key[1]);
                                  log('navigate to ${quicklinks.entries.elementAt(index).key[0]} page');
                                },
                                tooltip:
                                    quicklinks.entries.elementAt(index).key[0],
                              ),
                              Text(
                                quicklinks.entries.elementAt(index).key[0],
                                style: Theme.of(context).textTheme.button,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
