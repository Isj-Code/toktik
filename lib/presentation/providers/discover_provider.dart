import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastucture/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, Datasource

  bool initialLoading = true;
  List<VideoPost> listaVideos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((e) => LocalVideoModel.fromJson(e).toVideoPostEntity())
        .toList();

    listaVideos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
