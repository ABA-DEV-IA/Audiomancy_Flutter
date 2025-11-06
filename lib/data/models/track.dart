class Track {
  final String id;
  final String title;
  final String artist;
  final String audioUrl;
  final int duration;
  final String licenseName;
  final String licenseUrl;
  final List<String> tags;
  final String image;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.audioUrl,
    required this.duration,
    required this.licenseName,
    required this.licenseUrl,
    required this.tags,
    required this.image,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      audioUrl: json['audio_url'],
      duration: json['duration'],
      licenseName: json['license_name'],
      licenseUrl: json['license_url'],
      tags: List<String>.from(json['tags']),
      image: json['image'],
    );
  }
}
