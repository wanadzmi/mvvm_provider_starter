import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../models/api_response.dart';
import '../repository/post_repository.dart';

class PostViewModel extends ChangeNotifier {
  final PostRepository postRepository;

  PostViewModel(this.postRepository);
  ApiResponse<List<PostModel>, String> _response = ApiResponse.initial();
  ApiResponse<List<PostModel>, String> get response => _response;

  Future<void> fetchPosts() async {
    _response = ApiResponse.loading();
    notifyListeners();

    final result = await postRepository.getPosts();
    _response = result;
    notifyListeners();
  }
}
