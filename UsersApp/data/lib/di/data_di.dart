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
  }

  Future _initApi() async {
    final usersBox = await Hive.openBox<List>("users");
    //final Box<List<UserEntity>> userBox = await Hive.openBox('users');
    appLocator.registerLazySingleton(() => usersBox);
    appLocator.registerLazySingleton(() => InternetConnectionChecker());
    appLocator.registerLazySingleton(() => Dio());

    appLocator.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(
        remoteProvider: appLocator<RemoteProvider>(),
        localProvider: appLocator<LocalProvider>(),
        networkInfo: appLocator<NetworkInfo>(),
      ),
    );

    appLocator.registerLazySingleton<GetUsersUseCase>(
      () => GetUsersUseCase(
        usersRepository: appLocator<UsersRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SearchUserUseCase>(
      () => SearchUserUseCase(
        usersRepository: appLocator<UsersRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetUserPostsUseCase>(
      () => GetUserPostsUseCase(
        usersRepository: appLocator<UsersRepository>(),
      ),
    );

    appLocator.registerLazySingleton<RemoteProvider>(
      () => RemoteProvider(
        appLocator<Dio>(),
      ),
    );

    appLocator.registerLazySingleton<LocalProvider>(
      () => LocalProvider(usersBox: appLocator<Box<List>>()),
    );

    appLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(appLocator<InternetConnectionChecker>()),
    );
  }
}
