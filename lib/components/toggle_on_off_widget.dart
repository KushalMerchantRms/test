import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'toggle_on_off_model.dart';
export 'toggle_on_off_model.dart';

class ToggleOnOffWidget extends StatefulWidget {
  const ToggleOnOffWidget({
    super.key,
    this.toggle,
    this.actionOn,
    this.actionOff,
  });

  final bool? toggle;
  final Future Function()? actionOn;
  final Future Function()? actionOff;

  @override
  State<ToggleOnOffWidget> createState() => _ToggleOnOffWidgetState();
}

class _ToggleOnOffWidgetState extends State<ToggleOnOffWidget> {
  late ToggleOnOffModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToggleOnOffModel());

    _model.switchValue = widget.toggle!;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        safeSetState(() => _model.switchValue = newValue);
        if (newValue) {
          await widget.actionOn?.call();
        } else {
          await widget.actionOff?.call();
        }
      },
      activeColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: FlutterFlowTheme.of(context).primary,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
    );
  }
}
