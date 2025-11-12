import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/stats_provider.dart';

class WakeScreen extends StatefulWidget {
  const WakeScreen({super.key});
  @override
  State<WakeScreen> createState() => _WakeScreenState();
}

class _WakeScreenState extends State<WakeScreen> with TickerProviderStateMixin {
  late final AnimationController _fog;
  int seconds = 0;
  int stateIndex = 0;

  @override
  void initState() {
    super.initState();
    _fog = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
    Future.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return t.cancel();
      setState(() => seconds++);
      if (seconds == 30 && stateIndex == 1) setState(() => stateIndex = 2);
      return null;
    });
    stateIndex = 1;
  }

  @override
  void dispose() {
    _fog.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: stateIndex == 1 ? const Color(0xFF660000) : const Color(0xFF8B0000),
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _fog,
            builder: (context, _) {
              return Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF8B0000).withOpacity(0.2 + 0.2 * _fog.value),
                      const Color(0xFF0A0A0A).withOpacity(0.4 + 0.2 * (1 - _fog.value)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(stateIndex == 1 ? 'DESPERTAR' : 'MODO PÂNICO', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.read<StatsProvider>().registrarDespertar(tempoSegundos: seconds);
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Text('PARAR'),
                ),
              ),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.vibration)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.lock)),
              ])
            ],
          ),
        ),
      ]),
    );
  }
}
