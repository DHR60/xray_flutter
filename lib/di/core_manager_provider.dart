import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xray_flutter/core/app_runtime.dart';
import 'package:xray_flutter/domain/service/core/core_manager.dart';

part 'core_manager_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<CoreStatus> coreStatus(Ref ref) {
  final manager = AppRuntime.instance.coreManager;
  return manager.statusStream;
}

@Riverpod(keepAlive: true)
Stream<String> mainCoreLogOutErr(Ref ref) {
  final manager = AppRuntime.instance.coreManager;

  return Stream<String>.multi((multi) {
    final outSub = manager.mainLogOut.listen(
      multi.add,
      onError: multi.addError,
      onDone: () {},
    );

    final errSub = manager.mainLogErr.listen(
      multi.add,
      onError: multi.addError,
      onDone: () {},
    );

    multi.onCancel = () {
      outSub.cancel();
      errSub.cancel();
    };
  });
}
