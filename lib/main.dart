import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wasel_app/core/features/reviews/model/user_review_model.dart';
import 'package:wasel_app/core/features/reviews/user_review_screen.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

void main() async {
  runApp(const MyApp());
  Hive.registerAdapter(UserReviewModelAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.grey.shade500),
        scaffoldBackgroundColor: LightColors.primaryColor,
      ),
      home: UserReviewScreen(),
    );
  }
}
