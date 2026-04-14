import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await di.init();
  Hive.registerAdapter(UserReviewModelAdapter());
  Hive.registerAdapter(MenuModelAdapter());
  Hive.registerAdapter(NotificationsModelAdapter());
  Hive.registerAdapter(MessagesModelAdapter());
  Hive.registerAdapter(IngredientModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,

      builder: (ctx, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          home: MainScreen(),
        );
      },
    );
  }
}
