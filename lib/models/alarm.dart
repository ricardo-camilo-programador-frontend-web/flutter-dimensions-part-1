import 'package:flutter/material.dart';

enum AbismoMode { normal, avancado, panico }
enum VibrationPattern { coracao, abismo, panico }

class Alarm {
  final String id;
  final TimeOfDay time;
  final String name;
  final bool active;
  final List<int> repeatDays;
  final String soundId;
  final AbismoMode mode;
  final double volume;
  final VibrationPattern vibration;
  final int snoozeMinutes;

  Alarm({
    required this.id,
    required this.time,
    required this.name,
    this.active = true,
    this.repeatDays = const [],
    required this.soundId,
    this.mode = AbismoMode.normal,
    this.volume = 0.8,
    this.vibration = VibrationPattern.abismo,
    this.snoozeMinutes = 10,
  });
}
