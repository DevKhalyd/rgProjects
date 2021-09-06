import 'dart:typed_data';

import 'package:photo_manager/photo_manager.dart';

class AssetGallery {
  const AssetGallery({
    required this.content,
    required this.thumb,
    required this.type,
  });

  final Uint8List? content;
  final Uint8List? thumb;
  final AssetType type;
}
