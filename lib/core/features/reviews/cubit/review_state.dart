

part of 'review_cubit.dart';

class ReviewState {
  final RequestStatus status;
  final List<UserReviewModel> reviews;
  final String? errorMessage;

  ReviewState({
    this.status = RequestStatus.initial, 
    this.reviews = const [],
    this.errorMessage,
  });

 
  ReviewState copyWith({
    RequestStatus? status,
    List<UserReviewModel>? reviews,
    String? errorMessage,
  }) {
    return ReviewState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
