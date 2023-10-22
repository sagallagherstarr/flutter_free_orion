import 'dart:developer';

import "package:flutter/foundation.dart";
import 'package:flutter/material.dart';
import "package:logging/logging.dart";
import "package:logging_flutter/logging_flutter.dart";


import "ui/app.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;

  // GetIt.I.registerSingleton<EventBus>(EventBus());
  // GetIt.I.registerSingleton<Dio>(Dio());
  // // GetIt.I.registerSingleton<RandomUuidGenerator>(RandomUuidGenerator());
  //
  // runApp(const MyApp());
  runApp(const FlutterFreeOrionApp());
  init();
}

// This sets up the Flogger logging page for our app.
// If the app is not in debug mode, logging becomes a no-op, and the flogger
// isn't listening anyway.
void init() {
  Flogger.init(config: const FloggerConfig(
    loggerName: "root",
    printClassName: true,
    printMethodName: true,
    showDateTime: true,
    showDebugLogs: true,
  ));

  if (kDebugMode) {
    Flogger.registerListener(
          (record) => LogConsole.add(
        OutputEvent(record.level, [record.printable()]),
        bufferSize: 1000, // Remember the last X logs
      ),
    );

    Flogger.registerListener(
          (record) => log(record.printable(), stackTrace: record.stackTrace),
    );
  }
}