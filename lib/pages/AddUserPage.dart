import 'package:flutter/material.dart';
import 'package:offiql/models/address.dart';
import 'package:offiql/models/company.dart';
import 'package:offiql/models/geo.dart';
import 'package:offiql/models/user.dart';
import 'package:offiql/providers/UserProvider.dart';
import 'package:provider/provider.dart';

// AddUserPage is a screen where users can input details to create a new user.
class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  // Form key to manage form state and validation.
  final _formKey = GlobalKey<FormState>();

  // Variables to store user input.
  String name = '';
  String email = '';
  String phone = '';

  // Function to handle adding a new user.
  void _addUser() {
    // Validate the form inputs before proceeding.
    if (_formKey.currentState!.validate()) {
      final newUser = User(
        id: DateTime.now()
            .millisecondsSinceEpoch, // Generates a unique ID based on timestamp.
        name: name,
        username: '', // Optional field, left blank for now.
        email: email,
        address: Address(
          street: '',
          suite: '',
          city: '',
          zipcode: '',
          geo: Geo(lat: '', lng: ''), // Dummy geolocation data.
        ),
        phone: phone,
        website: '', // Optional field.
        company:
            Company(name: '', catchPhrase: '', bs: ''), // Dummy company data.
      );

      // Adds the new user to the provider's state.
      Provider.of<UserProvider>(context, listen: false).addUser(newUser);

      // Closes the current screen and returns to the previous page.
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title for the page.
      appBar: AppBar(title: const Text("Add New User")),

      // Padding around the content for better UI spacing.
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // Form widget to manage validation and submission.
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Text field for entering the name.
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),

              // Text field for entering the email.
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email';
                  }
                  return null;
                },
              ),

              // Text field for entering the phone number.
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  return null;
                },
              ),

              const SizedBox(
                  height: 20), // Space between input fields and button.

              // Button to trigger the add user function.
              ElevatedButton(
                onPressed: _addUser,
                child: const Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
