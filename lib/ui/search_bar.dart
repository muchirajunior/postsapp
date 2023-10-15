import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,5),
      child: TextFormField(
        decoration:  InputDecoration(
          labelText: "search ..",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          prefixIcon: const Icon(Icons.search)
        ),
        onTap: () {},
      ),
    );
  }
}