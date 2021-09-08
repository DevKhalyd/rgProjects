import 'package:flutter/material.dart';

import '../../features/designs/saver_password/presentation/widgets/home/mini_widgets/filter_icon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ink App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ink App Bar'),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FilterIcon(),
      ),
    );
  }
}
