import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sound.dart';
import '../providers/sound_provider.dart';
import '../widgets/waveform_widget.dart';

class SoundsLibraryScreen extends StatefulWidget {
  const SoundsLibraryScreen({super.key});
  @override
  State<SoundsLibraryScreen> createState() => _SoundsLibraryScreenState();
}

class _SoundsLibraryScreenState extends State<SoundsLibraryScreen> {
  final AudioPlayer _player = AudioPlayer();
  String query = '';
  SoundCategory? filter;
  String? playingId;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sounds = context.watch<SoundProvider>().sounds.where((s) {
      final q = query.trim().toLowerCase();
      final okQuery = q.isEmpty || s.name.toLowerCase().contains(q);
      final okFilter = filter == null || s.category == filter;
      return okQuery && okFilter;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BIBLIOTECA DO ABISMO'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Expanded(
                child: TextField(
                  onChanged: (v) => setState(() => query = v),
                  decoration: const InputDecoration(hintText: 'Buscar sons'),
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<SoundCategory>(
                value: filter,
                onChanged: (v) => setState(() => filter = v),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Todas'), enabled: false),
                  DropdownMenuItem(value: SoundCategory.gritos, child: Text('Gritos')),
                  DropdownMenuItem(value: SoundCategory.avisos, child: Text('Avisos')),
                  DropdownMenuItem(value: SoundCategory.ameacas, child: Text('Ameaças')),
                ],
              ),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sounds.length,
              itemBuilder: (ctx, i) {
                final s = sounds[i];
                final isPlaying = playingId == s.id;
                final color = s.category == SoundCategory.gritos
                    ? const Color(0xFF8B0000)
                    : s.category == SoundCategory.avisos
                        ? const Color(0xFFFF4500)
                        : const Color(0xFF32CD32);
                return Card(
                  color: const Color(0xFF2F2F2F),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(s.name, style: Theme.of(context).textTheme.titleLarge),
                            Row(children: [
                              IconButton(
                                onPressed: () async {
                                  try {
                                    if (isPlaying) {
                                      await _player.pause();
                                      setState(() => playingId = null);
                                    } else {
                                      await _player.setUrl(s.url);
                                      await _player.resume();
                                      setState(() => playingId = s.id);
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Falha ao reproduzir')));
                                  }
                                },
                                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                              ),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.download)),
                            ])
                          ],
                        ),
                        const SizedBox(height: 8),
                        WaveformWidget(color: color),
                        const SizedBox(height: 8),
                        Text('Duração: ${s.duration.inSeconds}s • Intensidade: ${s.intensity}/10'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
