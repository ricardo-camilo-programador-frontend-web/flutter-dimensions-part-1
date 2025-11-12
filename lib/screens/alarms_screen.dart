import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/alarm.dart';
import '../providers/alarm_provider.dart';

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alarms = context.watch<AlarmProvider>().alarms;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALARMES DO ABISMO'),
        actions: [
          IconButton(
            onPressed: () => _openCreate(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (ctx, i) {
          final a = alarms[i];
          return Card(
            color: const Color(0xFF2F2F2F),
            child: ListTile(
              title: Text('${a.time.format(ctx)} - ${a.name}'),
              subtitle: Text(a.active ? 'Ativo' : 'Inativo'),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(onPressed: () => _openEdit(context, a), icon: const Icon(Icons.edit)),
                IconButton(onPressed: () => context.read<AlarmProvider>().remove(a.id), icon: const Icon(Icons.delete)),
                Switch(value: a.active, onChanged: (_) => context.read<AlarmProvider>().toggleActive(a.id)),
              ]),
            ),
          );
        },
      ),
    );
  }

  void _openCreate(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => _AlarmEditor());
  }

  void _openEdit(BuildContext context, Alarm a) {
    showModalBottomSheet(context: context, builder: (_) => _AlarmEditor(existing: a));
  }
}

class _AlarmEditor extends StatefulWidget {
  final Alarm? existing;
  const _AlarmEditor({this.existing});
  @override
  State<_AlarmEditor> createState() => _AlarmEditorState();
}

class _AlarmEditorState extends State<_AlarmEditor> {
  late TimeOfDay time;
  final TextEditingController nameCtrl = TextEditingController();
  String soundId = 's1';
  AbismoMode mode = AbismoMode.normal;
  double volume = 0.8;
  VibrationPattern vibration = VibrationPattern.abismo;
  int snooze = 10;

  @override
  void initState() {
    super.initState();
    time = widget.existing?.time ?? const TimeOfDay(hour: 7, minute: 30);
    nameCtrl.text = widget.existing?.name ?? 'Despertar do Abismo';
    soundId = widget.existing?.soundId ?? 's1';
    mode = widget.existing?.mode ?? AbismoMode.normal;
    volume = widget.existing?.volume ?? 0.8;
    vibration = widget.existing?.vibration ?? VibrationPattern.abismo;
    snooze = widget.existing?.snoozeMinutes ?? 10;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Horário e Nome'),
            const SizedBox(height: 8),
            Row(children: [
              ElevatedButton(onPressed: () async {
                final picked = await showTimePicker(context: context, initialTime: time);
                if (picked != null) setState(() => time = picked);
              }, child: Text(time.format(context))),
              const SizedBox(width: 12),
              Expanded(child: TextField(controller: nameCtrl, decoration: const InputDecoration(hintText: 'Nome do alarme'))),
            ]),
            const SizedBox(height: 16),
            const Text('Som do Abismo'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: soundId,
              onChanged: (v) => setState(() => soundId = v ?? 's1'),
              items: const [
                DropdownMenuItem(value: 's1', child: Text('Grito Sombrio')),
                DropdownMenuItem(value: 's2', child: Text('Aviso Sussurrante')),
                DropdownMenuItem(value: 's3', child: Text('Ameaça do Abismo')),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Configurações Avançadas'),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Volume'),
                Slider(value: volume, onChanged: (v) => setState(() => volume = v)),
              ])),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Snooze'),
                DropdownButton<int>(value: snooze, onChanged: (v) => setState(() => snooze = v ?? 10), items: const [
                  DropdownMenuItem(value: 5, child: Text('5 minutos')),
                  DropdownMenuItem(value: 10, child: Text('10 minutos')),
                  DropdownMenuItem(value: 15, child: Text('15 minutos')),
                ]),
              ])),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: DropdownButton<AbismoMode>(
                value: mode,
                onChanged: (v) => setState(() => mode = v ?? AbismoMode.normal),
                items: const [
                  DropdownMenuItem(value: AbismoMode.normal, child: Text('Normal')),
                  DropdownMenuItem(value: AbismoMode.avancado, child: Text('Avançado')),
                  DropdownMenuItem(value: AbismoMode.panico, child: Text('Pânico')),
                ],
              )),
              const SizedBox(width: 12),
              Expanded(child: DropdownButton<VibrationPattern>(
                value: vibration,
                onChanged: (v) => setState(() => vibration = v ?? VibrationPattern.abismo),
                items: const [
                  DropdownMenuItem(value: VibrationPattern.coracao, child: Text('Coração')),
                  DropdownMenuItem(value: VibrationPattern.abismo, child: Text('Abismo')),
                  DropdownMenuItem(value: VibrationPattern.panico, child: Text('Pânico')),
                ],
              )),
            ]),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: ElevatedButton(onPressed: () {
                final alarm = Alarm(
                  id: widget.existing?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
                  time: time,
                  name: nameCtrl.text,
                  soundId: soundId,
                  mode: mode,
                  volume: volume,
                  vibration: vibration,
                  snoozeMinutes: snooze,
                );
                final p = context.read<AlarmProvider>();
                if (widget.existing == null) {
                  p.add(alarm);
                } else {
                  p.update(alarm.id, alarm);
                }
                Navigator.pop(context);
              }, child: const Text('Salvar'))),
            ]),
          ],
        ),
      ),
    );
  }
}
