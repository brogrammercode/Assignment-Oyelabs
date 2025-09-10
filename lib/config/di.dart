import 'package:get_it/get_it.dart';
import 'package:oyelabs/features/auth/data/auth_data.dart';
import 'package:oyelabs/features/auth/data/auth_repo.dart';

class Injections {
  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    // auth
    _getIt.registerFactory<AuthRepo>(() => AuthData());
    // _getIt.registerFactory<AuthCubit>(() => AuthCubit(repo: _getIt()));
  }

  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
