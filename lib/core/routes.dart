import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oyelabs/features/auth/pages/auth_page.dart';
import 'package:oyelabs/features/auth/pages/onboarding_page.dart';
import 'package:oyelabs/features/auth/pages/otp_page.dart';
import 'package:oyelabs/features/home/pages/home_page.dart';
import 'package:oyelabs/features/home/pages/location_page.dart';

class AppRoutes {
  // auth
  static const String core = '/';
  static const String auth = '/auth';
  static const String onboarding = '/onboarding';
  static const String otp = '/otp';

  // home
  static const String home = '/home';
  static const String location = '/location';

  // route
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // core
      case core:
        if (FirebaseAuth.instance.currentUser == null) {
          return MaterialPageRoute(builder: (_) => const OnboardingPage());
        } else {
          return MaterialPageRoute(builder: (_) => const HomePage());
        }

      // auth
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case otp:
        return MaterialPageRoute(builder: (_) => const OtpPage());

      // home
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case location:
        return MaterialPageRoute(builder: (_) => const LocationPage());

      // case addConsumer:
      // final args = settings.arguments as Map<String, dynamic>?;
      // return MaterialPageRoute(
      //   builder: (_) => AddConsumerPage(consumer: args?['consumer']),
      // );

      // default
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
