import 'package:flutter/material.dart';
import 'package:offiql/pages/UserDetail.dart';
import 'package:offiql/pages/AddUserPage.dart';
import 'package:offiql/providers/UserProvider.dart';
import 'package:offiql/services/SearchWidget.dart';
import 'package:provider/provider.dart';

// HomePage is a stateful widget that displays a list of users and allows searching and adding new users.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller for managing the search input field.
  TextEditingController _searchController = TextEditingController();
  // Stores the current search query entered by the user.
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    // Fetches the list of users as soon as the widget is initialized.
    Future.microtask(
        () => Provider.of<UserProvider>(context, listen: false).getUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a title for the Users List page.
      appBar: AppBar(title: const Text("Users List")),

      // Using Consumer to listen for changes in the UserProvider and rebuild the widget accordingly.
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // Displays a loading indicator while user data is being fetched.
          if (userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Shows a message if no users are available.
          if (userProvider.users.isEmpty) {
            return const Center(child: Text("No users found"));
          }

          // Filters users based on the search query.
          final filteredUsers = userProvider.users
              .where((user) =>
                  user.name.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();

          return Column(
            children: [
              // Search bar widget to filter users based on input text.
              SearchWidget(
                controller: _searchController,
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
              ),

              // Expands to fill the remaining screen space with the user grid.
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Determines the number of columns in the grid based on screen width.
                      int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
                      // Adjusts the aspect ratio for different screen sizes.
                      double aspectRatio = constraints.maxWidth < 600 ? 0.8 : 1;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: aspectRatio,
                        ),
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];

                          return GestureDetector(
                            onTap: () {
                              // Navigates to the user detail page when a user card is tapped.
                              Navigator.push(
                                context,
                                _createRoute(UserDetailPage(user: user)),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 4, // Adds shadow effect to the card.
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // User profile image section.
                                  Expanded(
                                    flex: 4,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(15)),
                                      child: Image.asset(
                                        "assets/images/image.png",
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // User details section.
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Displays the user's name.
                                          Text(
                                            user.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          const SizedBox(height: 5),
                                          // Displays the user's email.
                                          Text(
                                            user.email,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[700],
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // Floating action button to navigate to the AddUserPage.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            _createRoute(AddUserPage()),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Add User',
      ),
    );
  }
}

// Custom route transition for page navigation with a slide-up animation.
Route _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0); // Start from the bottom of the screen.
      const end = Offset.zero; // End at the normal position.
      const curve = Curves.ease; // Smooth transition curve.

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
