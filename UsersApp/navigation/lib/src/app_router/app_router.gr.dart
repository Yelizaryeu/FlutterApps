// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    UsersViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UsersViewScreen(),
      );
    },
    DetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DetailsViewScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          UsersViewRoute.name,
          path: '/',
        ),
        RouteConfig(
          DetailsViewRoute.name,
          path: 'details_view',
        ),
      ];
}

/// generated route for
/// [UsersViewScreen]
class UsersViewRoute extends PageRouteInfo<void> {
  const UsersViewRoute()
      : super(
          UsersViewRoute.name,
          path: '/',
        );

  static const String name = 'UsersViewRoute';
}

/// generated route for
/// [DetailsViewScreen]
class DetailsViewRoute extends PageRouteInfo<DetailsViewRouteArgs> {
  DetailsViewRoute({
    Key? key,
    required UserModel user,
  }) : super(
          DetailsViewRoute.name,
          path: 'details_view',
          args: DetailsViewRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'DetailsViewRoute';
}

class DetailsViewRouteArgs {
  const DetailsViewRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final UserModel user;

  @override
  String toString() {
    return 'DetailsViewRouteArgs{key: $key, user: $user}';
  }
}
