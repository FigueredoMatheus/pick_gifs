import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/app_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = AppController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Gifs Favoritos'),
      ),
    );
  }
}
