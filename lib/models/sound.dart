enum SoundCategory { gritos, avisos, ameacas }

class AbismoSound {
  final String id;
  final String name;
  final String url;
  final SoundCategory category;
  final Duration duration;
  final int intensity;

  const AbismoSound({
    required this.id,
    required this.name,
    required this.url,
    required this.category,
    required this.duration,
    required this.intensity,
  });
}
