import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'block_list_screen_widget.dart' show BlockListScreenWidget;
import 'package:flutter/material.dart';

class BlockListScreenModel extends FlutterFlowModel<BlockListScreenWidget> {
  ///  Local state fields for this page.

  int? index;

  int currentOffset = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in BlockListScreen widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in BlockListScreen widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Backend Call - API (BlackList)] action in BlockListScreen widget.
  ApiCallResponse? apiResultdib;
  // Stores action output result for [Backend Call - API (Black list count)] action in BlockListScreen widget.
  ApiCallResponse? apiResultcdc;
  // Stores action output result for [Backend Call - API (getAvatar)] action in BlockListScreen widget.
  ApiCallResponse? apiResultnuu3;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Stores action output result for [Backend Call - API (BlackList)] action in Button widget.
  ApiCallResponse? apiResultdib3d;
  // Stores action output result for [Backend Call - API (Black list count)] action in Button widget.
  ApiCallResponse? apiResultcdc3d;
  // Stores action output result for [Backend Call - API (BlackList)] action in Button widget.
  ApiCallResponse? apiResultdib7d;
  // Stores action output result for [Backend Call - API (Black list count)] action in Button widget.
  ApiCallResponse? apiResultcdc7d;
  // Stores action output result for [Backend Call - API (BlackList)] action in Button widget.
  ApiCallResponse? apiResultdib2w;
  // Stores action output result for [Backend Call - API (Black list count)] action in Button widget.
  ApiCallResponse? apiResultcdc2w;
  // Stores action output result for [Backend Call - API (BlackList)] action in Button widget.
  ApiCallResponse? apiResultdib30d;
  // Stores action output result for [Backend Call - API (Black list count)] action in Button widget.
  ApiCallResponse? apiResultcdc30d;
  // Stores action output result for [Backend Call - API (BlackList)] action in LazyLoaderWidgetBlackList widget.
  ApiCallResponse? apiResultdib2;
  // Model for BottomNavigation component.
  late BottomNavigationModel bottomNavigationModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    bottomNavigationModel = createModel(context, () => BottomNavigationModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    bottomNavigationModel.dispose();
  }
}
