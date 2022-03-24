import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/gifs_controller.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifsController = GifsController();
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
        onPressed: gifsController.triggerShowGifs,
        child: const Text(
          'Ok',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
