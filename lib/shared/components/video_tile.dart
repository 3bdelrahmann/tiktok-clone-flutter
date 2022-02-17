import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok_clone/models/videoModel.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile(
      {Key? key,
      required this.video,
      required this.snappedIndex,
      required this.currentIndex})
      : super(key: key);
  final VideoModel video;
  final int snappedIndex;
  final int currentIndex;
  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _videoPlayerController;
  late Future _videoPlayerInitializer;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/${widget.video.videoUrl}');
    _videoPlayerInitializer = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _pausePlayVideo() {
    _isVideoPlaying
        ? _videoPlayerController.pause()
        : _videoPlayerController.play();
    setState(() {
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    (widget.currentIndex == widget.snappedIndex && _isVideoPlaying)
        ? _videoPlayerController.play()
        : _videoPlayerController.pause();
    return Container(
      color: Colors.black,
      child: FutureBuilder(
          future: _videoPlayerInitializer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return InkWell(
                onTap: () {
                  _pausePlayVideo();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_videoPlayerController),
                    IconButton(
                      onPressed: () {
                        _pausePlayVideo();
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        size: 60.0,
                        color:
                            Colors.white.withOpacity(_isVideoPlaying ? 0 : 0.5),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                child: Lottie.asset(
                    'assets/lottie_animations/tiktok-loader.json',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover),
              );
            }
          }),
    );
  }
}
