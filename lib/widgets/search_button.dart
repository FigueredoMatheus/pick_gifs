import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback searchGifs;
  const SearchButton({Key? key, required this.searchGifs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: Colors.black26,
        ),
        onPressed: searchGifs,
        child: const Text(
          'Ok',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
