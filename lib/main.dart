import 'package:amelioration_page_facebook/screens/allFriend.dart';
import 'package:amelioration_page_facebook/screens/home.dart';
import 'package:amelioration_page_facebook/ui/colorTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorTheme.blue),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const Home(),
        '/friends' : (context) => AllFriends(),
      },
      home: const Home()
    );
  }
}
