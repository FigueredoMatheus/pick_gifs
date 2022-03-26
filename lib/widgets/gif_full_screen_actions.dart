import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/app_controller.dart';

class GifFullScreenAction extends StatefulWidget {
  final Map gifData;
  const GifFullScreenAction({Key? key, required this.gifData})
      : super(key: key);

  @override
  State<GifFullScreenAction> createState() => _GifFullScreenActionState();
}

class _GifFullScreenActionState extends State<GifFullScreenAction> {
  bool isFavorite = false;
  @override
  void initState() {
    final appController = AppController();
    super.initState();
    for (var gif in appController.listFavoriteGifs) {
      if (gif['id'] == widget.gifData['id']) {
        setState(() {
          isFavorite = true;
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appController = AppController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (isFavorite) {
                appController.removeGifAsFavorite(widget.gifData);
              } else {
                appController.saveGifAsFavorite(widget.gifData);
              }
              appController.triggerFavoritePage();
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Colors.white,
            splashRadius: 20,
          ),
          IconButton(
            onPressed: () {
              appController.shareGifUrl(
                widget.gifData['images']['original']['url'],
              );
            },
            icon: const Icon(Icons.share),
            color: Colors.white,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}
