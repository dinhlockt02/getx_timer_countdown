import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'routes/pages.dart';
import 'routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.CountDownTimerPage,
    getPages: Pages.pages,
  ));
}
