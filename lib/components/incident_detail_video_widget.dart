import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'incident_detail_video_model.dart';
export 'incident_detail_video_model.dart';

class IncidentDetailVideoWidget extends StatefulWidget {
  const IncidentDetailVideoWidget({super.key});

  @override
  State<IncidentDetailVideoWidget> createState() =>
      _IncidentDetailVideoWidgetState();
}

class _IncidentDetailVideoWidgetState extends State<IncidentDetailVideoWidget> {
  late IncidentDetailVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncidentDetailVideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowVideoPlayer(
      path: getJsonField(
        FFAppState().incidentDetails,
        r'''$.video_url''',
      ).toString(),
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
