import 'package:flutter/material.dart';
import 'package:wasel_app/core/config/request_status.dart';

class CustomeShowAlertDialog extends StatelessWidget {
  const CustomeShowAlertDialog({super.key,required this.title,required this.content,this.onTap,this.state});
final String title;
final String content;
final VoidCallback? onTap;
final RequestStatus? state;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                  title: Text(title),
                  content: Text(content),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: onTap,
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
  }
}