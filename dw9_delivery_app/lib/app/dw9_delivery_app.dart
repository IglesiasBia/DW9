import 'package:dw9_delivery_app/app/core/providers/application_binding.dart';
import 'package:dw9_delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:dw9_delivery_app/app/pages/home/home_router.dart';
import 'package:dw9_delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Dw9DeliveryApp extends StatefulWidget {
  const Dw9DeliveryApp({super.key});

  @override
  State<Dw9DeliveryApp> createState() => _Dw9DeliveryAppState();
}

class _Dw9DeliveryAppState extends State<Dw9DeliveryApp> {
  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: "Delivery App",
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
        },
      ),
    );
  }
}
