import 'package:offiql/models/geo.dart';

// Model class representing an Address
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo; // Geographical location associated with the address

  // Constructor with required parameters
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  // Factory constructor to create an Address object from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'], // Extracts street name from JSON
      suite: json['suite'], // Extracts suite information
      city: json['city'], // Extracts city name
      zipcode: json['zipcode'], // Extracts zip code
      geo: Geo.fromJson(json['geo']), // Parses Geo object
    );
  }

  // Converts an Address object to a JSON-compatible Map
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(), // Converts Geo object to JSON
    };
  }
}
