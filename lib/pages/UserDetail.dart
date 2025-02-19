import 'package:flutter/material.dart';
import 'package:offiql/models/user.dart';

// UserDetailPage is a stateless widget that displays detailed information about a user.
class UserDetailPage extends StatelessWidget {
  final User user;

  // Constructor requires a User object.
  const UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar displaying the user's name in the title.
      appBar: AppBar(title: Text("${user.name}'s Details")),

      // Padding around the body for better spacing.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displays a placeholder image or avatar.
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/image.png", // Path to a placeholder user image.
                height: 300,
                width: double.infinity,
                fit: BoxFit
                    .cover, // Ensures the image covers the designated area.
              ),
            ),
            const SizedBox(height: 20),

            // Displaying user details with different font styles.
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Username: ${user.username}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Text(
              'Email: ${user.email}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: ${user.phone}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Website: ${user.website}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Displaying user's address.
            Text(
              'Address: ${user.address.street}, ${user.address.city}, ${user.address.zipcode}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Displaying user's company details.
            Text(
              'Company: ${user.company.name}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
