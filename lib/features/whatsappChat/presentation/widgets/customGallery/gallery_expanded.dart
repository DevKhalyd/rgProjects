import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

import '../../../../../core/utils/colors.dart';
import '../../getX/gallery_expanded_controller.dart';
import '../../getX/slider_gallery_controller.dart';
import '../../getX/whatsapp_camera_controller.dart';
import 'img_gallery.dart';

class GalleryExpanded extends StatelessWidget {
  const GalleryExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryExpandedController>(builder: (c) {
      final imgs = c.imagesFromGallery;

      return Container(
        color: Colors.white,
        child: Column(
          children: [
            _AppBar(),
            Expanded(
              child: GridView.builder(
                  itemCount: imgs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (_, index) => ImageGallery(
                        data: imgs[index],
                        onPressed: () => WhatsAppCameraController.to
                            .onTapCamera(takePicture: false),
                      )),
            ),
          ],
        ),
      );
    });
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onPressed = SliderGalleryController.to.onTap;
    return Container(
        height: kToolbarHeight,
        width: context.width,
        child: Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorsApp.whatsapp,
              ),
            ),
            TextCustom(
              'Choose a picture',
              fontWeight: FontWeight.bold,
            ),
            Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.select_all,
                color: ColorsApp.whatsapp,
              ),
            ),
          ],
        ));
  }
}
