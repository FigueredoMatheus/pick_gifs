import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/app_controller.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = AppController();
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
        onPressed: appController.triggerShowGifs,
        child: const Text(
          'Ok',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
