import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_provider_starter/models/api_response.dart';
import '../models/post_model.dart';

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final http.Client client;

  PostService({http.Client? client}) : client = client ?? http.Client();

  Future<ApiResponse<List<PostModel>, String>> fetchPosts() async {
    final response = await client.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return ApiResponse.complete(
        data.map((json) => PostModel.fromJson(json)).toList(),
        headers: response.headers.map((key, value) => MapEntry(key, [value])),
      );
    } else {
      return ApiResponse.error(
        "Failed to load posts",
        headers: response.headers.map((key, value) => MapEntry(key, [value])),
      );
    }
  }
}
