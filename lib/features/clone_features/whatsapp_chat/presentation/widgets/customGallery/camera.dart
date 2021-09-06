import 'package:flutter/material.dart' hide Actions;
import 'package:get/get.dart' hide ContextExtensionss;

import '../../../../../../../core/utils/durations.dart';
import '../../../../../../../core/extensions/build_context_ext.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/widgets/mini_widgets.dart';

import '../../getX/custom_gallery_controller.dart';
import '../../getX/slider_gallery_controller.dart';
import '../../getX/whatsapp_camera_controller.dart';
import 'actions.dart';
import 'gallery_expanded.dart';
import 'img_gallery.dart';

/// Show the latest photos and the actions to take a picture...
class CameraActions extends StatelessWidget {
  const CameraActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliderGalleryController.to.initValues(
      mH: context.height,
      pT: context.paddingTop,
    );

    //final top = MediaQuery.of(context).padding.top;
    return GetBuilder<SliderGalleryController>(
      builder: (c) {
        return AnimatedPositioned(
          duration: Durations.defaultAnimation,
          bottom: 0,
          child: AnimatedContainer(
            duration: c.animationDuration,
            width: context.width,
            height: c.currentSliderHeight
                .clamp(c.minSliderHeight, c.maxSliderHeight),
            curve: Curves.easeIn,
            child: _Actions(),
          ),
        );
      },
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderGalleryController>(
      builder: (c) {
        final currentOpacity = 1.0 - c.getOpacity();

        return GestureDetector(
          onTap: c.onTap,
          onVerticalDragEnd: c.onVerticalDragEnd,
          onVerticalDragUpdate: c.onVerticalDragUpdate,
          child: Stack(
            children: [
              // Expanend actions
              AnimatedOpacity(
                opacity: c.getOpacity(),
                duration: Durations.fiftyMilliseconds,
                child: GalleryExpanded(),
              ),
              // Collapsed actions
              AnimatedOpacity(
                opacity: currentOpacity,
                duration: Durations.fiftyMilliseconds,
                child: Column(
                  children: [
                    _Gallery(),
                    Actions(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomGalleryController>(
      builder: (c) {
        final imgs = c.imagesFromGallery;
        if (imgs.isEmpty)
          return Container(
            height: 130,
            child: Center(
                child: CircularProgressCustom(
              color: ColorsApp.whatsapp,
            )),
          );
        return Container(
          height: 130,
          width: context.width,
          child: Column(
            children: [
              Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
              ),
              Space(0.015),
              Container(
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: imgs.length,
                    itemBuilder: (_, index) => ImageGallery(
                          data: imgs[index],
                          onPressed: () => WhatsAppCameraController.to
                              .onTapCamera(takePicture: false),
                        )),
              )
            ],
          ),
        );
      },
    );
  }
}
