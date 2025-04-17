import '/flutter_flow/flutter_flow_util.dart';
import '/pages/badges/incidents_badge/incidents_badge_widget.dart';
import '/pages/single_stat_card/single_stat_card_widget.dart';
import 'store_card_standalone_widget.dart' show StoreCardStandaloneWidget;
import 'package:flutter/material.dart';

class StoreCardStandaloneModel
    extends FlutterFlowModel<StoreCardStandaloneWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for incidents_badge component.
  late IncidentsBadgeModel incidentsBadgeModel;
  // Model for single_stat_card component.
  late SingleStatCardModel singleStatCardModel1;
  // Model for single_stat_card component.
  late SingleStatCardModel singleStatCardModel2;
  // Model for single_stat_card component.
  late SingleStatCardModel singleStatCardModel3;

  @override
  void initState(BuildContext context) {
    incidentsBadgeModel = createModel(context, () => IncidentsBadgeModel());
    singleStatCardModel1 = createModel(context, () => SingleStatCardModel());
    singleStatCardModel2 = createModel(context, () => SingleStatCardModel());
    singleStatCardModel3 = createModel(context, () => SingleStatCardModel());
  }

  @override
  void dispose() {
    incidentsBadgeModel.dispose();
    singleStatCardModel1.dispose();
    singleStatCardModel2.dispose();
    singleStatCardModel3.dispose();
  }
}
