// Model class representing geographical coordinates
class Geo {
  final String lat; // Latitude coordinate
  final String lng; // Longitude coordinate

  // Constructor with required parameters
  Geo({required this.lat, required this.lng});

  // Factory constructor to create a Geo object from JSON
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'], // Extracts latitude from JSON
      lng: json['lng'], // Extracts longitude from JSON
    );
  }

  // Converts a Geo object to a JSON-compatible Map
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}
