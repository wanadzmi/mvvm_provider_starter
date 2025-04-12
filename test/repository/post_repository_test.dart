import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_provider_starter/models/api_response.dart';
import 'package:mvvm_provider_starter/models/post_model.dart';
import 'package:mvvm_provider_starter/repository/post_repository.dart';
import 'package:mvvm_provider_starter/services/post_service.dart';

import 'post_repository_test.mocks.dart';

@GenerateMocks([PostService])
void main() {
  late MockPostService mockPostService;
  late PostRepository postRepository;

  setUp(() {
    mockPostService = MockPostService();
    postRepository = PostRepository(mockPostService);
  });

  group('PostRepository', () {
    test('getPosts returns data from the service', () async {
      // Arrange
      final posts = [
        PostModel(id: 1, title: 'Test Title', body: 'Test Body')
      ];
      when(mockPostService.fetchPosts()).thenAnswer((_) async => 
        ApiResponse.complete(posts)
      );

      // Act
      final result = await postRepository.getPosts();

      // Assert
      expect(result.status, equals(ResponseStatus.COMPLETED));
      expect(result.data, equals(posts));
      verify(mockPostService.fetchPosts()).called(1);
    });

    test('getPosts passes through error from service', () async {
      // Arrange
      when(mockPostService.fetchPosts()).thenAnswer((_) async => 
        ApiResponse.error("Service error")
      );

      // Act
      final result = await postRepository.getPosts();

      // Assert
      expect(result.status, equals(ResponseStatus.ERROR));
      expect(result.error, equals("Service error"));
      verify(mockPostService.fetchPosts()).called(1);
    });
  });
}