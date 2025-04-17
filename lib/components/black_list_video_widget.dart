import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'black_list_video_model.dart';
export 'black_list_video_model.dart';

class BlackListVideoWidget extends StatefulWidget {
  const BlackListVideoWidget({
    super.key,
    this.videoPath,
  });

  final String? videoPath;

  @override
  State<BlackListVideoWidget> createState() => _BlackListVideoWidgetState();
}

class _BlackListVideoWidgetState extends State<BlackListVideoWidget> {
  late BlackListVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlackListVideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowVideoPlayer(
      path: widget.videoPath!,
      videoType: VideoType.network,
      width: double.infinity,
      height: valueOrDefault<double>(
        () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 230.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 500.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 500.0;
          } else {
            return 500.0;
          }
        }(),
        230.0,
      ),
      autoPlay: false,
      looping: true,
      showControls: true,
      allowFullScreen: true,
      allowPlaybackSpeedMenu: true,
    );
  }
}
