import "package:flutter/material.dart";
import "package:ochildasturxon/src/feature/auth/view/pages/splash_page.dart";
import "../../feature/settings/inherited_locale_notifier.dart";
import "../../feature/settings/inherited_theme_notifier.dart";
import "../../feature/settings/locale_controller.dart";
import "../../feature/settings/theme_controller.dart";

final ThemeController themeController = ThemeController();
final LocalController localController = LocalController();

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
        themeController: themeController,
        child: InheritedLocalNotifier(
          localController: localController,
          child: Builder(
            builder: (context) => const MaterialApp(
              // title: "Tez Yetkaz",
              // theme: ThemeData(
              //   bottomSheetTheme: const BottomSheetThemeData(
              //     backgroundColor: Colors.white,
              //   ),
              // ),
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            ),
          ),
        ),
      );
}
