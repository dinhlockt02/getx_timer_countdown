import 'package:get/instance_manager.dart';
import 'package:getx_timer/app/modules/countdown_timer/countdown_timer_controller.dart';

class CountdownTimerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountdownTimerController());
  }
}
