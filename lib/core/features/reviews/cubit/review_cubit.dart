import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/reviews/model/user_review_model.dart';
part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewState());

  void fetchReviews() async {
       
    emit(state.copyWith(status: RequestStatus.loading));
    await Future.delayed(Duration(seconds: 5));
    try {
      

      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          reviews: [
            UserReviewModel(
              userName: "Walid Othman Diab",
              comment:
                  "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks. ",
              rating: 4,
              userImage: "",
              date: "2026-04-11",
            ),
            UserReviewModel(
              userName: "Walid Othman Diab",
              comment:
                  "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks. ",
              rating: 3,
              userImage: "",
              date: "2026-04-11",
            ),
            UserReviewModel(
              userName: "Walid Othman Diab",
              comment:
                  "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks. ",
              rating: 2,
              userImage: "",
              date: "2026-04-11",
            ),
            UserReviewModel(
              userName: "Walid Othman Diab",
              comment:
                  "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks. ",
              rating: 1,
              userImage: "",
              date: "2026-04-11",
            ),
            UserReviewModel(
              userName: "Walid Othman Diab",
              comment:
                  "This Food so tasty & delicious. Breakfast so fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks. ",
              rating: 0,
              userImage: "",
              date: "2026-04-11",
            ),
          ],     
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: RequestStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
