import '../models/post_model.dart';
import '../services/post_service.dart';
import '../models/api_response.dart';

class PostRepository {
  final PostService apiService;

  PostRepository(this.apiService);

  Future<ApiResponse<List<PostModel>, String>> getPosts() async {
    return await apiService.fetchPosts();
  }
}
