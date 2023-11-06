import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/post/post_model.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final UserModel _user;
  final GetUserPostsUseCase _getUserPostsUseCase;

  DetailsBloc({
    required UserModel user,
    required GetUserPostsUseCase getUserPostsUseCase,
  })  : _user = user,
        _getUserPostsUseCase = getUserPostsUseCase,
        super(const DetailsState()) {
    on<LoadDetailsEvent>(_onLoadDetailsEvent);
    add(LoadDetailsEvent());
  }

  Future<void> _onLoadDetailsEvent(
    LoadDetailsEvent event,
    Emitter<DetailsState> emit,
  ) async {
    final List<PostModel> posts = await _getUserPostsUseCase.execute(_user.id);
    emit(state.copyWith(
      user: _user,
      posts: posts,
      isLoading: false,
    ));
  }
}
