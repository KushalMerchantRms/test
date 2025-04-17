import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'check_box_notification_model.dart';
export 'check_box_notification_model.dart';

class CheckBoxNotificationWidget extends StatefulWidget {
  const CheckBoxNotificationWidget({
    super.key,
    required this.enable,
    this.action,
    this.actionOff,
  });

  final bool? enable;
  final Future Function()? action;
  final Future Function()? actionOff;

  @override
  State<CheckBoxNotificationWidget> createState() =>
      _CheckBoxNotificationWidgetState();
}

class _CheckBoxNotificationWidgetState
    extends State<CheckBoxNotificationWidget> {
  late CheckBoxNotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckBoxNotificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
      ),
      child: Checkbox(
        value: _model.checkboxValue ??= true,
        onChanged: (newValue) async {
          safeSetState(() => _model.checkboxValue = newValue!);
          if (newValue!) {
            await widget.action?.call();
          } else {
            await widget.actionOff?.call();
          }
        },
        side: BorderSide(
          width: 2,
          color: FlutterFlowTheme.of(context).alternate,
        ),
        activeColor: FlutterFlowTheme.of(context).primary,
        checkColor: FlutterFlowTheme.of(context).info,
      ),
    );
  }
}
