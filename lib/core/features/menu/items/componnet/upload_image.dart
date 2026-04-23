import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/menu/items/cubit/item_cubit.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/shared/custome_cached_network_image.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemCubit itemCubit = sl<ItemCubit>();
    return BlocBuilder<ItemCubit, ItemState>(
      bloc: itemCubit,
      builder: (context, state) {
        // حساب إجمالي عدد الصور لعرضها معاً
        final int oldImagesCount = state.oldImages.length;
        final int newImagesCount = state.imageList.length;
        final int totalItems = oldImagesCount + newImagesCount + 1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Upload photo/video'),
            SizedBox(height: AppSizes.h10),
            SizedBox(
              height: AppSizes.h120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: totalItems,
                itemBuilder: (context, index) {
                  // 1. حالة زر الإضافة (دائماً في الأخير)
                  if (index == oldImagesCount + newImagesCount) {
                    return _buildAddButton(itemCubit);
                  }

                  // 2. حالة عرض الصور القديمة (التي تأتي من URL)
                  if (index < oldImagesCount) {
                    return _buildImageWrapper(
                      child: CustomeCachedNetworkImage(urlImage: state.oldImages[index]),
                      onDelete: () => itemCubit.removeOldImage(index), // تأكد من وجود هذه الدالة في الكيوبيت
                    );
                  }

                  // 3. حالة عرض الصور الجديدة (التي تأتي من File)
                  // نحسب مكانه الفعلي بطرح عدد الصور القديمة من الـ index الحالي
                  final relativeIndex = index - oldImagesCount;
                  return _buildImageWrapper(
                    child: Image.file(File(state.imageList[relativeIndex],)),
                    // child: CustomeCachedNetworkImage(urlImage: state.imageList[relativeIndex]),
                    onDelete: () => itemCubit.removeImage(relativeIndex),
                  
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  // ويدجت مساعدة لعرض زر الإضافة
  Widget _buildAddButton(ItemCubit itemCubit) {
    return GestureDetector(
      onTap: () => itemCubit.pickImage(),
      child: Container(
        margin: EdgeInsets.all(AppSizes.r10),
        width: AppSizes.w100,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(AppSizes.r16),
          dashPattern: const [6, 4],
          color: Colors.grey.shade400,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/upload.svg'),
                SizedBox(height: AppSizes.h10),
                const Text("Add", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ويدجت مساعدة لعرض الصورة مع زر الحذف
  Widget _buildImageWrapper({required Widget child, required VoidCallback onDelete}) {
 
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(AppSizes.r8),
          width: AppSizes.w100,
          clipBehavior: Clip.antiAlias, // لضمان قص الصورة مع الحواف
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.r16),
          ),
          child: child,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: onDelete,
            child: CircleAvatar(
              radius: AppSizes.r12,
              backgroundColor: Colors.red,
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}