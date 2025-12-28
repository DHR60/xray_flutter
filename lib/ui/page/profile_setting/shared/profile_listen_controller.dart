import 'package:flutter/material.dart';
import 'package:xray_flutter/data/db/app_database.dart';

class ProfileListenController {
  final TextEditingController addressController;
  final TextEditingController portController;

  ProfileListenController({String address = '', int port = 0})
    : addressController = TextEditingController(text: address),
      portController = TextEditingController(text: port.toString());

  ProfileListenController.fromData(ProfileItemData data)
    : addressController = TextEditingController(text: data.address),
      portController = TextEditingController(text: data.port.toString());

  void dispose() {
    addressController.dispose();
    portController.dispose();
  }

  String get addressText => addressController.text;
  int get portValue => int.tryParse(portController.text) ?? 0;
}
