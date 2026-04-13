import 'package:get_it/get_it.dart';
import 'package:wasel_app/core/features/dashboard_home/orders/cubit/orders_cubit.dart';
import 'package:wasel_app/core/features/notifications_messages/messages/cubit/messages_cubit.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications/cubit/notifications_cubit.dart';

import 'package:wasel_app/core/features/reviews/cubit/review_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(() => ReviewCubit());
  sl.registerLazySingleton(() => OrdersCubit());
  sl.registerLazySingleton(() => NotificationsCubit());
  sl.registerLazySingleton(() => MessagesCubit());
}
