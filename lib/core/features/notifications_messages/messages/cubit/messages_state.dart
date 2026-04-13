// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'messages_cubit.dart';

@immutable
class MessagesState {
  final RequestStatus stauts;
  final List<MessagesModel> messages;
  final String? errorMessage;
  MessagesState({
    this.stauts = RequestStatus.initial,
    this.messages = const [],
    this.errorMessage,
  });

  MessagesState copyWith({
    RequestStatus? stauts,
    List<MessagesModel>? messages,
    String? errorMessage,
  }) {
    return MessagesState(
      stauts: stauts ?? this.stauts,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

