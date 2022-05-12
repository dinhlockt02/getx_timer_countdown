import 'package:get/route_manager.dart';
import 'package:getx_timer/app/modules/countdown_timer/countdown_timer_binding.dart';
import 'package:getx_timer/app/modules/countdown_timer/countdown_timer_page.dart';
import 'package:getx_timer/routes/routes.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.CountDownTimerPage,
        page: () => CountDownTimerPage(),
        binding: CountdownTimerBinding())
  ];
}
