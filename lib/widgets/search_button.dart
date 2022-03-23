import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

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
        onPressed: () {},
        child: const Text(
          'Ok',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
