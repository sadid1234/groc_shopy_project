import 'package:go_router/go_router.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/presentation/screens/auth/admin_signup_screen%20.dart';
import 'package:groc_shopy/presentation/screens/auth/auth_screen.dart';
import 'package:groc_shopy/presentation/screens/auth/forgot_password_screen.dart';
import 'package:groc_shopy/presentation/screens/auth/password_reset_confirm_screen.dart';
import 'package:groc_shopy/presentation/screens/auth/set_new_password_screen.dart';
import 'package:groc_shopy/presentation/screens/auth/update_password_success_screen.dart';
import 'package:groc_shopy/presentation/screens/auth/verify_code_screen.dart';
import 'package:groc_shopy/presentation/screens/home/home_screen.dart';

import '../../presentation/screens/splash_screen/splash_screen.dart';
import '../../presentation/widgets/error_screen/error_screen.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
      // initialLocation: RoutePath.splashScreen.addBasePath,
      initialLocation: RoutePath.home.addBasePath,
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

        ///======================= Auth Route =======================
        GoRoute(
          name: RoutePath.auth,
          path: RoutePath.auth.addBasePath,
          builder: (context, state) => AuthScreen(),
        ),

        ///======================= Sign Up Route =======================
        GoRoute(
          name: RoutePath.adminSignUp,
          path: RoutePath.adminSignUp.addBasePath,
          builder: (context, state) => const AdminSignUpScreen(),
        ),

        ///======================= Forgot Pass Route =======================
        GoRoute(
          name: RoutePath.forgotPass,
          path: RoutePath.forgotPass.addBasePath,
          builder: (context, state) => ForgotPasswordScreen(),
        ),

        ///======================= Reset Pass Confirm =======================
        GoRoute(
          name: RoutePath.resetPassConfirm,
          path: RoutePath.resetPassConfirm.addBasePath,
          builder: (context, state) => const PasswordResetConfirmScreen(),
        ),

        ///======================= Reset Pass Route =======================
        GoRoute(
          name: RoutePath.resetPass,
          path: RoutePath.resetPass.addBasePath,
          builder: (context, state) => const SetPasswordScreen(),
        ),

        ///======================= Verification Route =======================
        GoRoute(
          name: RoutePath.verification,
          path: RoutePath.verification.addBasePath,
          builder: (context, state) => const CodeVerificationScreen(),
        ),

        ///======================= Verification Success =======================
        GoRoute(
          name: RoutePath.resetPasswordSuccess,
          path: RoutePath.resetPasswordSuccess.addBasePath,
          builder: (context, state) => UpdatePasswordSuccessScreen(),
        ),

        ///======================= LogIn Route =======================

        ///======================= Forgot Pass Route =======================

        ///======================= Reset Pass Route =======================

        ///======================= Verification Route =======================

        ///======================= Choose Language =======================

        /// <<<<<<<<<<<<<<======================= Worker Route =======================>>>>>>>>>>>>>>>>>>

        /// ====================  Home ====================
        GoRoute(
          name: RoutePath.home,
          path: RoutePath.home.addBasePath,
          builder: (context, state) => HomeScreen(),
        ),

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
