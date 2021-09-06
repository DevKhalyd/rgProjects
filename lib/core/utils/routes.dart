import 'package:get/get.dart';

import '../../features/clone_features/whatsapp_chat/presentation/bindings/camera_binding.dart';
import '../../features/clone_features/whatsapp_chat/presentation/bindings/wsp_chat_binding.dart';
import '../../features/clone_features/whatsapp_chat/presentation/screens/whatsapp_camera.dart';
import '../../features/clone_features/whatsapp_chat/presentation/screens/whatsapp_chat.dart';
import '../../home/screens/home.dart';

abstract class Routes {
  // TODO: When in web, create the 404 error page
  static const _transition = Transition.leftToRight;
  // Welcome Screen
  static const INITIAL_ROUTE = '/';

  // Sections
  static const DESIGNS = '/designs';
  static const CLONE_FEATURES = '/cloneFeatures';
  static const FANCY_WIDGETS = '/fancyWidgets';
  static const NATIVE_SERVICES = '/nativeServices';

  // WhatsApp - Clone Features
  static const WHATSAPP_CHAT = '/whatsAppChat';
  static const WHATSAPP_CAMERA = '/whatsAppCamera';

  // GetxPages
  static final pages = <GetPage>[
    GetPage(
      name: INITIAL_ROUTE,
      page: () => Home(),
      transition: _transition,
    ),
    GetPage(
      name: WHATSAPP_CHAT,
      page: () => WhatsAppChat(),
      binding: WspChatBinding(),
      transition: _transition,
    ),
    GetPage(
      name: WHATSAPP_CAMERA,
      page: () => WhatsAppCamarera(),
      binding: CameraBinding(),
      transition: _transition,
    ),
  ];
}
