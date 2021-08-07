import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rg_projects/core/utils/logger.dart';

import '../../../../core/widgets/dialogs/info_dialog.dart';
import '../../domain/models/asset_gallery.dart';

class CustomGalleryController extends GetxController {
  List<AssetGallery> _imagesFromGallery = [];
  List<AssetGallery> get imagesFromGallery => _imagesFromGallery;

  @override
  void onInit() async {
    final result = await PhotoManager.requestPermissionExtend();
    if (!result.isAuth) {
      await Get.dialog(InfoDialog(
          description:
              'You should accept the permissions to access to the gallery'));
      PhotoManager.openSetting();
    }
    super.onInit();
  }

  @override
  void onReady() {
    _onFillAssets();
    super.onReady();
  }

  _onFillAssets() async {
    final list = await PhotoManager.getAssetPathList();

    final firstAlbum = list[0];

    final images = await firstAlbum.getAssetListRange(start: 0, end: 20);

    final imgs = <AssetGallery>[];

    await Future.forEach<AssetEntity>(images, (e) async {
      try {
        final originBytes = await e.originBytes;
        final thumbData = await e.thumbData;

        final item = AssetGallery(
          type: e.type,
          content: originBytes,
          thumb: thumbData,
        );
        imgs.add(item);
      } catch (e) {
        Log.console(e, L.E);
      }
    });

    if (imgs.isNotEmpty) {
      _imagesFromGallery.clear();
      _imagesFromGallery.addAll(imgs);
      update();
    }
  }
}
