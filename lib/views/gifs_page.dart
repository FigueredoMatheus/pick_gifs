import 'package:flutter/material.dart';
import 'package:gifs_search/controllers/app_controller.dart';
import 'package:gifs_search/widgets/gifs_grid.dart';
import 'package:gifs_search/widgets/search_text_field.dart';
import 'package:gifs_search/widgets/search_button.dart';

class GifsPage extends StatefulWidget {
  const GifsPage({Key? key}) : super(key: key);

  @override
  State<GifsPage> createState() => _GifsPageState();
}

class _GifsPageState extends State<GifsPage> {
  final appController = AppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/PoweredBy_640_Horizontal_Light-Backgrounds_With_Logo.gif',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: const [
                HomeTextField(),
                SizedBox(width: 10),
                SearchButton(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: appController.showGifs,
              builder: (context, _, __) {
                return Expanded(
                  child: FutureBuilder(
                    future: appController.gifsFuture(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const SizedBox(
                            width: 50,
                            height: 50,
                            child: FittedBox(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          );

                        default:
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text(
                                'Algo deu errado :(',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            );
                          } else {
                            AsyncSnapshot newSnapshot = snapshot;
                            return GifsGrid(gifs: newSnapshot.data['data']);
                          }
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
