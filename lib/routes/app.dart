
import 'package:fixithandyman/views/chat_screen.dart';
import 'package:fixithandyman/views/home_screen.dart';
import 'package:flutter/material.dart';
import '../views/splash_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String splashScreen = '/splash_screen';
  static const String p2p = '/p2p';
  static const String loanSave = '/loansave';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/chat':
        return MaterialPageRoute(builder: (_) => ChatScreen());
      // case '/filter':
      //   return MaterialPageRoute(builder: (_) => FilterScreen());
      // case '/message':
      //   return MaterialPageRoute(builder: (_) => MessageScreen());
      // case '/bookmark':
      //   return MaterialPageRoute(builder: (_) => BookmarkScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
