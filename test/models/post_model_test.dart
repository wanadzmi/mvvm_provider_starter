import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_provider_starter/main.dart';
import 'package:mvvm_provider_starter/repository/post_repository.dart';
import 'package:mvvm_provider_starter/services/post_service.dart';
import 'package:mvvm_provider_starter/viewmodels/post_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App loads with a title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<PostService>(create: (_) => PostService()),
          ProxyProvider<PostService, PostRepository>(
            update: (_, service, __) => PostRepository(service),
          ),
          ChangeNotifierProxyProvider<PostRepository, PostViewModel>(
            create: (context) => PostViewModel(context.read<PostRepository>()),
            update: (_, repository, previous) => previous ?? PostViewModel(repository),
          ),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pump();
    expect(find.text('Posts'), findsOneWidget);
  });
}