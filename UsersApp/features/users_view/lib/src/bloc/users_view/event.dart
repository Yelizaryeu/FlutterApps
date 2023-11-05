part of 'bloc.dart';

abstract class UsersListEvent {
  const UsersListEvent();
}

class LoadUsersEvent extends UsersListEvent {}

class SearchUserEvent extends UsersListEvent {
  final String query;

  const SearchUserEvent(this.query);
}
