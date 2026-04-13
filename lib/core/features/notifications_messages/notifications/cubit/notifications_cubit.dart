import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications/model/notifications_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState());
  
  void changeTap(int index){
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> fetchNotifications() async {
    emit(state.copyWith(status: RequestStatus.loading));
    await Future.delayed(Duration(seconds: 1));
    try {
      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          notifications: [
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order ',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order ',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
            ),
            NotificationsModel(
              id: "21",
              title:
                  ' Placed anew order hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
              userName: "Walid Othman",
              date: "20 min ago",
              userImage: "",
              foodImage: "",
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
