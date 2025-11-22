import 'package:flutter/material.dart';
import 'package:r34_01/core/routes/names.dart';
import 'package:r34_01/screens/home_page.dart';
import 'package:r34_01/screens/login_page.dart';
import 'package:r34_01/widgets/entrypoint_ui.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case RoutesName.entryPointUi:
        return MaterialPageRoute(builder: (_) => const EntryPointUi());

      // case RoutesName.productDetails:
      //   final product = settings.arguments;
      //   return MaterialPageRoute(
      //       builder: (_) => ProductDetailsPage(product: product));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("Route Not Found")),
            ));
    }
  }
}
