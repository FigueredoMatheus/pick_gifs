import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/app_controller.dart';
import 'package:gifs_search/widgets/gifs.grid.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final appController = AppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Gifs Favoritos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: appController.listFavoriteGifs.value.isEmpty
            ? const Center(
                child: Text(
                  'Nenhum gif encontrado :(',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            : GifsGrid(
                gifs: appController.listFavoriteGifs.value,
              ),
      ),
    );
  }
}
