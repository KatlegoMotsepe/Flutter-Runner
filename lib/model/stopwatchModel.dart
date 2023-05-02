import 'package:flutter/material.dart';
import 'dart:async';

/// DPStopwatchViewModel
class DPStopwatchViewModel {
  /// Stored properties
  Timer? timer;
  int? startWithTenMilliseconds;
  TextStyle? clockTextStyle;
  int currentTenMilliseconds = 0;

  /// Actions
  Function? start;
  Function? pause;
  Function? resume;
  Function? stop;

  /// Computed properties
  String get clockText => "$minutesStr:$secondsStr.$tenMillisecondsStr";
  String get minutesStr => ((currentTenMilliseconds / (60 * 100)) % 60)
      .floor()
      .toString()
      .padLeft(2, '0');
  String get secondsStr =>
      ((currentTenMilliseconds / 100) % 60).floor().toString().padLeft(2, '0');
  String get tenMillisecondsStr =>
      (currentTenMilliseconds % 100).floor().toString().padLeft(2, '0');
  bool get isInitialized => start != null;

  DPStopwatchViewModel({
    this.startWithTenMilliseconds,
    this.clockTextStyle,
  }) : currentTenMilliseconds = startWithTenMilliseconds ?? 0;

  /// stop watch stream
  Stream<int> stopWatchStream() {
    StreamController<int>? streamController;
    Duration timerInterval = const Duration(milliseconds: 10);
    int counter = startWithTenMilliseconds ?? 0;

    /// Private
    _tick(_) {
      counter++;
      streamController?.add(counter);
    }

    _startTimer() {
      timer ??= Timer.periodic(timerInterval, _tick);
    }

    _stopTimer() {
      if (timer != null) {
        timer?.cancel();
        timer = null;
        counter = startWithTenMilliseconds ?? 0;
        streamController?.close();
      }
    }

    _pauseTimer() {
      if (timer != null) {
        timer?.cancel();
      }
    }

    _resumeTimer() {
      if (timer != null) {
        timer = Timer.periodic(timerInterval, _tick);
      }
    }

    streamController = StreamController<int>(
      onListen: _startTimer,
      onPause: _pauseTimer,
      onResume: _resumeTimer,
      onCancel: _stopTimer,
    );

    return streamController.stream;
  }
}
