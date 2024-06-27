import '/flutter_flow/flutter_flow_util.dart';
import 'webview_product_widget.dart' show WebviewProductWidget;
import 'package:flutter/material.dart';

class WebviewProductModel extends FlutterFlowModel<WebviewProductWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
