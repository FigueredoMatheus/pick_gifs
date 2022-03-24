import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/app_controller.dart';

class LoadMoreGifsButton extends StatelessWidget {
  const LoadMoreGifsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = AppController();
    return GestureDetector(
      onTap: () => appController.loadMoreGifs(),
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
