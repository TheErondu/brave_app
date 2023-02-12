import 'package:estasi/src/data/models/user.dart';
import 'package:estasi/src/data/repository/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoProvider = FutureProvider.autoDispose<User?>((ref) async {
  return await UserRepository().getUserInfo();
});
final indexProvider = StateProvider<int>((ref) => 0);
