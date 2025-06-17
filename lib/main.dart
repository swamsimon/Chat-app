import 'package:chat_app/screens/auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyChatApp());
}

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat App',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 211, 190)),
      ),
      home: AuthScreen(),
    );
  }
}