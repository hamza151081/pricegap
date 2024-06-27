import '/flutter_flow/flutter_flow_util.dart';
import '/product/card17_location/card17_location_widget.dart';
import 'details_widget.dart' show DetailsWidget;
import 'package:flutter/material.dart';

class DetailsModel extends FlutterFlowModel<DetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Card17Location component.
  late Card17LocationModel card17LocationModel;

  @override
  void initState(BuildContext context) {
    card17LocationModel = createModel(context, () => Card17LocationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    card17LocationModel.dispose();
  }
}
