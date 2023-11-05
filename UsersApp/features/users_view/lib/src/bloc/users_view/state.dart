part of 'bloc.dart';

class UsersListState extends Equatable {
  final List<UserModel>? users;
  final bool isLoading;

  const UsersListState({
    this.users,
    this.isLoading = true,
  });

  UsersListState copyWith({List<UserModel>? users, bool? isLoading}) {
    return UsersListState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        users,
      ];
}
