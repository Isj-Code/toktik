import 'package:toktik/domain/datasource/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastucture/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((e) => LocalVideoModel.fromJson(e).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
