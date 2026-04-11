import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/reviews/component/custome_list_review.dart';
import 'package:wasel_app/core/features/reviews/component/custome_list_shimer_review.dart';
import 'package:wasel_app/core/features/reviews/cubit/review_cubit.dart';


class UserReviewScreen extends StatelessWidget {
  const UserReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewCubit()..fetchReviews(),
      child: Scaffold(
        appBar: AppBar(title: Text('Reviews')),
        body: BlocBuilder<ReviewCubit, ReviewState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                {
                  return CustomeListShimerReview();
                }
              case RequestStatus.initial:
                {
                  return const SizedBox.shrink();
                }
              case RequestStatus.error:
                {
                  return Center(
                    child: Text(state.errorMessage ?? "Somethig went wrong"),
                  );
                }
              case RequestStatus.loaded:
                {
                  return state.reviews.isEmpty
                      ? const Center(child: Text("No Reviews Here"))
                      : CustomeListReview(state: state);
                }
            }
          },
        ),
      ),
    );
  }
}
