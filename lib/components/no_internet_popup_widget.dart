import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'no_internet_popup_model.dart';
export 'no_internet_popup_model.dart';

class NoInternetPopupWidget extends StatefulWidget {
  const NoInternetPopupWidget({super.key});

  @override
  State<NoInternetPopupWidget> createState() => _NoInternetPopupWidgetState();
}

class _NoInternetPopupWidgetState extends State<NoInternetPopupWidget> {
  late NoInternetPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoInternetPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return custom_widgets.PreventDismissPopup(
      width: double.infinity,
      height: double.infinity,
    );
  }
}
