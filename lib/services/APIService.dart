import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../models/user.dart';

// ApiService handles fetching user data from an external API
class ApiService {
  // API endpoint for fetching users
  static const String apiUrl = "https://jsonplaceholder.typicode.com/users";

  // Function to fetch users from the API
  static Future<List<User>> fetchUsers() async {
    try {
      // Sending a GET request with a timeout of 10 seconds
      final response = await http.get(Uri.parse(apiUrl)).timeout(
            const Duration(seconds: 10),
          );

      // If the response is successful (status code 200)
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((user) => User.fromJson(user)).toList();
      } else {
        // Throw an exception if the server returns an error status code
        throw HttpException("Server error: ${response.statusCode}");
      }
    }
    // Handle request timeout
    on TimeoutException {
      throw Exception("Request timed out. Please try again later.");
    }
    // Handle network issues (e.g., no internet connection)
    on SocketException {
      throw Exception("No internet connection. Please check your network.");
    }
    // Handle HTTP exceptions with specific error messages
    on HttpException catch (e) {
      throw Exception(e.message);
    }
    // Handle unexpected response format errors
    on FormatException {
      throw Exception("Invalid response format from server.");
    }
    // Catch any other unexpected errors
    catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
