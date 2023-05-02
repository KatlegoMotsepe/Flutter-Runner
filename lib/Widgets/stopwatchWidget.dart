import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/stopwatchModel.dart';

import 'dart:async';

/// DPStopWatchWidget
class DPStopWatchWidget extends StatefulWidget {
  final DPStopwatchViewModel viewModel;
  const DPStopWatchWidget(this.viewModel, {Key? key}) : super(key: key);

  @override
  _ChallengesStopWatchWidgetState createState() =>
      _ChallengesStopWatchWidgetState();
}

class _ChallengesStopWatchWidgetState extends State<DPStopWatchWidget> {
  /// Properties
  StreamSubscription<int>? _timerSubscription;
  Stream<int>? _timerStream;
  final defaultClockTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  /// Life Cycle
  @override
  void initState() {
    widget.viewModel.start = start;
    widget.viewModel.pause = pause;
    widget.viewModel.resume = resume;
    widget.viewModel.stop = stop;
    super.initState();
  }

  @override
  void dispose() {
    if (_timerSubscription != null) {
      _timerSubscription?.cancel();
    }
    _timerStream = null;
    widget.viewModel.start = null;
    widget.viewModel.pause = null;
    widget.viewModel.resume = null;
    widget.viewModel.stop = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.viewModel.clockText,
          style: widget.viewModel.clockTextStyle ?? defaultClockTextStyle,
        ),
      ],
    );
  }

  /// Actions
  start() {
    if (_timerStream != null) {
      return;
    }
    _timerStream = widget.viewModel.stopWatchStream();
    _timerSubscription = _timerStream?.listen((int value) {
      setState(() {
        widget.viewModel.currentTenMilliseconds = value;
      });
    });
  }

  pause() {
    _timerSubscription?.pause();
    setState(() {});
  }

  resume() {
    _timerSubscription?.resume();
    setState(() {});
  }

  stop() {
    _timerSubscription?.cancel();
    _timerStream = null;
    setState(() {
      widget.viewModel.currentTenMilliseconds =
          widget.viewModel.startWithTenMilliseconds ?? 0;
    });
  }
}
