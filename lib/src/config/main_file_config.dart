import 'dart:async';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:textgenie/firebase_options.dart';
import 'package:textgenie/main.dart';

class MainClassConfig {
  static Future<void> initialize() async {
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Window.initialize();
      final document = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(document.path);
      await Window.setSubtitle("A Genie for Text");
      await Window.overrideMacOSBrightness(dark: true);
      await Window.enableFullSizeContentView();
      await Window.setBlurViewState(MacOSBlurViewState.active);
      await Window.setEffect(
          effect: WindowEffect.contentBackground, dark: true);
      await DesktopWindow.setWindowSize(const Size(1000, 720));
      await DesktopWindow.setMinWindowSize(const Size(1000, 720));
      await DesktopWindow.setMaxWindowSize(const Size(1000, 720));
      await Firebase.initializeApp(
        name: "TextGenie",
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      runApp(const TextGenieApp());
    },
        (error, stack) =>
            FirebaseCrashlytics.instance.recordError(error, stack));
  }
}
