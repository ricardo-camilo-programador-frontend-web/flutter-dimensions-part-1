import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('CONFIGURAÇÕES')),
      body: ListView(
        children: [
          const _SectionTitle('CONFIGURAÇÕES GERAIS'),
          SwitchListTile(
            title: const Text('Modo de alto contraste'),
            value: s.highContrast,
            onChanged: (_) => context.read<SettingsProvider>().toggleHighContrast(),
          ),
          SwitchListTile(
            title: const Text('Animações reduzidas'),
            value: s.reducedMotion,
            onChanged: (_) => context.read<SettingsProvider>().toggleReducedMotion(),
          ),
          SwitchListTile(
            title: const Text('Fontes acessíveis'),
            value: s.accessibleFonts,
            onChanged: (_) => context.read<SettingsProvider>().toggleAccessibleFonts(),
          ),
          const _SectionTitle('PERMISSÕES'),
          const ListTile(title: Text('Notificações'), subtitle: Text('Permitido')),
          const ListTile(title: Text('Vibração'), subtitle: Text('Permitido')),
          const ListTile(title: Text('Microfone'), subtitle: Text('Solicitar quando necessário')),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
