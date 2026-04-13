// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notifications_cubit.dart';

@immutable
class  NotificationsState {
  final RequestStatus status;
  final List<NotificationsModel> notifications;
  final String? errorMessage;
  final int currentIndex;
 const NotificationsState({
     this.status = RequestStatus.initial,
     this.notifications =const [],
    this.errorMessage,
    this.currentIndex=0
  });

  NotificationsState copyWith({
    RequestStatus? status,
    List<NotificationsModel>? notifications,
    String? errorMessage,
    int? currentIndex,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      errorMessage: errorMessage ?? this.errorMessage,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
 }


