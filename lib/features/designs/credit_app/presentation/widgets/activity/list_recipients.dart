import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getX/list_recipients_controller.dart';

class ListRecipients extends StatelessWidget {
  const ListRecipients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListRecipientsController>(
      init: ListRecipientsController(),
      builder: (c) {
        final list = c.recipients;
        return AnimatedList(
          key: c.listKey,
          controller: c.controller,
          reverse: true,
          initialItemCount: list.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, i, a) {
            return FadeTransition(
              opacity: a,
              child: list[i],
            );
          },
        );
      },
    );
  }
}
