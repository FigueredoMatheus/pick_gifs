import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/gifs_controller.dart';

class LoadModeGifs extends StatelessWidget {
  const LoadModeGifs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifsController = GifsController();
    return GestureDetector(
      onTap: () => gifsController.loadMoreGifs(),
      child: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
            Text(
              'Carregar mais...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
