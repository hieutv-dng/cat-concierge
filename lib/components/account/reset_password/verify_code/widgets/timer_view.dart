/*
 * File: timer_view.dart
 * File Created: Sunday, 19th February 2023 12:57:44 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 19th February 2023 12:58:17 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/core/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class TimerView extends StatefulWidget {
  const TimerView({
    Key? key,
  }) : super(key: key);

  @override
  State<TimerView> createState() => TimerViewState();
}

class TimerViewState extends State<TimerView> {
  late final CountdownTimerController _timerController;

  @override
  void initState() {
    _timerController = CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 300);
    _timerController.start();
    super.initState();
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CountdownTimer(
      controller: _timerController,
      widgetBuilder: (_, time) {
        final format = NumberFormat('00');
        final timeLabel = time == null
            ? ''
            : time.min == null
                ? '00:${time.sec}'
                : '${format.format(time.min)}:${format.format(time.sec)}';
        return RichText(
          text: TextSpan(
            text: 'Resend code in ',
            children: [
              TextSpan(
                text: timeLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
            style: theme.textTheme.labelMedium,
          ),
        );
      },
    );
  }
}
