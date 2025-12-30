import 'dart:async';

abstract class CoreProcess {
  Stream<String> get out;
  Stream<String> get err;
  Stream<int> get exitCode;
  Future<void> stop();
}
