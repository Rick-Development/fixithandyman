import 'package:fixithandyman/routes/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fix it Handyman",
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: AppConstants.primaryColor),
      //   useMaterial3: true,
      // ),
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
