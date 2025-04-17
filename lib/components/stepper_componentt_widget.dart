import '/components/edit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stepper_componentt_model.dart';
export 'stepper_componentt_model.dart';

class StepperComponenttWidget extends StatefulWidget {
  const StepperComponenttWidget({
    super.key,
    this.actionType,
    this.name,
    this.time,
    required this.comment,
    this.avatar,
    required this.status,
    this.action,
    this.edited,
    this.userID,
  });

  final int? actionType;
  final String? name;
  final String? time;
  final String? comment;
  final String? avatar;
  final int? status;
  final Future Function()? action;
  final bool? edited;
  final int? userID;

  @override
  State<StepperComponenttWidget> createState() =>
      _StepperComponenttWidgetState();
}

class _StepperComponenttWidgetState extends State<StepperComponenttWidget> {
  late StepperComponenttModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StepperComponenttModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.time!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF464646),
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
                Expanded(
                  flex: valueOrDefault<int>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 2;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 5;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 5;
                      } else {
                        return 5;
                      }
                    }(),
                    5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: (widget.actionType == 1) &&
                                  (widget.status == 1)
                              ? Color(0xFFEAFFF4)
                              : ((widget.actionType == 1) &&
                                      (widget.status == 2)
                                  ? Color(0xFFEAFFF4)
                                  : ((widget.actionType == 2) &&
                                          (widget.status == 1)
                                      ? Color(0xFFFCE4DA)
                                      : ((widget.actionType == 2) &&
                                              (widget.status == 2)
                                          ? Color(0xFFEAFFF4)
                                          : ((widget.actionType == 3) &&
                                                  (widget.status == 1)
                                              ? Color(0xC7DAF8FF)
                                              : ((widget.actionType == 3) &&
                                                      (widget.status == 2)
                                                  ? Color(0xFFEAFFF4)
                                                  : ((widget.actionType ==
                                                              4) &&
                                                          (widget.status == 1)
                                                      ? Color(0xFFFFE4E3)
                                                      : () {
                                                          if ((widget.actionType ==
                                                                  4) &&
                                                              (widget.status ==
                                                                  2)) {
                                                            return Color(
                                                                0xFFEAFFF4);
                                                          } else if ((widget
                                                                      .actionType ==
                                                                  4) &&
                                                              (widget.status ==
                                                                  4)) {
                                                            return Color(
                                                                0xFFEAFFF4);
                                                          } else if ((widget
                                                                      .actionType ==
                                                                  4) &&
                                                              (widget.status ==
                                                                  3)) {
                                                            return Color(
                                                                0xFFFFE4E3);
                                                          } else {
                                                            return Color(
                                                                0xFFEAFFF4);
                                                          }
                                                        }())))))),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 5.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if ((widget.actionType == 2) &&
                                      (widget.status == 1)) {
                                    return Icon(
                                      FFIcons.kggCloseO,
                                      color: Color(0xFFF5A468),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 3) &&
                                      (widget.status == 1)) {
                                    return Icon(
                                      Icons.cancel_outlined,
                                      color: Color(0xFF4EB5FF),
                                      size: 24.0,
                                    );
                                  } else if ((widget.actionType == 1) &&
                                      (widget.status == 1)) {
                                    return Icon(
                                      FFIcons.kcomment,
                                      color: Color(0xFF3AC47D),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 4) &&
                                      (widget.status == 1)) {
                                    return Icon(
                                      Icons.cancel_outlined,
                                      color: Color(0xFFFF564E),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 4) &&
                                      (widget.status == 2)) {
                                    return Icon(
                                      FFIcons.kcomment,
                                      color: Color(0xFF3AC47D),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 2) &&
                                      (widget.status == 2)) {
                                    return Icon(
                                      FFIcons.kcomment,
                                      color: Color(0xFF3AC47D),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 3) &&
                                      (widget.status == 2)) {
                                    return Icon(
                                      FFIcons.kcomment,
                                      color: Color(0xFF3AC47D),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 1) &&
                                      (widget.status == 2)) {
                                    return Icon(
                                      FFIcons.kcomment,
                                      color: Color(0xFF3AC47D),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 4) &&
                                      (widget.status == 4)) {
                                    return Icon(
                                      FFIcons.kcomment,
                                      color: Color(0xFF3AC47D),
                                      size: 18.0,
                                    );
                                  } else if ((widget.actionType == 4) &&
                                      (widget.status == 3)) {
                                    return Icon(
                                      Icons.cancel_outlined,
                                      color: Color(0xFFFF564E),
                                      size: 18.0,
                                    );
                                  } else {
                                    return Icon(
                                      FFIcons.kcomment,
                                      color: Color(0xFF3AC47D),
                                      size: 18.0,
                                    );
                                  }
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${() {
                                          if ((widget.actionType == 1) &&
                                              (widget.status == 1)) {
                                            return 'No action marked';
                                          } else if ((widget.actionType ==
                                                  2) &&
                                              (widget.status == 1)) {
                                            return 'Escape theft marked';
                                          } else if ((widget.actionType ==
                                                  3) &&
                                              (widget.status == 1)) {
                                            return 'Theft stopped marked';
                                          } else if ((widget.actionType ==
                                                  4) &&
                                              (widget.status == 1)) {
                                            return 'Added to watchlist';
                                          } else if ((widget.actionType ==
                                                  4) &&
                                              (widget.status == 2)) {
                                            return 'Removed from watchlist';
                                          } else if ((widget.actionType ==
                                                  4) &&
                                              (widget.status == 3)) {
                                            return 'Added to watchlist';
                                          } else if ((widget.actionType ==
                                                  4) &&
                                              (widget.status == (4))) {
                                            return 'Removed from watchlist';
                                          } else {
                                            return 'vabdbvba';
                                          }
                                        }()}',
                                        style:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: valueOrDefault<Color>(
                                                    (widget.actionType == 1) &&
                                                            (widget.status ==
                                                                1)
                                                        ? Color(0xFF3AC47D)
                                                        : ((widget.actionType ==
                                                                    1) &&
                                                                (widget.status ==
                                                                    2)
                                                            ? Color(0xFF3AC47D)
                                                            : ((widget.actionType ==
                                                                        2) &&
                                                                    (widget.status ==
                                                                        1)
                                                                ? Color(
                                                                    0xFFF5A468)
                                                                : ((widget.actionType ==
                                                                            2) &&
                                                                        (widget.status ==
                                                                            2)
                                                                    ? Color(
                                                                        0xFF3AC47D)
                                                                    : ((widget.actionType ==
                                                                                3) &&
                                                                            (widget.status ==
                                                                                1)
                                                                        ? Color(
                                                                            0xFF4EB5FF)
                                                                        : ((widget.actionType == 3) &&
                                                                                (widget.status == 2)
                                                                            ? Color(0xFF3AC47D)
                                                                            : ((widget.actionType == 4) && (widget.status == 1)
                                                                                ? Color(0xFFFF564E)
                                                                                : () {
                                                                                    if ((widget.actionType == 4) && (widget.status == 2)) {
                                                                                      return Color(0xFF3AC47D);
                                                                                    } else if ((widget.actionType == 4) && (widget.status == (4))) {
                                                                                      return FlutterFlowTheme.of(context).secondary;
                                                                                    } else if ((widget.actionType == 4) && (widget.status == 3)) {
                                                                                      return FlutterFlowTheme.of(context).error;
                                                                                    } else {
                                                                                      return Color(0xFFEAFFF4);
                                                                                    }
                                                                                  }())))))),
                                                    Color(0xFFB05BCB),
                                                  ),
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                      ),
                                      TextSpan(
                                        text: ' by ${widget.name}',
                                        style:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: (widget.actionType ==
                                                              1) &&
                                                          (widget.status == 1)
                                                      ? Color(0xFF3AC47D)
                                                      : ((widget.actionType ==
                                                                  1) &&
                                                              (widget.status ==
                                                                  2)
                                                          ? Color(0xFF3AC47D)
                                                          : ((widget.actionType ==
                                                                      2) &&
                                                                  (widget.status ==
                                                                      1)
                                                              ? Color(
                                                                  0xFFF5A468)
                                                              : ((widget.actionType ==
                                                                          2) &&
                                                                      (widget.status ==
                                                                          2)
                                                                  ? Color(
                                                                      0xFF3AC47D)
                                                                  : ((widget.actionType ==
                                                                              3) &&
                                                                          (widget.status ==
                                                                              1)
                                                                      ? Color(
                                                                          0xFF4EB5FF)
                                                                      : ((widget.actionType == 3) &&
                                                                              (widget.status ==
                                                                                  2)
                                                                          ? Color(
                                                                              0xFF3AC47D)
                                                                          : ((widget.actionType == 4) && (widget.status == 1)
                                                                              ? Color(0xFFFF564E)
                                                                              : () {
                                                                                  if ((widget.actionType == 4) && (widget.status == 2)) {
                                                                                    return Color(0xFF3AC47D);
                                                                                  } else if ((widget.actionType == 4) && (widget.status == 3)) {
                                                                                    return FlutterFlowTheme.of(context).error;
                                                                                  } else if ((widget.actionType == 4) && (widget.status == 4)) {
                                                                                    return FlutterFlowTheme.of(context).secondary;
                                                                                  } else {
                                                                                    return Color(0xFFEAFFF4);
                                                                                  }
                                                                                }())))))),
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: valueOrDefault<Color>(
                                                (widget.actionType == 1) &&
                                                        (widget.status == 1)
                                                    ? Color(0xFF3AC47D)
                                                    : ((widget.actionType ==
                                                                1) &&
                                                            (widget.status ==
                                                                2)
                                                        ? Color(0xFF3AC47D)
                                                        : ((widget.actionType ==
                                                                    2) &&
                                                                (widget.status ==
                                                                    1)
                                                            ? Color(0xFFF5A468)
                                                            : ((widget.actionType ==
                                                                        2) &&
                                                                    (widget.status ==
                                                                        2)
                                                                ? Color(
                                                                    0xFF3AC47D)
                                                                : ((widget.actionType ==
                                                                            3) &&
                                                                        (widget.status ==
                                                                            1)
                                                                    ? Color(
                                                                        0xFF4EB5FF)
                                                                    : ((widget.actionType ==
                                                                                3) &&
                                                                            (widget.status ==
                                                                                2)
                                                                        ? Color(
                                                                            0xFF3AC47D)
                                                                        : ((widget.actionType == 4) &&
                                                                                (widget.status == 1)
                                                                            ? Color(0xFFFF564E)
                                                                            : () {
                                                                                if ((widget.actionType == 4) && (widget.status == 2)) {
                                                                                  return Color(0xFF3AC47D);
                                                                                } else if ((widget.actionType == 4) && (widget.status == 3)) {
                                                                                  return Color(0xFF3AC47D);
                                                                                } else if ((widget.actionType == 4) && (widget.status == 4)) {
                                                                                  return Color(0xFFFF564E);
                                                                                } else {
                                                                                  return Color(0xFFEAFFF4);
                                                                                }
                                                                              }())))))),
                                                Color(0xFFCD97DF),
                                              ),
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      if ((widget.actionType != 1) &&
                          (widget.comment != 'null'))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).info,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 12.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 35.0,
                                    height: 35.0,
                                    child: custom_widgets.UserAvatar(
                                      width: 35.0,
                                      height: 35.0,
                                      avatar: widget.avatar,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 5.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF818181),
                                                          fontSize: 9.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              if (FFAppState().userId ==
                                                  widget.userID)
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (widget.edited ==
                                                            false) {
                                                          return Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showAlignedDialog(
                                                                  barrierColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  isGlobal:
                                                                      false,
                                                                  avoidOverflow:
                                                                      false,
                                                                  targetAnchor: AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  followerAnchor: AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          EditWidget(
                                                                        action:
                                                                            () async {
                                                                          await widget
                                                                              .action
                                                                              ?.call();
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons.more_vert,
                                                                color: Color(
                                                                    0xFF515151),
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Text(
                                                            'Edited',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Text(
                                              widget.comment!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF464646),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ),
        ],
      ),
    );
  }
}
