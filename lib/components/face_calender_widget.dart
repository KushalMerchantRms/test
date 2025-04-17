import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'face_calender_model.dart';
export 'face_calender_model.dart';

class FaceCalenderWidget extends StatefulWidget {
  const FaceCalenderWidget({
    super.key,
    required this.fromDate,
  });

  final Future Function()? fromDate;

  @override
  State<FaceCalenderWidget> createState() => _FaceCalenderWidgetState();
}

class _FaceCalenderWidgetState extends State<FaceCalenderWidget> {
  late FaceCalenderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaceCalenderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 360.0,
        child: custom_widgets.CustomCalendarFace(
          width: double.infinity,
          height: 360.0,
          fromDate: () async {
            await widget.fromDate?.call();
          },
        ),
      ),
    );
  }
}
