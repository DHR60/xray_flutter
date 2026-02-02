import 'package:json_field_editor/json_field_editor.dart';
import 'package:xray_flutter/data/db/app_database.dart';

class ProfileFinalmaskController {
  final JsonTextFieldController finalmaskController;

  ProfileFinalmaskController({String finalmask = ''})
    : finalmaskController = JsonTextFieldController()..text = finalmask;

  ProfileFinalmaskController.fromData(ProfileItemData data)
    : finalmaskController = JsonTextFieldController()..text = data.finalmask;

  void dispose() {
    finalmaskController.dispose();
  }

  String get finalmask => finalmaskController.text;
}
