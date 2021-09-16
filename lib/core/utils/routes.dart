import 'package:get/get.dart';
import 'package:rg_projects/features/fancy_widgets/clock/screens/clock_screen.dart';

import '../../features/clone_features/clone_features_section.dart';
import '../../features/clone_features/whatsapp_chat/presentation/bindings/camera_binding.dart';
import '../../features/clone_features/whatsapp_chat/presentation/bindings/wsp_chat_binding.dart';
import '../../features/clone_features/whatsapp_chat/presentation/screens/whatsapp_camera.dart';
import '../../features/clone_features/whatsapp_chat/presentation/screens/whatsapp_chat.dart';
import '../../features/designs/credit_app/presentation/screens/activity_screen.dart';
import '../../features/designs/designs_section.dart';
import '../../features/designs/saver_password/presentation/getX/saver_binding.dart';
import '../../features/designs/saver_password/presentation/screens/saver_password_screen.dart';
import '../../features/fancy_widgets/fancy_widgets_section.dart';
import '../../features/native_services/native_services_section.dart';
import '../../home/screens/home.dart';

abstract class Routes {
  // TODO: When in web, create the 404 error page
  static const _transition = Transition.leftToRight;
  static const _transitionDuration = Duration(milliseconds: 175);

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

  // Saver Password
  static const SAVER_PASSWORD = '/saverPassword';

  // Credit Appp
  static const CREDIT_APP = '/creditApp';

  // Clock
  static const CLOCK_ANIMATION = '/clock';

  // GetxPages
  static final pages = <GetPage>[
    GetPage(
      name: INITIAL_ROUTE,
      page: () => Home(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: DESIGNS,
      page: () => DesignsSection(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: CLONE_FEATURES,
      page: () => CloneFeatureSection(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: FANCY_WIDGETS,
      page: () => FancyWidgetsSection(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: NATIVE_SERVICES,
      page: () => NativesServicesSection(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    // Whatsap pages
    GetPage(
      name: WHATSAPP_CHAT,
      page: () => WhatsAppChat(),
      binding: WspChatBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: WHATSAPP_CAMERA,
      page: () => WhatsAppCamarera(),
      binding: CameraBinding(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    // SAVER
    GetPage(
        name: SAVER_PASSWORD,
        page: () => SaverPasswordScreen(),
        transition: _transition,
        transitionDuration: _transitionDuration,
        binding: SaverBinding()),
    // Credit App
    // Change this
    GetPage(
      name: CREDIT_APP,
      page: () => ActivityScreen(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
    GetPage(
      name: CLOCK_ANIMATION,
      page: () => ClockScreen(),
      transition: _transition,
      transitionDuration: _transitionDuration,
    ),
  ];
}
