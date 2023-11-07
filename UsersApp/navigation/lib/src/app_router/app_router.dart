import 'package:auto_route/auto_route.dart';
import 'package:details_view/details_view.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:users_view/users_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: UsersViewScreen,
      initial: true,
    ),
    AutoRoute(
      name: 'detailsViewRoute',
      page: DetailsViewScreen,
      path: 'details_view',
    ),
  ],
)
class AppRouter extends _$AppRouter {}
