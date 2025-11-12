import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AbismoTheme {
  static const Color black = Color(0xFF0A0A0A);
  static const Color bloodRed = Color(0xFF8B0000);
  static const Color darkRed = Color(0xFF660000);
  static const Color deadGray = Color(0xFF2F2F2F);
  static const Color lightGray = Color(0xFF4A4A4A);
  static const Color ghostWhite = Color(0xFFF5F5F5);
  static const Color toxicGreen = Color(0xFF32CD32);
  static const Color abyssOrange = Color(0xFFFF4500);

  static ThemeData theme(bool highContrast) {
    final base = ThemeData.dark();
    final colorScheme = ColorScheme.fromSeed(
      seedColor: bloodRed,
      brightness: Brightness.dark,
      primary: bloodRed,
      secondary: darkRed,
      surface: deadGray,
      background: black,
      onPrimary: ghostWhite,
      onSecondary: ghostWhite,
      onSurface: ghostWhite,
      onBackground: ghostWhite,
      error: abyssOrange,
      onError: ghostWhite,
    );
    final textTheme = GoogleFonts.playfairDisplayTextTheme(
      base.textTheme.apply(
        bodyColor: ghostWhite,
        displayColor: ghostWhite,
      ),
    ).copyWith(
      headlineLarge: GoogleFonts.creepster(fontSize: 48, color: ghostWhite),
      headlineMedium: GoogleFonts.creepster(fontSize: 32, color: ghostWhite),
      titleLarge: GoogleFonts.creepster(fontSize: 24, color: ghostWhite),
      bodyLarge: GoogleFonts.inter(fontSize: 16, color: ghostWhite),
      bodyMedium: GoogleFonts.inter(fontSize: 14, color: ghostWhite),
      bodySmall: GoogleFonts.inter(fontSize: 12, color: ghostWhite),
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: black,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: black,
        foregroundColor: ghostWhite,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: bloodRed,
          foregroundColor: ghostWhite,
          shape: const StadiumBorder(),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(toxicGreen),
      ),
      sliderTheme: const SliderThemeData(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      brightness: Brightness.dark,
    ).copyWith(
      extensions: <ThemeExtension<dynamic>>[
        _AbismoColors(
          fogStart: darkRed.withOpacity(highContrast ? 0.1 : 0.25),
          fogEnd: bloodRed.withOpacity(highContrast ? 0.1 : 0.4),
          glow: bloodRed,
        ),
      ],
    );
  }
}

class _AbismoColors extends ThemeExtension<_AbismoColors> {
  final Color fogStart;
  final Color fogEnd;
  final Color glow;

  const _AbismoColors({required this.fogStart, required this.fogEnd, required this.glow});

  @override
  _AbismoColors copyWith({Color? fogStart, Color? fogEnd, Color? glow}) {
    return _AbismoColors(
      fogStart: fogStart ?? this.fogStart,
      fogEnd: fogEnd ?? this.fogEnd,
      glow: glow ?? this.glow,
    );
  }

  @override
  _AbismoColors lerp(ThemeExtension<_AbismoColors>? other, double t) {
    if (other is! _AbismoColors) return this;
    return _AbismoColors(
      fogStart: Color.lerp(fogStart, other.fogStart, t)!,
      fogEnd: Color.lerp(fogEnd, other.fogEnd, t)!,
      glow: Color.lerp(glow, other.glow, t)!,
    );
  }
}
