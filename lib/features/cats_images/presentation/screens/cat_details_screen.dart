import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats/features/cats_images/domain/entities/cat.dart';
import 'package:flutter/material.dart';

class CatDetailsScreen extends StatelessWidget {
  const CatDetailsScreen({Key? key, required this.cat}) : super(key: key);
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cat.id),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.topRight,
            children: [
              CachedNetworkImage(
                imageUrl: cat.url,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  cat.id,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
