import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _pulse = Tween<double>(begin: 0.95, end: 1.05).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final time = TimeOfDay.fromDateTime(now);
    final dateStr = '${_weekday(now.weekday)}, ${now.day.toString().padLeft(2, '0')} de ${_month(now.month)}';

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A0A0A), Color(0xFF2F2F2F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('GRITOS DO ABISMO', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                Text(time.format(context), style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text(dateStr, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 16),
                Text('ALARME ATIVO - 07:30', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 32),
                ScaleTransition(
                  scale: _pulse,
                  child: Semantics(
                    button: true,
                    label: 'Despertar agora',
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/wake'),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                        child: Text('DESPERTAR AGORA'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.wifi, color: Color(0xFFF5F5F5)),
                  Icon(Icons.battery_full, color: Color(0xFFF5F5F5)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Text('Swipe up para desbloquear', style: Theme.of(context).textTheme.bodySmall),
            ),
          )
        ],
      ),
    );
  }

  String _weekday(int w) {
    switch (w) {
      case 1:
        return 'Segunda-feira';
      case 2:
        return 'Terça-feira';
      case 3:
        return 'Quarta-feira';
      case 4:
        return 'Quinta-feira';
      case 5:
        return 'Sexta-feira';
      case 6:
        return 'Sábado';
      default:
        return 'Domingo';
    }
  }

  String _month(int m) {
    switch (m) {
      case 1:
        return 'Janeiro';
      case 2:
        return 'Fevereiro';
      case 3:
        return 'Março';
      case 4:
        return 'Abril';
      case 5:
        return 'Maio';
      case 6:
        return 'Junho';
      case 7:
        return 'Julho';
      case 8:
        return 'Agosto';
      case 9:
        return 'Setembro';
      case 10:
        return 'Outubro';
      case 11:
        return 'Novembro';
      default:
        return 'Dezembro';
    }
  }
}
