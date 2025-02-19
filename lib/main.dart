import 'package:flutter/material.dart';
import 'package:offiql/pages/home.dart';
import 'package:offiql/providers/UserProvider.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
