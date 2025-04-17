import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'splash_check_model.dart';
export 'splash_check_model.dart';

class SplashCheckWidget extends StatefulWidget {
  const SplashCheckWidget({
    super.key,
    required this.token,
  });

  final String? token;

  static String routeName = 'SplashCheck';
  static String routePath = '/splashCheck';

  @override
  State<SplashCheckWidget> createState() => _SplashCheckWidgetState();
}

class _SplashCheckWidgetState extends State<SplashCheckWidget> {
  late SplashCheckModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashCheckModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkInternetConnectionCopy(
        () async {
          context.goNamed(AlertScreenWidget.routeName);
        },
      );
      _model.result = await TokenValidCheckCall.call(
        token: widget.token,
      );

      if ((_model.result?.succeeded ?? true)) {
        context.goNamed(
          ResetPasswordWidget.routeName,
          queryParameters: {
            'token': serializeParam(
              widget.token,
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else {
        context.goNamed(
          LoginWidget.routeName,
          queryParameters: {
            'splashCheck': serializeParam(
              true,
              ParamType.bool,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
