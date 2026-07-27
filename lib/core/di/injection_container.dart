import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wasel_app/core/features/dashboard_home/orders/cubit/orders_cubit.dart';
import 'package:wasel_app/core/features/menu/items/cubit/item_cubit.dart';
import 'package:wasel_app/core/features/menu/items/repo/item_repo.dart';
import 'package:wasel_app/core/features/menu/items/services/item_sevice.dart';
import 'package:wasel_app/core/features/notifications_messages/messages/cubit/messages_cubit.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications/cubit/notifications_cubit.dart';
import 'package:wasel_app/core/features/profile_info/cubit/profile_info_cubit.dart';

import 'package:wasel_app/core/features/reviews/cubit/review_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(() => ReviewCubit());
  sl.registerLazySingleton(() => OrdersCubit());
  sl.registerLazySingleton(() => NotificationsCubit());
  sl.registerLazySingleton(() => MessagesCubit());
  sl.registerLazySingleton(() => ItemSevice(sl()));
  sl.registerLazySingleton(() => ItemRepo(itemService: sl()));
  sl.registerLazySingleton(() => ItemCubit(itemRepo: sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ProfileInfoCubit>(() => ProfileInfoCubit());
}
