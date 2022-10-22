
import 'package:estatio/src/data/models/user_model.dart';
import 'package:estatio/src/data/repository/news_repo.dart';
import 'package:estatio/src/data/repository/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoProvider = FutureProvider.autoDispose<UserModel?>((ref) async {
  return await UserRepository().userInfo();
});
final articleProvider = FutureProvider<String>((ref) async {
  return await NewsRepository().getArticles();
});