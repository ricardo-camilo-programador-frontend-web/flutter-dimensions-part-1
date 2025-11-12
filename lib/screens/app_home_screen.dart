import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_nav.dart';
import '../providers/stats_provider.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 768 ? 1 : width < 1024 ? 2 : 2;
    final stats = context.watch<StatsProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('GRITOS DO ABISMO')),
      bottomNavigationBar: AbismoBottomNav(currentIndex: _index, onTap: (i) {
        setState(() => _index = i);
        switch (i) {
          case 0:
            break;
          case 1:
            Navigator.pushNamed(context, '/alarms');
            break;
          case 2:
            Navigator.pushNamed(context, '/sounds');
            break;
          case 4:
            Navigator.pushNamed(context, '/settings');
            break;
          default:
            break;
        }
      }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _Card(
              title: 'PRÓXIMO ALARME',
              icon: Icons.alarm_on,
              child: Column(children: const [
                Text('07:30'),
                SizedBox(height: 8),
                Text('Nome: Despertar do Abismo'),
              ]),
            ),
            _Card(
              title: 'SONS DO ABISMO',
              icon: Icons.library_music,
              child: Column(children: const [
                Text('Atual: Grito Sombrio'),
                SizedBox(height: 8),
                Icon(Icons.graphic_eq, color: Color(0xFF8B0000)),
              ]),
            ),
            _Card(
              title: 'ESTATÍSTICAS DO ABISMO',
              icon: Icons.bar_chart,
              child: Column(children: [
                Text('Dias consecutivos: ${stats.streakDias}'),
                const SizedBox(height: 8),
                Text('Média parar: ${stats.tempoMedioPararSegundos}s'),
              ]),
            ),
            _Card(
              title: 'CONFIGURAÇÕES',
              icon: Icons.settings,
              child: Column(children: const [
                Text('Modo: Abismo'),
                SizedBox(height: 8),
                Text('Permissões ok'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  const _Card({required this.title, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2F2F2F),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF4A4A4A)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF8B0000)),
              const SizedBox(width: 8),
              Text(title, style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          const SizedBox(height: 16),
          child,
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(onPressed: () {}, child: const Text('EDITAR')),
          ),
        ],
      ),
    );
  }
}
