import 'package:flutter/material.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/shared/component/custome_show_alert_dialog.dart';

class CustomeBottomSheet extends StatelessWidget {
  const CustomeBottomSheet({
    super.key,
    required this.listTitleone,
    required this.listTitletwo,

    this.onDelete,
    this.onEdit,
    this.showEditOption = true,
  });
  const CustomeBottomSheet.justDelete({super.key, required this.listTitletwo ,this.onDelete, this.onEdit})
    : listTitleone = '',
     
      showEditOption = false;

  final bool showEditOption;
  final String listTitleone;
  final String listTitletwo;

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.ph20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSizes.w40,
            height: AppSizes.h5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(AppSizes.r10),
            ),
          ),
          SizedBox(height: AppSizes.h20),
          if (showEditOption)
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: Text(listTitleone),
              onTap: onEdit,
            ),

          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: Text(listTitletwo, style: TextStyle(color: Colors.red)),
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}
