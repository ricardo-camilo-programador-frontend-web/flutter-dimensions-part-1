import 'package:flutter/foundation.dart';
import '../models/sound.dart';

class SoundProvider with ChangeNotifier {
  final List<AbismoSound> _sounds = [
    AbismoSound(
      id: 's1',
      name: 'Grito Sombrio',
      url: 'https://cdn.pixabay.com/download/audio/2022/03/30/audio_8bfe0b2f2e.mp3?filename=scream-ambient-20969.mp3',
      category: SoundCategory.gritos,
      duration: const Duration(seconds: 6),
      intensity: 9,
    ),
    AbismoSound(
      id: 's2',
      name: 'Aviso Sussurrante',
      url: 'https://cdn.pixabay.com/download/audio/2021/12/22/audio_caa17b1020.mp3?filename=whispering-ambient-13285.mp3',
      category: SoundCategory.avisos,
      duration: const Duration(seconds: 8),
      intensity: 5,
    ),
    AbismoSound(
      id: 's3',
      name: 'Ameaça do Abismo',
      url: 'https://cdn.pixabay.com/download/audio/2022/03/29/audio_1af488e8d0.mp3?filename=demonic-voice-20911.mp3',
      category: SoundCategory.ameacas,
      duration: const Duration(seconds: 5),
      intensity: 8,
    ),
  ];

  List<AbismoSound> get sounds => List.unmodifiable(_sounds);

  AbismoSound? getById(String id) {
    try {
      return _sounds.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}
