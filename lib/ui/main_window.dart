import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import 'package:logging_flutter/logging_flutter.dart';

class AppMainWindow extends StatefulWidget {
  const AppMainWindow({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AppMainWindow> createState() => _AppMainWindowState();
}

class _AppMainWindowState extends State<AppMainWindow> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        // TODO: replace with the full list of icon buttons from FreeOrion
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Flogger.i("Alert Icon pressed");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a ALERT')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Flogger.i("next icon pressed");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a NEXT PAGE')));
            }
          ),
          if (kDebugMode) IconButton(
            icon: const Icon(Icons.adb),
            tooltip: "open application log",
            onPressed: () {
              LogConsole.open(context);
            }
          ),

        ],
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Placeholder(),
      ),
    );
  }
}
