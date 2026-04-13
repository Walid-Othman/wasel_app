import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/notifications_messages/messages/componanet/message_with_shimmer.dart';
import 'package:wasel_app/core/features/notifications_messages/messages/cubit/messages_cubit.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class ConversationScreen extends StatelessWidget {
  final messagesCubit = sl<MessagesCubit>()..fetchMessages();
  ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesCubit, MessagesState>(
      bloc: messagesCubit,
      builder: (context, state) {
        switch (state.stauts) {
          case RequestStatus.loading:
            {
              return MessageWithShimmer();
            }
          case RequestStatus.initial:
            {
              return SizedBox.shrink();
            }
          case RequestStatus.error:
            {
              return Center(
                child: Text(state.errorMessage ?? " Faild to get data"),
              );
            }
          case RequestStatus.loaded:
            {
              return state.messages.isEmpty
                  ? Center(child: Text("No messages found"))
                  : ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final data = state.messages[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF98A8B8),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: CustomeCachedNetworkImage(
                                      urlImage: data.userImage,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: LightColors.primaryColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              title: Text(data.userName),
                              subtitle: Text(data.lastMessage),
                              trailing: Column(
                                children: [
                                  Text(data.time),
                                  SizedBox(height: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: LightColors.orangeColor,
                                    ),
                                    child: Text(
                                      '${data.unReadMessagesCount > 100 ? "+99" : data.unReadMessagesCount}',
                                      style: TextStyle(
                                        color: LightColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 18),
                            Divider(color: Color(0xFFF0F4F9)),
                          ],
                        );
                      },
                    );
            }
        }
      },
    );
  }
}
