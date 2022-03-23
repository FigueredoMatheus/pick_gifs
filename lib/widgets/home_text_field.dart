import 'package:flutter/material.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
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
