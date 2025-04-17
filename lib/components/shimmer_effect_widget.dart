import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'shimmer_effect_model.dart';
export 'shimmer_effect_model.dart';

class ShimmerEffectWidget extends StatefulWidget {
  const ShimmerEffectWidget({
    super.key,
    this.dataItem,
    this.indexInList,
  });

  final dynamic dataItem;
  final int? indexInList;

  @override
  State<ShimmerEffectWidget> createState() => _ShimmerEffectWidgetState();
}

class _ShimmerEffectWidgetState extends State<ShimmerEffectWidget> {
  late ShimmerEffectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerEffectModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Lottie.network(
        'https://lottie.host/2fdef133-4ad2-4f68-8da2-55f7bab985a2/LjNBrCgUOK.lottie',
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        fit: BoxFit.fill,
        animate: true,
      ),
    );
  }
}
