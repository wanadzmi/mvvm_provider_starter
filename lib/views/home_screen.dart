import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_viewmodel.dart';
import '../models/response_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<PostViewModel>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final vm = context.watch<PostViewModel>();
    switch (vm.status) {
      case ResponseStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case ResponseStatus.error:
        return Center(child: Text(vm.errorMessage ?? "Unknown error"));

      case ResponseStatus.success:
        return ListView.builder(
          itemCount: vm.posts.length,
          itemBuilder: (context, index) {
            final post = vm.posts[index];
            return ListTile(title: Text(post.title), subtitle: Text(post.body));
          },
        );

      case ResponseStatus.idle:
        return const Center(child: Text("Press refresh to load posts"));
    }
  }
}
