import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/gifs_controller.dart';
import 'package:gifs_search/views/gif_full_screen_page.dart';
import 'package:gifs_search/widgets/load_more_gifs_button.dart';

class GifsGrid extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const GifsGrid({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifsController = GifsController();
    return snapshot.data['data'].isEmpty
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
            itemCount: gifsController.gifsGridItemCount(snapshot.data['data']),
            itemBuilder: (context, index) {
              if (snapshot.data['data'].length != index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GifFullScreenPage(
                          gifData: snapshot.data['data'][index],
                        ),
                      ),
                    );
                  },
                  child: Image.network(
                    snapshot.data['data'][index]['images']['original']['url'],
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return const LoadModeGifs();
              }
            },
          );
  }
}
