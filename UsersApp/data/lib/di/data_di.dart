import 'package:core/di/app_di.dart';
import 'package:core/platform/network_info.dart';
import 'package:data/data.dart';
import 'package:data/providers/local_provider.dart';
import 'package:data/repositories/users_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    await _initApi();
    await _initUsers();
  }

  Future _initApi() async {
    // appLocator.registerLazySingleton<RemoteProvider>(
    //   () => RemoteProvider(client: appLocator()),
    // );
    //
    // appLocator.registerLazySingleton<LocalProvider>(
    //   () => LocalProvider(sharedPreferences: appLocator()),
    // );
    //
    // appLocator.registerLazySingleton<NetworkInfo>(
    //   () => NetworkInfoImp(appLocator()),
    // );
  }

  Future _initUsers() async {
    appLocator.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(
        remoteProvider: appLocator(),
        localProvider: appLocator(),
        networkInfo: appLocator(),
      ),
    );

    appLocator.registerLazySingleton<GetUsersUseCase>(
      () => GetUsersUseCase(
        usersRepository: appLocator(),
      ),
    );

    appLocator.registerLazySingleton<SearchUserUseCase>(
      () => SearchUserUseCase(
        usersRepository: appLocator(),
      ),
    );

    appLocator.registerLazySingleton<GetUserPostsUseCase>(
      () => GetUserPostsUseCase(
        usersRepository: appLocator(),
      ),
    );

    appLocator.registerLazySingleton<RemoteProvider>(
      () => RemoteProvider(
        appLocator(),
      ),
    );

    appLocator.registerLazySingleton<LocalProvider>(
      () => LocalProvider(usersBox: appLocator()),
    );

    // Core
    appLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(appLocator()),
    );

    final Box<List<UserEntity>> userBox = await Hive.openBox('users');
    appLocator.registerLazySingleton(() => userBox);
    appLocator.registerLazySingleton(() => InternetConnectionChecker());
    appLocator.registerLazySingleton(() => Dio());
  }
}
