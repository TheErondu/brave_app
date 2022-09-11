import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:estatio/globals.dart';
import 'package:estatio/src/data/models/news_scroller.dart';

class NewsRepository {
  Future<String> getArticles() async {
    try {
      final res = await Dio().get(
        Global.environmentVariables.newsApiBaseurl,
      );
      if (res.statusCode == 200) {
        NewsScroller data = NewsScroller.fromJson(res.data);

        return data.articles
            .map((x) => Article.fromJson(x.toJson()))
            .toList()
            .map((article) => {article.title})
            .join(" | ")
            .replaceAll('{', '')
            .replaceAll('}', '');
      } else {}
    } catch (e) {
      log("$e");
    }
    throw Exception("Error getting Articles");
  }
}
