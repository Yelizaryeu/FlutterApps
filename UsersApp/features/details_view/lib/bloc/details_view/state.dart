part of 'bloc.dart';

class DetailsState extends Equatable {
  final UserModel? user;
  final List<PostModel>? posts;
  final bool isLoading;

  const DetailsState({
    this.user,
    this.posts,
    this.isLoading = true,
  });

  DetailsState copyWith({UserModel? user, List<PostModel>? posts, bool? isLoading}) {
    return DetailsState(
      user: user ?? this.user,
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        user,
        posts,
      ];
}
