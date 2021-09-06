import 'package:flutter/widgets.dart';

import '../../home/models/section_model.dart';
import 'routes.dart';

abstract class UI {
  static const primaryColor = const Color.fromRGBO(0, 196, 158, 1.0);

  static const acentColor = const Color.fromRGBO(28, 61, 61, 0.85);

  static const footerColor = const Color.fromRGBO(36, 42, 47, 1);

  ///  In each list:
  ///  0 contains the section.
  ///  1 contains the about section
  ///  3 contains the ro
  static final sectionList = <SectionModel>[
    SectionModel(
      section: 'Designs',
      about: 'Beautiful UI inpired in Dribble or Pinterest',
      route: Routes.DESIGNS,
    ),
    SectionModel(
      section: 'Clone Features',
      about:
          'Features complex taken from recognized apps like WhatsApp, Netflix or YT Music',
      route: Routes.CLONE_FEATURES,
    ),
    SectionModel(
      section: 'Fancy Widgets',
      about:
          'Widgets from scratch like a Custom Progress Indicator, Rendering Objects or CustomPainter with Animations',
      route: Routes.FANCY_WIDGETS,
    ),
    SectionModel(
      section: 'Native Services',
      about:
          'Services like: Background services, Notifications that ties in with each platform',
      route: Routes.NATIVE_SERVICES,
    ),
  ];
}
