import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
            value: video.likes, icon: Icons.favorite, iconColor: Colors.red),
        _CustomIconButton(
            value: video.views, icon: Icons.remove_red_eye_outlined),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int? value;
  final IconData icon;
  final Color? color;

  const _CustomIconButton({
    this.value,
    required this.icon,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: color,
            size: 40,
          ),
        ),
        value == null
            ? const Text('')
            : Text(HumanFormats.humanReadbleNumber(value!.toDouble()))
      ],
    );
  }
}
