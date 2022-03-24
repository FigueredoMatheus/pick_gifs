import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/gifs_controller.dart';

class GifFullScreenPage extends StatelessWidget {
  final Map gifData;

  const GifFullScreenPage({Key? key, required this.gifData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifsController = GifsController();
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(gifData['username']),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.white,
                  splashRadius: 20,
                ),
                IconButton(
                  onPressed: () {
                    gifsController.shareGif(
                      gifData['images']['original']['url'],
                    );
                  },
                  icon: const Icon(Icons.share),
                  color: Colors.white,
                  splashRadius: 20,
                ),
              ],
            ),
          ),
          const Spacer(),
          Image.network(
            gifData['images']['original']['url'],
            fit: BoxFit.cover,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
