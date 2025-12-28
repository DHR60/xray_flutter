import 'package:flutter/material.dart';

class ProfileSecurityController {
  final TextEditingController securityController;
  final TextEditingController sniController;
  final TextEditingController utlsFingerprintController;
  final TextEditingController alpnController;
  final TextEditingController allowInsecureController;

  final TextEditingController realityPbkController;
  final TextEditingController realityShortIdController;
  final TextEditingController realitySpdxController;
  final TextEditingController mldsa65VerController;

  ProfileSecurityController({
    String security = '',
    String sni = '',
    String utlsFingerprint = '',
    String alpn = '',
    String allowInsecure = '',
    String realityPbk = '',
    String realityShortId = '',
    String realitySpdx = '',
    String mldsa65Ver = '',
  }) : securityController = TextEditingController(text: security),
       sniController = TextEditingController(text: sni),
       utlsFingerprintController = TextEditingController(text: utlsFingerprint),
       alpnController = TextEditingController(text: alpn),
       allowInsecureController = TextEditingController(text: allowInsecure),
       realityPbkController = TextEditingController(text: realityPbk),
       realityShortIdController = TextEditingController(text: realityShortId),
       realitySpdxController = TextEditingController(text: realitySpdx),
       mldsa65VerController = TextEditingController(text: mldsa65Ver);

  void dispose() {
    securityController.dispose();
    sniController.dispose();
    utlsFingerprintController.dispose();
    alpnController.dispose();
    allowInsecureController.dispose();
    realityPbkController.dispose();
    realityShortIdController.dispose();
    realitySpdxController.dispose();
    mldsa65VerController.dispose();
  }

  String get security => securityController.text;
  String get sni => sniController.text;
  String get utlsFingerprint => utlsFingerprintController.text;
  String get alpn => alpnController.text;
  String get allowInsecure => allowInsecureController.text;
  String get realityPbk => realityPbkController.text;
  String get realityShortId => realityShortIdController.text;
  String get realitySpdx => realitySpdxController.text;
  String get mldsa65Ver => mldsa65VerController.text;
}
