import 'dart:developer';

import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marquee/marquee.dart';

class HomePageView extends StatelessWidget {
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
    ["Report Security Incident", "/security"]: Icons.local_police,
    ["Register Tenants", "/register_tenant"]: Icons.person_add,
    ["Adverts", "/adverts"]: Icons.real_estate_agent_rounded,
    ["News", "/news"]: Icons.newspaper,
    ["Find Nearby Stores", "/stores_nearby"]: Icons.storefront_sharp,
    ["My Profile", "/prayer"]: Icons.person_rounded,
    ["Settings", "/settings"]: Icons.settings,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: deviceHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(45)),
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 8, left: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome to Greenfield Estate!',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
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
                                  child: Image.network(item,
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
                    Text(
                      'Quick Links',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textScaleFactor: 0.5,
                    ),
                    const Divider(),
                    SizedBox(
                      height: deviceHeight * 0.25,
                      child: GridView.count(
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this produces 2 rows.
                          crossAxisCount: 4,
                          // Generate 100 widgets that display their index in the List.
                          children: List.generate(quicklinks.length, (index) {
                            return Card(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Colors.transparent,
                                        Color.fromARGB(104, 188, 223, 239)
                                      ]),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
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
                                          quicklinks.entries
                                              .elementAt(index)
                                              .key[0],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                    ),
                    SizedBox(
                        height: 20,
                        child: Marquee(
                          text: 'Some sample text that takes some space.',
                          style: Theme.of(context).textTheme.headlineSmall,
                          scrollAxis: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          blankSpace: 20.0,
                          velocity: 100.0,
                          pauseAfterRound: const Duration(seconds: 1),
                          startPadding: 10.0,
                          accelerationDuration: const Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration:
                              const Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
