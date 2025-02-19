// Model class representing a Company
class Company {
  final String name;
  final String catchPhrase;
  final String bs; // Business-related description

  // Constructor with required parameters
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  // Factory constructor to create a Company object from JSON
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'], // Extracts company name from JSON
      catchPhrase: json['catchPhrase'], // Extracts catchphrase
      bs: json['bs'], // Extracts business details
    );
  }

  // Converts a Company object to a JSON-compatible Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}
