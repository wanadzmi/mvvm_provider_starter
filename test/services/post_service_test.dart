import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_provider_starter/models/api_response.dart';
import 'package:mvvm_provider_starter/services/post_service.dart';

import 'post_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late PostService postService;

  setUp(() {
    mockClient = MockClient();
    postService = PostService(client: mockClient);
  });

  group('PostService', () {
    test(
      'fetchPosts returns a list of posts when HTTP call is successful',
      () async {
        // Arrange
        when(mockClient.get(any)).thenAnswer(
          (_) async => http.Response(
            jsonEncode([
              {"id": 1, "title": "Test Title", "body": "Test Body"},
            ]),
            200,
            headers: {'content-type': 'application/json'},
          ),
        );

        // Act
        final result = await postService.fetchPosts();

        // Assert
        expect(result.status, equals(ResponseStatus.COMPLETED));
        expect(result.data?.length, equals(1));
        expect(result.data?[0].title, equals("Test Title"));
      },
    );

    test('fetchPosts returns an error when HTTP call fails', () async {
      // Arrange
      when(
        mockClient.get(any),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      // Act
      final result = await postService.fetchPosts();

      // Assert
      expect(result.status, equals(ResponseStatus.ERROR));
      expect(result.error, equals("Failed to load posts"));
    });
  });
}
