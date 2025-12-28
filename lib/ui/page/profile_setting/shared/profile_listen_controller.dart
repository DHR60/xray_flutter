import 'package:flutter/material.dart';

class ProfileListenController {
  final TextEditingController addressController;
  final TextEditingController portController;

  ProfileListenController({String address = '', int port = 0})
    : addressController = TextEditingController(text: address),
      portController = TextEditingController(text: port.toString());

  void dispose() {
    addressController.dispose();
    portController.dispose();
  }
  String get addressText => addressController.text;
  int get portValue => int.tryParse(portController.text) ?? 0;
}
