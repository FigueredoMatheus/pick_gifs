import 'package:flutter/material.dart';
import 'package:gifs_search/gifs_api.dart';
import 'package:gifs_search/widgets/gifs.grid.dart';
import 'package:gifs_search/widgets/home_text_field.dart';
import 'package:gifs_search/widgets/search_button.dart';

class GifsPage extends StatefulWidget {
  const GifsPage({Key? key}) : super(key: key);

  @override
  State<GifsPage> createState() => _GifsPageState();
}

class _GifsPageState extends State<GifsPage> {
  TextEditingController searchController = TextEditingController();
  int seatchOffset = 0;

  searchGifs() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                HomeTextField(textController: searchController),
                const SizedBox(width: 10),
                SearchButton(
                  searchGifs: searchGifs,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                future: searchController.text.isEmpty
                    ? GifsAPI.getTrendingGifs()
                    : GifsAPI.getSearchGifs(
                        searchController.text,
                        seatchOffset,
                      ),
                builder: (context, snapshot) {
                  print(searchController.text);
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
                        return GifsGrid(snapshot: snapshot);
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
