import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../models/response_status.dart';
import '../repository/post_repository.dart';

class PostViewModel extends ChangeNotifier {
  final PostRepository postRepository;

  PostViewModel(this.postRepository);

  List<PostModel> _posts = [];
  ResponseStatus _status = ResponseStatus.idle;
  String? _errorMessage;

  List<PostModel> get posts => _posts;
  ResponseStatus get status => _status;
  String? get errorMessage => _errorMessage;

  Future<void> fetchPosts() async {
    _status = ResponseStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _posts = await postRepository.getPosts();
      _status = ResponseStatus.success;
    } catch (e) {
      _status = ResponseStatus.error;
      _errorMessage = "An error occurred: $e";
    }

    notifyListeners();
  }
}
