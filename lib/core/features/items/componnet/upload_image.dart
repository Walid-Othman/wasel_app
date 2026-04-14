import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/items/cubit/item_cubit.dart';

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
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
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
                        margin: const EdgeInsets.all(8),
                        width: 100,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(16),
                          dashPattern: const [6, 4],
                          color: Colors.grey.shade400,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/upload.svg'),
                                SizedBox(height: 10),
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
                        margin: const EdgeInsets.all(8),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
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
                          child: const CircleAvatar(
                            radius: 12,
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
