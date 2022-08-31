import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:estatio/globals.dart';
import 'package:estatio/src/repository/news.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const url = "https://newsdata.io/api/1/news?apikey=pub_104514a72bbaa8fabc591f4775b051e39938b&q=cryptocurrency&language=en";

class NewsRepository {
  Future<dynamic> getBreakingNews() async {
    try {
      final response = await Dio().get(url,
          options: Options(headers: {
            "X-ACCESS-KEY": Global.environmentVariables.clientKey,
          }));
      if (response.statusCode == 200) {
        final data = BreakingNews.fromJson(response.data);
        
        //print(data.results!);
        return response.data;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

final newsServiceProvider = Provider.autoDispose((ref) => NewsRepository());
final getBreakingNews = FutureProvider.autoDispose((ref) async {
  return ref.read(newsServiceProvider).getBreakingNews();
});
