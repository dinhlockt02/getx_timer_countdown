import 'dart:async';

import 'package:get/get.dart';
import 'ticker.dart';

enum TimerState { initial, running, paused, finished }

class CountdownTimerController extends GetxController {
  final _ticker = const Ticker();
  StreamSubscription<int>? _subscription;
  static const _duration = 60;
  final currentDuration = _duration.obs;
  final timerState = TimerState.initial.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTimerStarted() {
    timerState.value = TimerState.running;
    _subscription = _ticker.tick(ticks: _duration).listen((duration) {
      currentDuration.value = duration;
      if (currentDuration.value == 0) {
        timerState.value = TimerState.finished;
      }
    });
  }

  void onTimerPaused() {
    timerState.value = TimerState.paused;
    _subscription?.pause();
  }

  void onTimerResumed() {
    timerState.value = TimerState.running;
    _subscription?.resume();
  }

  void onTimerReseted() {
    timerState.value = TimerState.initial;
    currentDuration.value = _duration;
    _subscription?.cancel();
  }

  void onTimerCompleted() {
    timerState.value = TimerState.finished;
    _subscription?.cancel();
  }
}
