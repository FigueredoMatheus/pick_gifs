import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/gifs_controller.dart';

class HomeTextField extends StatefulWidget {
  const HomeTextField({Key? key}) : super(key: key);

  @override
  State<HomeTextField> createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {
  final gifsController = GifsController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: gifsController.searchController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Pesquisar por',
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black),
          ),
          focusColor: Colors.white,
          filled: true,
          fillColor: Colors.black26,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
