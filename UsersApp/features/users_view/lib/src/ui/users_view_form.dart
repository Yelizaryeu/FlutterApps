import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import 'widgets/user_list_widget.dart';

class UsersViewForm extends StatefulWidget {
  const UsersViewForm({super.key});

  @override
  State<UsersViewForm> createState() => _UsersFormState();
}

class _UsersFormState extends State<UsersViewForm> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contextWidget) {
    return BlocBuilder<UsersListBloc, UsersListState>(
      builder: (BuildContext context, UsersListState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.orange,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_5),
              child: Text(
                'Users',
                textAlign: TextAlign.center,
                style: AppFonts.bold26.copyWith(color: AppColors.darkBlack),
              ),
            ),
            centerTitle: true,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_40),
                        ),
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<UsersListBloc>(contextWidget).add(LoadUsersEvent());
                    },
                    child: Text(
                      'clear',
                      textAlign: TextAlign.center,
                      style: AppFonts.normal12.copyWith(color: AppColors.black),
                    ),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_40),
                        ),
                      ),
                    ),
                    onPressed: () {
                      popUpDialog(context);
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                      color: AppColors.black,
                      size: AppDimens.BORDER_RADIUS_23,
                    ),
                  ),
                ],
              )
            ],
          ),
          body: state.users != null
              ? Container(
                  color: AppColors.darkBlack,
                  child: UserListWidget(users: state.users!),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        );
      },
    );
  }

  popUpDialog(BuildContext contextWidget) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                "Search user",
                textAlign: TextAlign.left,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    controller: _searchController,
                    hintText: 'Enter name or email',
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBlack),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<UsersListBloc>(contextWidget).add(SearchUserEvent(_searchController.text));
                    Navigator.of(contextWidget).pop();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.darkBlack),
                  child: const Text("Search"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
