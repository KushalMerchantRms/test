// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// DO NOT REMOVE OR MODIFY THE CODE ABOVE!ss

import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    super.key,
    this.width,
    this.height,
    this.autoPlay = true,
    this.videoPath,
  });

  final double? width;
  final double? height;
  final bool? autoPlay;
  final String? videoPath;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoPath!)
      ..initialize().then((_) {
        if (widget.autoPlay!) {
          _controller.play();
          setState(() {
            _isPlaying = true;
          });
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildVideoControlBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_controller.value.position),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  _formatDuration(_controller.value.duration),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: FlutterFlowTheme.of(context).primary,
              bufferedColor: Colors.grey,
              backgroundColor: Colors.white24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.seekTo(
                        _controller.value.position - Duration(seconds: 10));
                  },
                  child: Icon(
                    FFIcons.kprevious2,
                    color: Colors.white,
                    size: 22.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                        _isPlaying = _controller.value.isPlaying;
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? FFIcons.kpauseButton
                          : FFIcons.kplayButton,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _controller.seekTo(
                        _controller.value.position + Duration(seconds: 10));
                  },
                  child: Icon(
                    FFIcons.knextButton1,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration position) {
    final minutes = position.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = position.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true, // Enable panning
      scaleEnabled: true, // Enable zooming
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : CircularProgressIndicator(),
            ),
            if (_controller.value.isInitialized)
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildVideoControlBar(),
              ),
          ],
        ),
      ),
    );
  }
}
