// Mocks generated by Mockito 5.4.2 from annotations
// in users_view/test/bloc/bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:domain/models/user/user_model.dart' as _i4;
import 'package:domain/usecases/get_users_usecase.dart' as _i2;
import 'package:domain/usecases/search_user_usecase.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetUsersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUsersUseCase extends _i1.Mock implements _i2.GetUsersUseCase {
  MockGetUsersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.UserModel>?> execute(dynamic input) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [input],
        ),
        returnValue: _i3.Future<List<_i4.UserModel>?>.value(),
      ) as _i3.Future<List<_i4.UserModel>?>);
}

/// A class which mocks [SearchUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchUserUseCase extends _i1.Mock implements _i5.SearchUserUseCase {
  MockSearchUserUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.UserModel>?> execute(String? input) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [input],
        ),
        returnValue: _i3.Future<List<_i4.UserModel>?>.value(),
      ) as _i3.Future<List<_i4.UserModel>?>);
}
