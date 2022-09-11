import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:estatio/src/data/providers/home_page_provider.dart';
import 'package:estatio/src/features/settings/settings_view.dart';
import 'package:estatio/src/utils/bonjour.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticker_text/ticker_text.dart';

class HomePageView extends ConsumerWidget {
  HomePageView({Key? key}) : super(key: key);
  static const routeName = '/home';
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final Map<List<String>, IconData> quicklinks = {
    ["Pay Dues", "/payments"]: Icons.payments,
    [" Security", "/security"]: Icons.local_police,
    ["Register Tenants", "/register_tenant"]: Icons.person_add,
    ["Adverts", "/adverts"]: Icons.real_estate_agent_rounded,
    ["News", "/news"]: Icons.newspaper,
    ["Find Nearby Stores", "/stores_nearby"]: Icons.storefront_sharp,
    ["My Profile", "/prayer"]: Icons.person_rounded,
    ["Settings", "/settings"]: Icons.settings,
  };
  final String greeting = Bonjour().greeting();
  final String user = "Emmanuel";
  final IconData timeOfDayIcon = Bonjour().timeOfDayIcon();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Builder(builder: (context) {
                final userData = ref.watch(userInfoProvider).value;
                return ListTile(
                    leading: Text(
                      "$greeting, ${userData?.user?.name ?? "loading.."}",
                      style: headingText,
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                    ),
                    title: Icon(
                      timeOfDayIcon,
                      color: Colors.yellow,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.pushNamed(context, SettingsView.routeName);
                      },
                    ));
              }),
            ),
            const Divider(
              thickness: 2,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(45)),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 8, left: 20, bottom: 10),
              child: Text(
                'Welcome to Greenfield Estate!',
                style: headingText,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
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
                                    height: deviceHeight / 6,
                                    width: deviceWidth),
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
                            height: 30,
                            child: Builder(builder: (context) {
                              final articles = ref.watch(articleProvider).value;
                              return SizedBox(
                                width: deviceWidth *
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
                  const Text(
                    'Quick Links',
                    style: TextStyle(
                        fontFamily: "Hind",
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const Divider(),
                  SizedBox(
                    height: deviceHeight * quicklinks.length * 0.045,
                    child: GridView.count(
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount: 4,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(quicklinks.length, (index) {
                          return Card(
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
                                    style: const TextStyle(
                                        fontFamily: "Hind",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
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
          ],
        ),
      ),
    );
  }
}
