import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../shared/gradient_background.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _videoPlayerController.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 3,
          ));
        }
        return GestureDetector(
          onTap: () {
            if (_videoPlayerController.value.isPlaying) {
              _videoPlayerController.pause();
            } else {
              _videoPlayerController.play();
            }
          },
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_videoPlayerController),
                const GradientBackground(
                  color1: Colors.transparent,
                  color2: Colors.black,
                ),
                Positioned(
                  left: 20,
                  bottom: 30,
                  child: _VideoCaption(caption: widget.caption),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  const _VideoCaption({
    required this.caption,
  });

  final String caption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
