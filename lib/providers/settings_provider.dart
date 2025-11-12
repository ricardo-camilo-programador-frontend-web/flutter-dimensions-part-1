import 'package:flutter/foundation.dart';

class SettingsProvider with ChangeNotifier {
  bool highContrast = false;
  bool reducedMotion = false;
  bool accessibleFonts = true;

  void toggleHighContrast() {
    highContrast = !highContrast;
    notifyListeners();
  }

  void toggleReducedMotion() {
    reducedMotion = !reducedMotion;
    notifyListeners();
  }

  void toggleAccessibleFonts() {
    accessibleFonts = !accessibleFonts;
    notifyListeners();
  }
}
