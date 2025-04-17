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

import '../../backend/api_requests/api_calls.dart';
import 'package:visu_a_i_customer_1/backend/api_requests/api_calls.dart';

import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;

import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:visu_a_i_customer_1/incident_vedio/incident_vedio_widget.dart';

class PinchToZoomVideoPlayer2 extends StatefulWidget {
  final String videoUrl;
  final double? width;
  final double? height;
  final int? incidentId;
  final int? isValid;
  final String? photoURL;
  final String? incidentTime;
  final bool isAlertPage;

  const PinchToZoomVideoPlayer2({
    required this.videoUrl,
    this.width,
    this.height,
    this.incidentId,
    this.isValid,
    this.photoURL,
    this.incidentTime,
    this.isAlertPage = false,
    Key? key,
  }) : super(key: key);

  @override
  _PinchToZoomVideoPlayer2State createState() =>
      _PinchToZoomVideoPlayer2State();
}

class _PinchToZoomVideoPlayer2State extends State<PinchToZoomVideoPlayer2> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  bool _isMuted = false;
  Timer? _hideControlsTimer;
  double _playbackSpeed = 1.0;
  var _shortUrl6;
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

  Future<void> _handleShare() async {
    _shortUrl6 = await APIsAllGroup.uRLShortenerCall.call(
      authToken: FFAppState().token,
      url: '/incidentDetails?inciID=${widget.incidentId}',
    );

    String incidentDetails =
        '*Our analyst team has marked the incident as Likely Theft*${'\n'}${'\n'}${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
      '${valueOrDefault<String>(
        dateTimeFormat(
            "dd MMMM yy", functions.stringToDate(widget.incidentTime!)),
        '3 Feb 25 ,11:40',
      )},${valueOrDefault<String>(
        dateTimeFormat("jm", functions.stringToDate(widget.incidentTime!)),
        '3 Feb 25 ,11:40',
      )}',
      '3 Feb 25 ,11:40',
    )} requires your attention. Please use the link below to review.';

    String incidentDetails2 =
        '${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
      '${valueOrDefault<String>(
        dateTimeFormat(
            "dd MMMM yy", functions.stringToDate(widget.incidentTime!)),
        '3 Feb 25 ,11:40',
      )},${valueOrDefault<String>(
        dateTimeFormat("jm", functions.stringToDate(widget.incidentTime!)),
        '3 Feb 25 ,11:40',
      )}',
      '3 Feb 25 ,11:40',
    )} requires your attention. Please use the link below to review.';

    if (widget.isValid == 1) {
      await downloadAndShare(
        functions.imageTOstring(widget.photoURL),
        incidentDetails,
        APIsAllGroup.uRLShortenerCall.shortUrl((_shortUrl6?.jsonBody ?? '')),
      );
    } else {
      await downloadAndShare(
        functions.imageTOstring(widget.photoURL),
        incidentDetails2,
        APIsAllGroup.uRLShortenerCall.shortUrl((_shortUrl6?.jsonBody ?? '')),
      );
    }

    safeSetState(() {});
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
                if (_showControls) _appBar(),
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
          ],
        ),
      ],
    );
  }

  Widget _appBar() {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Leading IconButton
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () async {
              context.pop();
            },
          ),

          // Title Text
          Text(
            'Incident Videos',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 18,
                  letterSpacing: 0.0,
                ),
          ),

          // Share Button (only if isAlertPage is false)
          if (widget.isAlertPage == false)
            FFButtonWidget(
              onPressed: _handleShare,
              text: 'Share',
              icon: Icon(
                FFIcons.kshare,
                color: Colors.white,
                size: 20,
              ),
              options: FFButtonOptions(
                height: 37,
                padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                color: Colors.transparent,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 3,
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }
}
