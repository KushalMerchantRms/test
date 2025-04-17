import '/components/supicios_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'demo_model.dart';
export 'demo_model.dart';

class DemoWidget extends StatefulWidget {
  const DemoWidget({super.key});

  @override
  State<DemoWidget> createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget> {
  late DemoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemoModel());

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

    return Stack(
      children: [
        Builder(
          builder: (context) {
            final demo = FFAppState().IncidetData.toList();

            return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: demo.length,
              separatorBuilder: (_, __) => SizedBox(height: 20.0),
              itemBuilder: (context, demoIndex) {
                final demoItem = demo[demoIndex];
                return Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                );
              },
              controller: _model.listViewController,
            );
          },
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: wrapWithModel(
            model: _model.supiciosModel,
            updateCallback: () => safeSetState(() {}),
            child: SupiciosWidget(),
          ),
        ),
      ],
    );
  }
}
