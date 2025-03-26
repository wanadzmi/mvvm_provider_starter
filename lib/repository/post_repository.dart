import '../models/post_model.dart';
import '../services/post_service.dart';

class PostRepository {
  final PostService apiService;

  PostRepository(this.apiService);

  Future<List<PostModel>> getPosts() async {
    return await apiService.fetchPosts();
  }
}
