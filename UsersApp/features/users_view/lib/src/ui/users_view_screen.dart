import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import 'users_view_form.dart';

class UsersViewScreen extends StatelessWidget {
  const UsersViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersListBloc>(
        create: (BuildContext context) => UsersListBloc(
              getUsersUseCase: appLocator<GetUsersUseCase>(),
              searchUserUseCase: appLocator<SearchUserUseCase>(),
            ),
        child: const UsersViewForm());
  }
}
