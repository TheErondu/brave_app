import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:estatio/src/data/providers/home_page_provider.dart';
import 'package:estatio/src/features/profile/my_profile.dart';
import 'package:estatio/src/utils/bonjour.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticker_text/ticker_text.dart';

class HomePageView extends ConsumerWidget {
  HomePageView({Key? key}) : super(key: key);
  static const routeName = '/home';

  final String greeting = Bonjour().greeting();
  final IconData timeOfDayIcon = Bonjour().timeOfDayIcon();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userInfoProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(timeOfDayIcon,
        color: const Color.fromARGB(255, 216, 198, 32),),
        title:  user.when(loading: () => const Text("loading"),
        error: (error, stackTrace) => const Text("Error getting user info"),
        data: (user) =>Text( "$greeting, ${user?.name}"),
        ),
        actions:  [
        IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, MyProfileScreen.routeName, (route) => false),
          icon: const Icon(Icons.account_circle),)
      ]),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                    padding: const EdgeInsets.all(2.0),
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
                                              child:
                                                  CircularProgressIndicator()));
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
                   const Divider(),
                  Column(
                    children: [
                      const Center(
                          child: Text(
                        'Latest News',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )),
                      Card(
                          color: Colors.teal,
                          child: SizedBox(
                            height: size(context, type: Size.height)*0.045,
                            child: Builder(builder: (context) {
                              final articles = ref.watch(articleProvider).value;
                              return SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.95, // constrain the parent width so the child overflows and scrolling takes effect
                                child: Stack(
                                  children: [
                                    TickerText(
                                      // default values // this is optional
                                      scrollDirection: Axis.horizontal,
                                      speed: 35,
                                      startPauseDuration:
                                          const Duration(seconds: 2),
                                      endPauseDuration:
                                          const Duration(seconds: 2),
                                      returnDuration:
                                          const Duration(milliseconds: 400),
                                      primaryCurve: Curves.linear,
                                      returnCurve: Curves.easeOut,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 4),
                                        child: Text(
                                          articles ?? "loading..",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(1),
                                          shape: BoxShape.rectangle,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 4),
                                        child: Align(
                                          child: Text(
                                            "News",
                                            style: TextStyle(
                                                letterSpacing: 1,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          )),
                    ],
                  ),
                   const Divider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * quicklinks.length * 0.045,
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
                                    icon: Icon(quicklinks.entries
                                        .elementAt(index)
                                        .value),
                                    onPressed: () {
                                      Navigator.restorablePushNamed(
                                          context,
                                          quicklinks.entries
                                              .elementAt(index)
                                              .key[1]);
                                      log('navigate to ${quicklinks.entries.elementAt(index).key[0]} page');
                                    },
                                    tooltip: quicklinks.entries
                                        .elementAt(index)
                                        .key[0],
                                  ),
                                  Text(
                                    quicklinks.entries.elementAt(index).key[0],
                                    style:Theme.of(context).textTheme.button,
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
