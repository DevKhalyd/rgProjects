import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/durations.dart';
import 'package:rg_projects/core/utils/logical.dart';

import '../widgets/activity/recipient_item.dart';

class ListRecipientsController extends GetxController {
  final controller = ScrollController();
  final listKey = GlobalKey<AnimatedListState>();

  static final _defaultItems = <RecipientItem>[
    RecipientItem(
      name: 'Francis D.',
      image: 'h1',
      store: 'Starbucks',
      storeColor: Colors.green,
    ),
    RecipientItem(
      name: 'Joshua D.',
      image: 'h2',
      store: 'iTunes',
      storeColor: Colors.purple,
    ),
    RecipientItem(
      name: 'Angelica D.',
      image: 'h3',
      store: 'PS Store',
      storeColor: Colors.pink,
    ),
  ];

  final recipients = <RecipientItem>[
    ..._defaultItems,
  ];

  @override
  void onInit() {
    Timer.periodic(Durations.getDurationInMilliseconds(4500), (t) {
      if (recipients.length < 20) {
        final pos = Logical.generateInt(max: 3);
        recipients.add(_defaultItems[pos]);
        listKey.currentState?.insertItem(recipients.length - 1);
         controller.animateTo(controller.position.maxScrollExtent + 70,
            duration: Durations.getDurationInMilliseconds(750),
            curve: Curves.linear);
      } else
        t.cancel();
    });

    super.onInit();
  }
}
