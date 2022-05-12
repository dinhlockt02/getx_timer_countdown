import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_timer/app/modules/countdown_timer/countdown_timer_controller.dart';

class CountDownTimerPage extends StatelessWidget {
  const CountDownTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countdownTimerController = Get.find<CountdownTimerController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Countdown Timer')),
      body: Obx(
        () => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                countdownTimerController.currentDuration.value.toString(),
                style: TextStyle(fontSize: 54),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (countdownTimerController.timerState.value ==
                      TimerState.initial) ...[
                    IconButton(
                      onPressed: () {
                        countdownTimerController.onTimerStarted();
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 36,
                      ),
                    )
                  ],
                  if (countdownTimerController.timerState.value ==
                      TimerState.running) ...[
                    IconButton(
                      onPressed: () {
                        countdownTimerController.onTimerPaused();
                      },
                      icon: const Icon(
                        Icons.pause,
                        size: 36,
                      ),
                    )
                  ],
                  if (countdownTimerController.timerState.value ==
                      TimerState.paused) ...[
                    IconButton(
                      onPressed: () {
                        countdownTimerController.onTimerResumed();
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 36,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        countdownTimerController.onTimerReseted();
                      },
                      icon: const Icon(
                        Icons.replay,
                        size: 36,
                      ),
                    )
                  ],
                  if (countdownTimerController.timerState.value ==
                      TimerState.finished) ...[
                    IconButton(
                      onPressed: () {
                        countdownTimerController.onTimerReseted();
                      },
                      icon: const Icon(
                        Icons.replay,
                        size: 36,
                      ),
                    )
                  ]
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
