import 'package:flutter/material.dart';

import '../../../core/utils/durations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Widget firstWidget = Container(
  key: ValueKey<int>(0),
  height: 50,
  width: 80,
  color: Colors.red,
);

Widget secondWidget = Container(
  key: ValueKey<int>(1),
  height: 50,
  width: 80,
  color: Colors.green,
);

class _MyAppState extends State<MyApp> {
  Widget currentWidget = firstWidget;

  bool isSelectedEmoji = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trasitions Icons',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trasitions Icons Bar'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cabin),
          onPressed: () {
            setState(() {
              if (currentWidget == secondWidget) {
                currentWidget = firstWidget;
              } else {
                currentWidget = secondWidget;
              }
            });
          },
        ),
        body: Center(
          child: AnimatedSwitcher(
            duration: Durations.getDurationInMilliseconds(800),
            child: currentWidget,
            transitionBuilder: (child, animation) {
              // NOTE: Replace with the two widget
              return SlideTransition(
                position: Tween(
                  begin: Offset(0, 2.5),
                  end: Offset(0, 0),
                ).animate(animation),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
