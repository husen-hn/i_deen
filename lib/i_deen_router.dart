import 'package:go_router/go_router.dart';
import 'package:i_deen/ui/home/home.dart';
import 'package:i_deen/ui/slpash/splash.dart';

class IDeenRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const Home(),
      ),
    ],
  );
}
