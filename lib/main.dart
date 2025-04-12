import 'package:flutter/material.dart';
import 'package:mvvm_provider_starter/services/post_service.dart';
import 'package:provider/provider.dart';
import 'views/post_screen.dart';
import 'viewmodels/post_viewmodel.dart';
import 'repository/post_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostViewModel(PostRepository(PostService())),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PostScreen());
  }
}
