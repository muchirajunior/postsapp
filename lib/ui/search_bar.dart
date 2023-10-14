import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: TextFormField(
        decoration:  InputDecoration(
          labelText: "search ..",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          prefix: const Icon(Icons.search)
        ),
      ),
    );
  }
}