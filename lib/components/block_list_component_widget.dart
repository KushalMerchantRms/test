import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'block_list_component_model.dart';
export 'block_list_component_model.dart';

class BlockListComponentWidget extends StatefulWidget {
  const BlockListComponentWidget({
    super.key,
    this.actionType,
    this.name,
    this.time,
    this.comment,
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
  State<BlockListComponentWidget> createState() =>
      _BlockListComponentWidgetState();
}

class _BlockListComponentWidgetState extends State<BlockListComponentWidget> {
  late BlockListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return custom_widgets.CustomComponent(
      width: double.infinity,
      height: 200.0,
      name: widget.name,
      actionType: widget.actionType,
      time: widget.time,
      comment: widget.comment,
      avatar: widget.avatar,
      status: widget.status,
      edited: widget.edited,
      userID: widget.userID,
      action: () async {
        await widget.action?.call();
      },
    );
  }
}
