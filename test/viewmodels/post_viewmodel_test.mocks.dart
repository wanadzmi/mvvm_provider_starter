// Mocks generated by Mockito 5.4.5 from annotations
// in mvvm_provider_starter/test/viewmodels/post_viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mvvm_provider_starter/models/api_response.dart' as _i3;
import 'package:mvvm_provider_starter/models/post_model.dart' as _i6;
import 'package:mvvm_provider_starter/repository/post_repository.dart' as _i4;
import 'package:mvvm_provider_starter/services/post_service.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePostService_0 extends _i1.SmartFake implements _i2.PostService {
  _FakePostService_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeApiResponse_1<T, V> extends _i1.SmartFake
    implements _i3.ApiResponse<T, V> {
  _FakeApiResponse_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [PostRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPostRepository extends _i1.Mock implements _i4.PostRepository {
  MockPostRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PostService get apiService =>
      (super.noSuchMethod(
            Invocation.getter(#apiService),
            returnValue: _FakePostService_0(
              this,
              Invocation.getter(#apiService),
            ),
          )
          as _i2.PostService);

  @override
  _i5.Future<_i3.ApiResponse<List<_i6.PostModel>, String>> getPosts() =>
      (super.noSuchMethod(
            Invocation.method(#getPosts, []),
            returnValue:
                _i5.Future<_i3.ApiResponse<List<_i6.PostModel>, String>>.value(
                  _FakeApiResponse_1<List<_i6.PostModel>, String>(
                    this,
                    Invocation.method(#getPosts, []),
                  ),
                ),
          )
          as _i5.Future<_i3.ApiResponse<List<_i6.PostModel>, String>>);
}
