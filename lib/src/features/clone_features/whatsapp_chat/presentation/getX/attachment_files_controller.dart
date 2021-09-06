import 'package:get/get.dart';
import 'package:rg_projects/core/utils/timers.dart';


class AttachmentFilesController extends GetxController {
  static AttachmentFilesController get to => Get.find();

  // Values to controlle the menu
  final _initialHeight = 0.0;
  final _initialWidth = 120.0;
  final _initialRadius = 100.0;

  late double _finalWidth;

  set finalWidth(double v) => _finalWidth = v;

  // NOTE: Check if is needed to use the context.width
  final _finalHeight = 300.0;
  final _finalRadius = 13.0;

  late double currentHeight;
  late double currentWidth;
  double currentRadius = 0.0;

  bool _showContent = false;

  bool get showContent => _showContent;

  bool get isOpenMenu => currentHeight == _finalHeight;

  AttachmentFilesController() {
    currentHeight = _initialHeight;
    currentWidth = _initialWidth;
  }

  /// Open the menu or close the menu
  onTapFilesAttached() {
    if (!isOpenMenu)
      openMenu();
    else
      closeMenu();
  }

  openMenu() {
    currentHeight = _finalHeight;
    currentWidth = _finalWidth;
    currentRadius = _finalRadius;
    // Help to show the content
    Timers.execute(() {
      _showContent = true;
      update();
    }, milliseconds: 210);
    update();
  }

  closeMenu() {
    if (!isOpenMenu) return;
    currentHeight = _initialHeight;
    currentWidth = _initialWidth;
    currentRadius = _initialRadius;
    _showContent = false;
    update();
  }

  /// Space needed to show the menu
  double getBottomSpace() => 65;

  /// Get the right distance to show the menu in order with the icon file
  double getRightDistance() {
    if (!isOpenMenu)
      return _finalWidth * 0.22;
    else
      return 0;
  }
}
