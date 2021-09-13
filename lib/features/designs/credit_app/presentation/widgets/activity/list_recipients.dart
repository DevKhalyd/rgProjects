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
        return ListView.builder(
          controller: c.controller,
          reverse: true,
          itemExtent: 70,
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (_, i) {
            return list[i];
          },
        );
      },
    );
  }
}
