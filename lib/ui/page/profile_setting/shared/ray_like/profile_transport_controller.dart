import 'package:flutter/material.dart';

class ProfileTransportController {
  final TextEditingController transportController;
  final TextEditingController subTypeController;
  final TextEditingController hostController;
  final TextEditingController pathController;
  final TextEditingController xhttpExtraController;

  ProfileTransportController({
    String transport = '',
    String subType = '',
    String host = '',
    String path = '',
    String xhttpExtra = '',
  }) : transportController = TextEditingController(text: transport),
       subTypeController = TextEditingController(text: subType),
       hostController = TextEditingController(text: host),
       pathController = TextEditingController(text: path),
       xhttpExtraController = TextEditingController(text: xhttpExtra);

  void dispose() {
    transportController.dispose();
    subTypeController.dispose();
    hostController.dispose();
    pathController.dispose();
    xhttpExtraController.dispose();
  }

  String get transport => transportController.text;
  String get subType => subTypeController.text;
  String get host => hostController.text;
  String get path => pathController.text;
  String get xhttpExtra => xhttpExtraController.text;
}
