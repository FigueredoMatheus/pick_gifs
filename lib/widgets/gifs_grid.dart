import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/app_controller.dart';
import 'package:gifs_search/views/gif_full_screen_page.dart';
import 'package:gifs_search/widgets/load_more_gifs_button.dart';

class GifsGrid extends StatelessWidget {
  final List<dynamic> gifs;

  const GifsGrid({Key? key, required this.gifs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = AppController();
    return gifs.isEmpty
        ? const Center(
            child: Text(
              'Nenhum gif encontrado :(',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: appController.gifsGridItemCount(gifs),
            itemBuilder: (context, index) {
              if (gifs.length != index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GifFullScreenPage(
                          gifData: gifs[index],
                        ),
                      ),
                    );
                  },
                  child: Image.network(
                    gifs[index]['images']['original']['url'],
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return const LoadMoreGifsButton();
              }
            },
          );
  }
}
