import 'dart:async';

abstract class CoreProcess {
  Stream<String> get out;
  Stream<String> get err;
  Future<void> stop();
}
