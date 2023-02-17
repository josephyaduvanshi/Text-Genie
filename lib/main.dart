import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:textgenie/src/routes/route_names.dart';

import 'src/config/main_file_config.dart';
import 'src/routes/routes_link.dart';

void main() async {
  await MainClassConfig.initialize();
}

class TextGenieApp extends StatelessWidget {
  const TextGenieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TitlebarSafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          splashFactory: InkRipple.splashFactory,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          splashFactory: InkRipple.splashFactory,
        ),
        themeMode: ThemeMode.dark,
        initialRoute: RouteNames.homePage,
        getPages: RoutesLink.routes,
      ),
    );
  }
}
