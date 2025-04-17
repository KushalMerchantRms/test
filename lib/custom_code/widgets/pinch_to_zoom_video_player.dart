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

import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:visu_a_i_customer_1/incident_vedio/incident_vedio_widget.dart';

class PinchToZoomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final double width;
  final double height;
  final String? videoURL;
  final int? incidetId;
  final int? isValid;
  final String? photoURL;
  final String? incidentTIme;
  final bool? isAlertPage;

  const PinchToZoomVideoPlayer({
    required this.videoUrl,
    required this.width,
    required this.height,
    this.videoURL,
    this.incidetId,
    this.isValid,
    this.photoURL,
    this.incidentTIme,
    this.isAlertPage,
    Key? key,
  }) : super(key: key);

  @override
  _PinchToZoomVideoPlayerState createState() => _PinchToZoomVideoPlayerState();
}

class _PinchToZoomVideoPlayerState extends State<PinchToZoomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  bool _isMuted = false;
  Timer? _hideControlsTimer;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) => setState(() {}))
      ..addListener(() => setState(() {}));

    _startHideControlsTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
      _startHideControlsTimer();
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  void _enterFullScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncidentVedioWidget(
          videoURL: widget.videoURL,
          incidetId: widget.incidetId,
          incidentTIme: widget.incidentTIme,
          photoURL: widget.photoURL,
          isAlertPage: widget.isAlertPage,
          isValid: widget.isValid,
        ),
      ),
    );
  }

  // void _exitFullScreen() {
  //   Navigator.pop(context);
  // }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    if (_controller.value.isPlaying) {
      _hideControlsTimer = Timer(Duration(seconds: 3), () {
        if (mounted) setState(() => _showControls = false);
      });
    }
  }

  void _skipForward() {
    final position = _controller.value.position;
    final newPosition = position + Duration(seconds: 10);
    _controller.seekTo(newPosition);
  }

  void _skipBackward() {
    final position = _controller.value.position;
    final newPosition = position - Duration(seconds: 10);
    _controller.seekTo(newPosition);
  }

  void _changePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
      _controller.setPlaybackSpeed(speed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        setState(() => _showControls = true);
        _startHideControlsTimer();
      },
      child: GestureDetector(
        onTap: () {
          setState(() => _showControls = !_showControls);
          _startHideControlsTimer();
        },
        child: InteractiveViewer(
          minScale: 1.0,
          maxScale: 3.0,
          child: Container(
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const Center(child: CircularProgressIndicator()),
                if (_showControls) _buildPlayPauseButton(),
                if (_showControls) _buildControlsOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Backward Button
        GestureDetector(
          onTap: _skipBackward,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.6),
            radius: 20,
            child: Icon(
              Icons.replay_10,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),

        SizedBox(width: 30), // 15px space
        // Play/Pause Button
        GestureDetector(
          onTap: _togglePlayPause,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.6),
            radius: 30,
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        SizedBox(width: 30), // 15px space
        // Forward Button
        GestureDetector(
          onTap: _skipForward,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.6),
            radius: 20,
            child: Icon(
              Icons.forward_10,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControlsOverlay() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Column(
        children: [
          _buildProgressBar(),
          const SizedBox(height: 5),
          _buildControlButtons(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(_formatDuration(_controller.value.position),
            style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 10),
        Expanded(
          child: VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.blue,
              bufferedColor: Colors.white.withOpacity(0.5),
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(_formatDuration(_controller.value.duration),
            style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
              onPressed: _togglePlayPause,
            ),
            IconButton(
              icon: Icon(
                _isMuted ? Icons.volume_off : Icons.volume_up,
                color: Colors.white,
                size: 30,
              ),
              onPressed: _toggleMute,
            ),
          ],
        ),

        Row(
          children: [
            // Playback Speed Control with Icon only in the Dropdown
            PopupMenuButton<double>(
              padding: EdgeInsetsDirectional.fromSTEB(
                  7, 0, 0, 0), // Remove any internal padding (default is zero)
              icon: _playbackSpeed == 1.0
                  ? Icon(Icons.speed_rounded, color: Colors.white, size: 30)
                  : Center(
                      child: Text(
                        '${_playbackSpeed.toStringAsFixed(1)}x',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
              color: Colors.black.withOpacity(0.8),
              onSelected: _changePlaybackSpeed,
              itemBuilder: (context) => [
                PopupMenuItem<double>(
                  value: 1.0,
                  child: Text(
                    "1x",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<double>(
                  value: 1.5,
                  child: Text(
                    "1.5x",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<double>(
                  value: 2.0,
                  child: Text(
                    "2x",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.fullscreen, color: Colors.white, size: 30),
              onPressed: () {
                _enterFullScreen();
              },
            ),
          ],
        ),
        // Row(
        //   children: [
        //     if (FFAppState().fullscreen)
        //       IconButton(
        //           icon: Icon(Icons.fullscreen_exit,
        //               color: Colors.white, size: 30),
        //           onPressed: () {
        //             Navigator.pop(context);
        //             setState(() {
        //               FFAppState().fullscreen = false; // ✅ Ensure it updates
        //             });
        //           }),
        //     if (!FFAppState().fullscreen)
        //       IconButton(
        //         icon: Icon(Icons.fullscreen, color: Colors.white, size: 30),
        //         onPressed: () {
        //           _enterFullScreen();
        //           setState(() {
        //             FFAppState().fullscreen = true; // ✅ Ensure it updates
        //           });
        //         },
        //       ),
        //   ],
        // ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }
}

// // Fullscreen Video Player
// class FullScreenVideoPlayer extends StatefulWidget {
//   final String videoUrl;

//   const FullScreenVideoPlayer({required this.videoUrl, Key? key})
//       : super(key: key);

//   @override
//   _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
// }

// class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Center(
//               child: PinchToZoomVideoPlayer(
//                 videoUrl: widget.videoUrl,
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//               ),
//             ),
//             Positioned(
//               top: 20,
//               left: 20,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.pop(context); // Exit fullscreen
//                   setState(() {
//                     FFAppState().fullscreen =
//                         false; // Update the fullscreen state
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
