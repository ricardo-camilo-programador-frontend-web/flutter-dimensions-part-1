import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/alarm.dart';

class AlarmProvider with ChangeNotifier {
  final List<Alarm> _alarms = [];

  List<Alarm> get alarms => List.unmodifiable(_alarms);

  void add(Alarm alarm) {
    _alarms.add(alarm);
    notifyListeners();
  }

  void update(String id, Alarm updated) {
    final i = _alarms.indexWhere((a) => a.id == id);
    if (i != -1) {
      _alarms[i] = updated;
      notifyListeners();
    }
  }

  void remove(String id) {
    _alarms.removeWhere((a) => a.id == id);
    notifyListeners();
  }

  void toggleActive(String id) {
    final i = _alarms.indexWhere((a) => a.id == id);
    if (i != -1) {
      final a = _alarms[i];
      _alarms[i] = Alarm(
        id: a.id,
        time: a.time,
        name: a.name,
        active: !a.active,
        repeatDays: a.repeatDays,
        soundId: a.soundId,
        mode: a.mode,
        volume: a.volume,
        vibration: a.vibration,
        snoozeMinutes: a.snoozeMinutes,
      );
      notifyListeners();
    }
  }
}
