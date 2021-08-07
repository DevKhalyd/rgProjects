import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

import '../../getX/custom_gallery_controller.dart';
import 'img_gallery.dart';

/// Show the latest photos takez by the user
class CustomGallery extends StatelessWidget {
  const CustomGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomGalleryController>(
      builder: (c) {
        final imgs = c.imagesFromGallery;

        if (imgs.isEmpty) return Container();

        return Positioned(
          bottom: context.height * 0.2,
          child: Container(
            height: 130,
            width: context.width,
            child: Column(
              children: [
                Icon(Icons.keyboard_arrow_up, color: Colors.white),
                Space(0.015),
                Container(
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: imgs.length,
                      itemBuilder: (_, index) =>
                          ImageGallery(data: imgs[index])),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
