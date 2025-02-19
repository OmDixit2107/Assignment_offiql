import 'package:flutter/material.dart';

// A reusable search bar widget
class SearchWidget extends StatelessWidget {
  final TextEditingController controller; // Controller for managing text input
  final Function(String) onChanged; // Callback function when text changes

  // Constructor with required parameters
  const SearchWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Adds padding around the search bar
      child: TextField(
        controller: controller, // Assigns the text controller
        onChanged: onChanged, // Calls onChanged function when user types
        decoration: InputDecoration(
          hintText: "Search by name...", // Placeholder text
          prefixIcon: const Icon(Icons.search), // Search icon
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
        ),
      ),
    );
  }
}
