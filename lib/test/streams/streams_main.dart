import 'package:flutter/material.dart';

import '../../core/utils/streams.dart';
import '../../core/widgets/mini_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: _StreamsExample(),
      ),
    );
  }
}

class _StreamsExample extends StatefulWidget {
  const _StreamsExample({
    Key? key,
  }) : super(key: key);

  @override
  __StreamsExampleState createState() => __StreamsExampleState();
}

class __StreamsExampleState extends State<_StreamsExample> {
  final streams = Streams();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HourMinute>(
      //  stream: streams.timedCounter(),
        builder: (_, snapshot) {
          final data = snapshot.data;
          return CenterText('${data?.minute} : ${data?.second}');
        });
  }
}
