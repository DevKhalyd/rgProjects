import 'package:flutter/material.dart';

import '../../../domain/models/asset_gallery.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({Key? key, required this.data, required this.onPressed})
      : super(key: key);

  final AssetGallery data;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    if (data.thumb == null) return Container();

    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Image.memory(
          data.thumb!,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
