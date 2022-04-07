import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gifs_search/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black, // cor da barra superior
        statusBarIconBrightness: Brightness.light, // ícones dabarra superior
        systemNavigationBarColor:
            Color.fromARGB(232, 0, 0, 0), // cor da barra inferior
        systemNavigationBarIconBrightness:
            Brightness.light, // ícones da barra inferior
      ),
    );
    return MaterialApp(
      title: 'Pick Gifs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}
