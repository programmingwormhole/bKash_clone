import 'package:bKash_flutter/views/auth/auth.dart';
import 'package:bKash_flutter/views/auth/name.dart';
import 'package:bKash_flutter/views/auth/otp.dart';
import 'package:bKash_flutter/views/auth/pin.dart';
import 'package:bKash_flutter/views/auth/profile_picture.dart';
import 'package:bKash_flutter/views/splash/splash.dart';
import 'package:bKash_flutter/views/welcome/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:bKash_flutter/routes/route_names.dart';
import 'package:bKash_flutter/views/home/home_screen.dart';

class RouteDestinations {
  static List<GetPage> pages = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: RouteNames.auth,
      page: () => const AuthScreen(),
    ),
    GetPage(
      name: RouteNames.otp,
      page: () => const OtpVerifyScreen(),
    ),
    GetPage(
      name: RouteNames.pin,
      page: () => const PinCodeScreen(),
    ),
    GetPage(
      name: RouteNames.name,
      page: () => const NameScreen(),
    ),
    GetPage(
      name: RouteNames.profilePicture,
      page: () => const ProfilePictureScreen(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => HomeScreen(),
    ),
  ];
}
