import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/items/cubit/item_cubit.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});
  @override
  Widget build(BuildContext context) {
    final ItemCubit itemCubit = sl<ItemCubit>();
    return BlocBuilder<ItemCubit, ItemState>(
      bloc: itemCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Upload photo/video'),
             SizedBox(height:  AppSizes.h10),
            SizedBox(
              height: AppSizes.h120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // عدد العناصر = عدد الصور المرفوعة + 1 (لزر الإضافة)
                itemCount: state.imageList.length + 1,
                itemBuilder: (context, index) {
                  // إذا كان الـ index يساوي طول القائمة، إذن هذا هو "مربع الإضافة"
                  if (index == state.imageList.length) {
                    return GestureDetector(
                      onTap: () => itemCubit.pickImage(),
                      child: Container(
                        margin:  EdgeInsets.all(AppSizes.r10),
                        width: AppSizes.w100,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius:  Radius.circular(AppSizes.r16),
                          dashPattern: const [6, 4],
                          color: Colors.grey.shade400,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/upload.svg'),
                                SizedBox(height: AppSizes.h10),
                                Text(
                                  "Add",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  // وإلا، نعرض الصورة التي تم رفعها
                  return Stack(
                    children: [
                      Container(
                        margin:  EdgeInsets.all(AppSizes.r8),
                        width: AppSizes.w100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizes.r16),
                          image: DecorationImage(
                            image: FileImage(state.imageList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // زر الحذف في الزاوية
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => itemCubit.removeImage(index),
                          child:  CircleAvatar(
                            radius: AppSizes.r12,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
