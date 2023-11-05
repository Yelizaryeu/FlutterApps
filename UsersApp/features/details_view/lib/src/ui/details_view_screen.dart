import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:details_view/bloc/details_view/bloc.dart';
import 'package:details_view/src/ui/details_view_form.dart';
import 'package:domain/models/user/user_model.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';

class DetailsViewScreen extends StatelessWidget {
  final UserModel user;

  const DetailsViewScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
        create: (BuildContext context) => DetailsBloc(
              user: user,
              getUserPostsUseCase: appLocator<GetUserPostsUseCase>(),
            ),
        child: const DetailsViewForm());
  }
}
