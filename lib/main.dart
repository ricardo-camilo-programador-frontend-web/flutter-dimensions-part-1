import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'providers/settings_provider.dart';
import 'providers/alarm_provider.dart';
import 'providers/sound_provider.dart';
import 'providers/stats_provider.dart';
import 'screens/lock_screen.dart';
import 'screens/app_home_screen.dart';
import 'screens/alarms_screen.dart';
import 'screens/sounds_library_screen.dart';
import 'screens/wake_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const AbismoApp());
}

class AbismoApp extends StatelessWidget {
  const AbismoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => AlarmProvider()),
        ChangeNotifierProvider(create: (_) => SoundProvider()),
        ChangeNotifierProvider(create: (_) => StatsProvider()),
      ],
      child: Consumer<SettingsProvider>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'Gritos do Abismo',
            theme: AbismoTheme.theme(settings.highContrast),
            initialRoute: '/',
            routes: {
              '/': (ctx) => const LockScreen(),
              '/home': (ctx) => const AppHomeScreen(),
              '/alarms': (ctx) => const AlarmsScreen(),
              '/sounds': (ctx) => const SoundsLibraryScreen(),
              '/wake': (ctx) => const WakeScreen(),
              '/settings': (ctx) => const SettingsScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
