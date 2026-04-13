import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications/componnent/notifications_with_shimmer.dart';
import 'package:wasel_app/core/features/notifications_messages/notifications/cubit/notifications_cubit.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';

class NotificationsScreen extends StatelessWidget {
final notificationsCubit = sl<NotificationsCubit>()..fetchNotifications();
  NotificationsScreen({super.key,});
  // final notificationsCubit ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      bloc: notificationsCubit,
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.loading:
            {
              return NotificationsWithShimmer();
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
              return state.notifications.isEmpty
                  ? Center(child: Text("No Notifications hehe"))
                  : SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: state.notifications.length,
                        itemBuilder: (context, index) {
                          final data = state.notifications[index];
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF98A8B8),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: CustomeCachedNetworkImage(
                                        urlImage: data.userImage,
                                      ),
                                    ),
                                    SizedBox(width: 18),
                                    SizedBox(
                                      width: 180,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.userName,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            data.title,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFA5A7B9),
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            data.date,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFA5A7B9),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Color(0xff98A8B8),
                                      ),
                                      child: CustomeCachedNetworkImage(
                                        urlImage: "",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Divider(color: Color(0xFFF0F4F9)),
                              ],
                            ),
                          );
                        },
                      ),
                    );
            }
        }
      },
    );
  }
}
