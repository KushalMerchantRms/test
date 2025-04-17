import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'splash_copy_model.dart';
export 'splash_copy_model.dart';

class SplashCopyWidget extends StatefulWidget {
  const SplashCopyWidget({super.key});

  static String routeName = 'SplashCopy';
  static String routePath = '/splashCopy';

  @override
  State<SplashCopyWidget> createState() => _SplashCopyWidgetState();
}

class _SplashCopyWidgetState extends State<SplashCopyWidget> {
  late SplashCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkInternetConnectionCopy(
        () async {
          await Future.delayed(const Duration(milliseconds: 2000));

          context.pushNamed(AlertScreenWidget.routeName);
        },
      );
      _model.hasExpired = await actions.refreshToken(
        FFAppState().refreshToken,
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      if ((FFAppState().token != '') &&
          (FFAppState().refreshToken != '') &&
          (_model.hasExpired == false)) {
        if (FFAppState().isSet == false) {
          context.goNamed(
            IncidentScreenWidget.routeName,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else {
          if (FFAppState().ScreenName == 'incidents') {
            context.goNamed(
              IncidentDetailsWidget.routeName,
              queryParameters: {
                'inciID': serializeParam(
                  FFAppState().IncidentID,
                  ParamType.int,
                ),
              }.withoutNulls,
            );
          } else if (FFAppState().ScreenName == 'past_incidents') {
            context.pushNamed(IncidentScreenWidget.routeName);
          } else {
            context.goNamed(CameraScreenWidget.routeName);
          }
        }
      } else {
        context.goNamed(LoginWidget.routeName);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 0.0,
                height: 0.0,
                child: custom_widgets.InitializeFCMWidget(
                  width: 0.0,
                  height: 0.0,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/visu.ai-svglogo.svg',
                        width: 200.0,
                        fit: BoxFit.scaleDown,
                        alignment: Alignment(0.0, 0.0),
                      ),
                    ),
                  ].addToStart(SizedBox(height: 120.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Frame_15075_(1).png',
                    height: 180.0,
                    fit: BoxFit.contain,
                    alignment: Alignment(0.0, 0.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
