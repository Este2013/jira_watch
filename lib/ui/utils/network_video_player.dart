import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class NetworkVideoPlayer extends StatelessWidget {
  const NetworkVideoPlayer({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    if (Platform.isMacOS) return ChewieNetworkVideo(url: url);
    if (Platform.isWindows) return DesktopVideoPlayer(url: url);
    return Container();
  }
}

class ChewieNetworkVideo extends StatefulWidget {
  const ChewieNetworkVideo({super.key, required this.url, this.autoplay = false, this.loop = true});
  final String url;
  final bool autoplay;
  final bool loop;

  @override
  State<ChewieNetworkVideo> createState() => _ChewieNetworkVideoState();
}

class _ChewieNetworkVideoState extends State<ChewieNetworkVideo> {
  late final VideoPlayerController _videoController;
  ChewieController? _chewie;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
      httpHeaders: {'Authorization': APIDao().authHeader},
    );
    _videoController
        .initialize()
        .then((_) {
          _chewie = ChewieController(
            videoPlayerController: _videoController,
            autoPlay: widget.autoplay,
            looping: widget.loop,
            allowMuting: true,
            allowFullScreen: true,
            showControls: true,
          );
          if (mounted) setState(() {});
        })
        .catchError((_) {
          setState(() {});
        });
  }

  @override
  void dispose() {
    _chewie?.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewie == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return AspectRatio(
      aspectRatio: _videoController.value.aspectRatio == 0 ? 16 / 9 : _videoController.value.aspectRatio,
      child: Chewie(controller: _chewie!),
    );
  }
}

class DesktopVideoPlayer extends StatefulWidget {
  const DesktopVideoPlayer({super.key, required this.url});
  final String url;

  @override
  State<DesktopVideoPlayer> createState() => _DesktopVideoPlayerState();
}

class _DesktopVideoPlayerState extends State<DesktopVideoPlayer> {
  static Player? player;
  late final VideoController controller;

  @override
  void initState() {
    super.initState();
    player ??= Player();
    controller = VideoController(player!);
    player!.open(Media(widget.url, httpHeaders: {'Authorization': APIDao().authHeader}));
  }

  @override
  void dispose() {
    // player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Video(controller: controller);
}
