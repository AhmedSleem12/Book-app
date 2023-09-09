import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
          size: 20,
        ),
        hintText: "Search",
        enabledBorder: inputBorder(),
        focusedBorder: inputBorder(),
        enabled: true,
      ),
    );
  }
}

InputBorder inputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white),
    );
