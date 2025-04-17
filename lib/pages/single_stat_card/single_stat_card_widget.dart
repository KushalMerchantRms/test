import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'single_stat_card_model.dart';
export 'single_stat_card_model.dart';

class SingleStatCardWidget extends StatefulWidget {
  const SingleStatCardWidget({
    super.key,
    String? title,
    int? number,
    Color? statsColor,
  })  : this.title = title ?? 'Tag',
        this.number = number ?? 0,
        this.statsColor = statsColor ?? const Color(0xFF5F1178);

  final String title;
  final int number;
  final Color statsColor;

  @override
  State<SingleStatCardWidget> createState() => _SingleStatCardWidgetState();
}

class _SingleStatCardWidgetState extends State<SingleStatCardWidget> {
  late SingleStatCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleStatCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).supportiveText,
                      fontSize: 9.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.number.toString(),
                '0',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: widget.statsColor,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ].divide(SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
