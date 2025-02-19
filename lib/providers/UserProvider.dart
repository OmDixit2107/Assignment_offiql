import 'package:flutter/material.dart';
import 'package:offiql/models/user.dart';
import 'package:offiql/services/APIService.dart';

// UserProvider is a state management class that extends ChangeNotifier
// It manages the list of users and notifies listeners when changes occur.
class UserProvider with ChangeNotifier {
  List<User> users = []; // List to store user data
  bool isLoading = true; // Flag to indicate whether data is being loaded

  // Function to fetch users from the API service
  Future<void> getUsers() async {
    if (users.isNotEmpty)
      return; // Prevent unnecessary API calls if users are already loaded
    try {
      users = await ApiService.fetchUsers(); // Fetch users from API
    } catch (e) {
      print("Error: $e"); // Print error if API call fails
    }
    isLoading = false; // Set loading to false after fetching data
    notifyListeners(); // Notify UI to update with new data
  }

  // Function to add a new user to the list
  void addUser(User newUser) {
    users.add(newUser);
    notifyListeners(); // Notify UI to reflect changes in the user list
  }
}
