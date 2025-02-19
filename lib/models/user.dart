import 'package:offiql/models/address.dart';
import 'package:offiql/models/company.dart';

// Model class representing a User
class User {
  final int id; // Unique user ID
  final String name; // Full name of the user
  final String username; // Username for the user
  final String email; // Email address
  final Address address; // Address object containing user's location details
  final String phone; // Phone number
  final String website; // Website link
  final Company company; // Company details where the user works

  // Constructor with required parameters
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  // Factory method to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']), // Parsing Address object
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']), // Parsing Company object
    );
  }

  // Convert a User object to a JSON-compatible Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(), // Converting Address object to JSON
      'phone': phone,
      'website': website,
      'company': company.toJson(), // Converting Company object to JSON
    };
  }
}
