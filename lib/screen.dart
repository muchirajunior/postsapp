import 'package:flutter/material.dart';
import 'package:postsapp/globals.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('STATE LISTENABLE'),
        elevation: 2,
        actions: [
          IconButton(
            onPressed: ()=> theme.value = theme.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light, 
            icon: const Icon(Icons.light_mode)
          )
        ],
      ),
    );
  }
}