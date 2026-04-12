import 'package:get_it/get_it.dart';

import 'package:wasel_app/core/features/reviews/cubit/review_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(() => ReviewCubit());
}
