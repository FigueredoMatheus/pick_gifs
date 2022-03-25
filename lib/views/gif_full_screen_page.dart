import 'package:flutter/material.dart';
import 'package:gifs_search/widgets/gif_full_screen_actions.dart';

class GifFullScreenPage extends StatelessWidget {
  final Map gifData;

  const GifFullScreenPage({Key? key, required this.gifData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(gifData['username']);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(gifData['username'].isEmpty ? 'Gif' : gifData['username']),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GifFullScreenAction(gifData: gifData),
          const Spacer(),
          Image.network(
            gifData['images']['fixed_height']['url'],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
