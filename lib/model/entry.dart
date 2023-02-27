class Entry {
  static String table = "entries";

  int? id;
  String? duration;
  double? distance;
  double? pace;
  double? topspeed;
  double? avespeed;

  Entry(
      {this.id,
      this.duration,
      this.distance,
      this.pace,
      this.avespeed,
      this.topspeed});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'duration': duration,
      'distance': distance,
      'avepace': pace,
      'topspeed': topspeed,
      'avespeed': avespeed
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  static Entry fromMap(Map<String, dynamic> map) {
    return Entry(
        id: map['id'],
        duration: map['duration'],
        distance: map['distance'],
        pace: map['avepace'],
        topspeed: map['topspeed'],
        avespeed: map['avespeed']);
  }
}
