import 'package:flutter/material.dart';
import 'package:mvvm_provider_starter/models/api_response.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostViewModel>().fetchPosts();
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
    final response = vm.response;

    switch (response.status) {
      case ResponseStatus.LOADING:
        return const Center(child: CircularProgressIndicator());
      case ResponseStatus.ERROR:
        return Center(child: Text(response.error ?? "Unknown error"));
      case ResponseStatus.COMPLETED:
        return ListView.builder(
          itemCount: response.data?.length ?? 0,
          itemBuilder: (context, index) {
            final post = response.data![index];
            return ListTile(title: Text(post.title), subtitle: Text(post.body));
          },
        );
      case ResponseStatus.INITIAL:
      case ResponseStatus.CONSUMED:
        return const Center(child: Text("Press refresh to load posts"));
    }
  }
}
