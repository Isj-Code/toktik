import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
import 'package:toktik/infrastucture/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastucture/repositories/video_post_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoRepositoryImpl(videoDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy:
                false, // ? Hacemos que cargue el Provider cuando arranca la App
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen(),
      ),
    );
  }
}
