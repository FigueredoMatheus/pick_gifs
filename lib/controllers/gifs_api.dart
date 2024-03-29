import 'dart:convert';
import 'package:http/http.dart' as http;

class GifsAPIController {
  static Future getGifs() async {
    return;
  }

  Future<Map> getSearchGifs(String requestedWord, int offset) async {
    final url = Uri.parse(
        'https://api.giphy.com/v1/gifs/search?api_key=II90afVadpAi9LQEWjPpGhOR47VpzExl&q=$requestedWord&limit=25&offset=$offset&rating=g&lang=pt');

    http.Response response = await http.get(url);

    return json.decode(response.body);
  }

  Future<Map> getTrendingGifs() async {
    final url = Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=II90afVadpAi9LQEWjPpGhOR47VpzExl&limit=50&rating=g');

    http.Response response = await http.get(url);

    return json.decode(response.body);
  }
}
