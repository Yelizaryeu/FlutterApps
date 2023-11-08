import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final GetUsersUseCase _getUsersUseCase;
  final SearchUserUseCase _searchUserUseCase;

  UsersListBloc({
    required GetUsersUseCase getUsersUseCase,
    required SearchUserUseCase searchUserUseCase,
  })  : _getUsersUseCase = getUsersUseCase,
        _searchUserUseCase = searchUserUseCase,
        super(const UsersListState()) {
    on<LoadUsersEvent>(_onLoadUsersEvent);
    on<SearchUserEvent>(_onSearchUserEvent);
    add(LoadUsersEvent());
  }

  Future<void> _onSearchUserEvent(
    SearchUserEvent event,
    Emitter<UsersListState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));

    final List<UserModel>? users = await _searchUserUseCase.execute(event.query);

    emit(state.copyWith(
      users: users,
      isLoading: false,
    ));
  }

  Future<void> _onLoadUsersEvent(
    UsersListEvent event,
    Emitter<UsersListState> emit,
  ) async {
    print('new user event');

    final List<UserModel>? users = await _getUsersUseCase.execute(const NoParams());
    emit(state.copyWith(
      users: users,
      isLoading: false,
    ));
  }
}
