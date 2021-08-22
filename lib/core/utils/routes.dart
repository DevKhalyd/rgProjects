import 'package:get/get.dart';

import '../../features/home/presentation/home.dart';
import '../../features/whatsapp_chat/presentation/bindings/camera_binding.dart';
import '../../features/whatsapp_chat/presentation/bindings/chat_binding.dart';
import '../../features/whatsapp_chat/presentation/screens/whatsapp_camera.dart';
import '../../features/whatsapp_chat/presentation/screens/whatsapp_chat.dart';

abstract class Routes {
  static const INITIAL_ROUTE = '/initialRoute';
  static const WHATSAPP_CHAT = '/whatschat';
  static const WHATSAPP_CAMARERA = '/whatscamarera';

  // GetxPages
  static final pages = <GetPage>[
    GetPage(
      name: INITIAL_ROUTE,
      page: () => Home(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: WHATSAPP_CHAT,
      page: () => WhatsAppChat(),
      transition: Transition.leftToRight,
      binding: WhatsAppChatBinding(),
    ),
    GetPage(
      name: WHATSAPP_CAMARERA,
      page: () => WhatsAppCamarera(),
      transition: Transition.rightToLeft,
      binding: CameraBinding(),
    ),
  ];
}
