import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'audio_store_model.dart';
export 'audio_store_model.dart';

class AudioStoreWidget extends StatefulWidget {
  const AudioStoreWidget({super.key});

  static String routeName = 'AudioStore';
  static String routePath = '/audioStore';

  @override
  State<AudioStoreWidget> createState() => _AudioStoreWidgetState();
}

class _AudioStoreWidgetState extends State<AudioStoreWidget> {
  late AudioStoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioStoreModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowAudioPlayer(
                audio: Audio(
                  'assets/audios/alarm-alert-sound-effect-230557.mp3',
                  metas: Metas(
                    id: 'alarm-alert-sound-effect-230557.mp3-f1ecbbe0',
                    title: 'Title',
                  ),
                ),
                titleTextStyle:
                    FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                playbackDurationTextStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                playbackButtonColor: FlutterFlowTheme.of(context).primary,
                activeTrackColor: FlutterFlowTheme.of(context).primary,
                inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                elevation: 0.0,
                playInBackground: PlayInBackground.disabledRestoreOnForeground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
