import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_provider_starter/models/api_response.dart';
import 'package:mvvm_provider_starter/models/post_model.dart';
import 'package:mvvm_provider_starter/repository/post_repository.dart';
import 'package:mvvm_provider_starter/viewmodels/post_viewmodel.dart';

import 'post_viewmodel_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  late MockPostRepository mockRepository;
  late PostViewModel viewModel;

  setUp(() {
    mockRepository = MockPostRepository();
    viewModel = PostViewModel(mockRepository);
  });

  group('PostViewModel', () {
    test('initial state is correct', () {
      expect(viewModel.response.status, equals(ResponseStatus.INITIAL));
    });

    test('fetchPosts updates state to loading then completed', () async {
      final posts = [
        PostModel(id: 1, title: 'Test Title', body: 'Test Body')
      ];
      when(mockRepository.getPosts()).thenAnswer((_) async => 
        ApiResponse.complete(posts)
      );
      await viewModel.fetchPosts();
      expect(viewModel.response.status, equals(ResponseStatus.COMPLETED));
      expect(viewModel.response.data, equals(posts));
      verify(mockRepository.getPosts()).called(1);
    });

    test('fetchPosts handles errors', () async {
      when(mockRepository.getPosts()).thenAnswer((_) async => 
        ApiResponse.error("Repository error")
      );
      await viewModel.fetchPosts();
      expect(viewModel.response.status, equals(ResponseStatus.ERROR));
      expect(viewModel.response.error, equals("Repository error"));
      verify(mockRepository.getPosts()).called(1);
    });
  });
}