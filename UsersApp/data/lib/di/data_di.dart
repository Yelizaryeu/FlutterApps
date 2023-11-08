import 'package:core/di/app_di.dart';
import 'package:core/platform/network_info.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/posts_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    await _initApi();
  }

  Future _initApi() async {
    appLocator.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

    // Dio for users
    appLocator.registerSingleton(Dio(), instanceName: "usersDio");

    // Dio for posts
    appLocator.registerSingleton(Dio(), instanceName: "postsDio");

    appLocator.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(
        remoteProvider: appLocator<RemoteUsersProvider>(),
        localProvider: appLocator<LocalProvider>(),
        networkInfo: appLocator<NetworkInfo>(),
      ),
    );

    appLocator.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(
        remoteProvider: appLocator<RemotePostsProvider>(),
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
        postsRepository: appLocator<PostsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<RemoteUsersProvider>(
      () => RemoteUsersProvider(
        appLocator.get<Dio>(instanceName: "usersDio"),
      ),
    );

    appLocator.registerLazySingleton<RemotePostsProvider>(
      () => RemotePostsProvider(
        appLocator.get<Dio>(instanceName: "postsDio"),
      ),
    );

    appLocator.registerLazySingleton<LocalProvider>(
      () => LocalProvider(),
    );

    appLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(appLocator<InternetConnectionChecker>()),
    );
  }
}
