import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/notifications_messages/messages/conversation_screen.dart';
import 'package:wasel_app/core/features/notifications_messages/messages/cubit/messages_cubit.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications/cubit/notifications_cubit.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications_screen.dart';
import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class NavigationScreen extends StatelessWidget {
  final messagesCubit = sl<MessagesCubit>()..fetchMessages();
  NavigationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(),
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("${state.currentIndex == 0 ? "Notifications" : "Messages"}"),),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  BlocBuilder<MessagesCubit, MessagesState>(
                    bloc: messagesCubit,
                    builder: (context, messageState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTabItem(
                            context,
                            "Notifications",
                            0,
                            state.currentIndex,
                          ),
                          _buildTabItem(
                            context,
                            "Messages (${messageState.messages.length > 100 ? "+99" : "${messageState.messages.length}"})",
                            1,
                            state.currentIndex,
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: state.currentIndex == 0
                        ? NotificationsScreen(
                            // notificationsCubit: notificationsCubit,
                          )
                        : ConversationScreen(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildTabItem(
  BuildContext context,
  String title,
  int index,
  int currentIndex,
) {
  bool isSelected = index == currentIndex;
  return GestureDetector(
    onTap: () => context.read<NotificationsCubit>().changeTap(index),
    child: Text(
      title,
      style: TextStyle(
        color: isSelected ? LightColors.orangeColor : Colors.grey,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}
