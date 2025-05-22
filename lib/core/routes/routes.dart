import 'package:go_router/go_router.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';

import '../../presentation/screens/splash_screen/splash_screen.dart';
import '../../presentation/widgets/error_screen/error_screen.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
      initialLocation: RoutePath.splashScreen.addBasePath,
      // navigatorKey: Get.key,
      debugLogDiagnostics: true,
      routes: [
        ///======================= splash Route =======================

        GoRoute(
          name: RoutePath.splashScreen,
          path: RoutePath.splashScreen.addBasePath,
          builder: (context, state) => const SplashScreen(),
          // redirect: (context, state) {
          //   Future.delayed(const Duration(seconds: 1), () {
          //     AppRouter.route.replaceNamed(RoutePath.chooseRole);
          //   });
          //   return null;
          // },
        ),

        ///======================= Error Route =======================
        GoRoute(
            name: RoutePath.errorScreen,
            path: RoutePath.errorScreen.addBasePath,
            builder: (context, state) => const ErrorPage()),

        ///======================= LogIn Route =======================

        ///======================= Forgot Pass Route =======================

        ///======================= Reset Pass Route =======================

        ///======================= Varification Route =======================

        ///======================= Sign Up Route =======================

        ///======================= Choose Language =======================

        /// <<<<<<<<<<<<<<======================= Worker Route =======================>>>>>>>>>>>>>>>>>>

        /// ==================== Worker Home ====================

        /// ==================== Worker Profile ====================

        /// ==================== Order/Worked History ====================

        /// ==================== Worker Notification ====================

        /// ========================================== Client Section =====================================

        /// ==================== Client Service ===================

        /// ==================== Subscription Packages ===================

        /// ==================== Client Service Request ===================

        /// ==================== Client Service Request ===================

        /// ==================== Terms of Use ===================

        /// ==================== Privacy Policy ===================
      ]);

  static GoRouter get route => initRoute;
}

// extension on String {
//   get addBasePath => null;
// }
