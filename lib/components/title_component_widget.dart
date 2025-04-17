import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'title_component_model.dart';
export 'title_component_model.dart';

class TitleComponentWidget extends StatefulWidget {
  const TitleComponentWidget({super.key});

  @override
  State<TitleComponentWidget> createState() => _TitleComponentWidgetState();
}

class _TitleComponentWidgetState extends State<TitleComponentWidget> {
  late TitleComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TitleComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              'assets/images/visu.ai-svglogo.svg',
              width: 200.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
              alignment: Alignment(0.0, 0.0),
            ),
          ),
        ],
      ),
    );
  }
}
