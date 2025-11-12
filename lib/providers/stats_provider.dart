import 'package:flutter/foundation.dart';

class StatsProvider with ChangeNotifier {
  int streakDias = 0;
  int despertaresBemSucedidos = 0;
  int tempoMedioPararSegundos = 0;

  void registrarDespertar({required int tempoSegundos}) {
    despertaresBemSucedidos++;
    tempoMedioPararSegundos = (
      ((tempoMedioPararSegundos * (despertaresBemSucedidos - 1)) + tempoSegundos) /
      despertaresBemSucedidos
    ).round();
    notifyListeners();
  }

  void incrementarStreak() {
    streakDias++;
    notifyListeners();
  }
}
