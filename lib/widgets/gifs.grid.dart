import 'package:flutter/material.dart';

class GifsGrid extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const GifsGrid({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: snapshot.data['data'].length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Expanded(
            child: Image.network(
              snapshot.data['data'][index]['images']['original']['url'],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
