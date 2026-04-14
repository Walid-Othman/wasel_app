import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wasel_app/core/features/navigation/main_screen.dart';
import 'package:wasel_app/core/features/notifications_messages/messages/model/messages_model.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications/model/notifications_model.dart';
import 'package:wasel_app/core/features/reviews/model/user_review_model.dart';
import 'package:wasel_app/core/features/menu/model/ingredient_model.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';
import 'package:wasel_app/core/theme/light_theme.dart';
import 'core/di/injection_container.dart' as di;

void main() async {
  runApp(const MyApp());
  await di.init();
  Hive.registerAdapter(UserReviewModelAdapter());
  Hive.registerAdapter(MenuModelAdapter());
  Hive.registerAdapter(NotificationsModelAdapter());
  Hive.registerAdapter(MessagesModelAdapter());
  Hive.registerAdapter(IngredientModelAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: MainScreen(),
    );
  }
}
