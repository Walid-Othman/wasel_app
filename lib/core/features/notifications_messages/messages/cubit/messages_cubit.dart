import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';

import 'package:wasel_app/core/features/notifications_messages/messages/model/messages_model.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesState());

  Future<void> fetchMessages() async {
    emit(state.copyWith(stauts: RequestStatus.loading));
    await Future.delayed(Duration(seconds: 1));
    try {
      emit(
        state.copyWith(
          stauts: RequestStatus.loaded,
          messages: [
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
            MessagesModel(
              id: "1",
              userName: "Walid",
              userImage: "",
              time: '19:37',
              lastMessage: "Hello Eng Mahmoud",
              unReadMessagesCount: 1,
            ),
          ],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(stauts: RequestStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
