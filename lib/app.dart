import 'package:flutter/material.dart';
import 'package:gifs_search/views/favorite_page.dart';
import 'package:gifs_search/views/gifs_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentPageIndex = 0;

  final screen = [const GifsPage(), const FavoritePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: currentPageIndex,
        onTap: (pageIndex) => setState(() {
          currentPageIndex = pageIndex;
        }),
        items: const [
          BottomNavigationBarItem(
            label: 'Gifs',
            icon: Icon(
              Icons.movie_filter,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
