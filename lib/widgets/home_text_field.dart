import 'package:flutter/material.dart';

class HomeTextField extends StatefulWidget {
  final TextEditingController textController;

  const HomeTextField({Key? key, required this.textController})
      : super(key: key);

  @override
  State<HomeTextField> createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: widget.textController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
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
