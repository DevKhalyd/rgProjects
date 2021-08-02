import 'package:get/get.dart';

import '../../features/home/presentation/home.dart';
import '../../features/whatsappChat/presentation/screens/whatsapp_chat.dart';

abstract class Routes {
  static const INITIAL_ROUTE = '/initialRoute';
  static const WHATSAPP_CHAT = '/whatschat';

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
    ),
  ];
}
