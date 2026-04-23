import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasel_app/core/app_sizes/app_sizes.dart';
import 'package:wasel_app/core/di/injection_container.dart';
import 'package:wasel_app/core/features/menu/items/componnet/custome_text_form_field.dart';
import 'package:wasel_app/core/features/menu/items/componnet/price_componnet.dart';
import 'package:wasel_app/core/features/menu/items/componnet/upload_image.dart';
import 'package:wasel_app/core/features/menu/items/cubit/item_cubit.dart';

import 'package:wasel_app/core/theme/light_colors/light_colors.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({super.key, this.isUpdate = false, this.data});
  final bool? isUpdate;
  final data;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ItemCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            " ${isUpdate == true ? "Update Item" : "Add New Item"}",
            style: TextStyle(fontSize: AppSizes.sp18),
          ),
        ),
        body: BlocBuilder<ItemCubit, ItemState>(
          builder: (context, state) {
            final itemCubit = context.read<ItemCubit>();
            return Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.r16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomeTextFormField(
                        title: 'item name',
                        hintText: 'Mazalichiken Halim.... ',
                        icon: Icons.fastfood,
                        keyboardType: TextInputType.text,
                        onChanged: (value) =>
                            itemCubit.updateField(name: value),
                        controller: itemCubit.itemName,
                      ),
                      SizedBox(height: AppSizes.h20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSizes.h20),
                          SizedBox(height: AppSizes.h170, child: UploadImage()),
                        ],
                      ),
                      PriceComponnet(),
                      SizedBox(height: AppSizes.h30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DETAILS'),
                          SizedBox(height: AppSizes.h20),
                          CustomeTextFormField(
                            hintText: "Enter description",
                            icon: Icons.description,
                            keyboardType: TextInputType.text,
                            onChanged: (value) =>
                                itemCubit.updateField(description: value),
                            controller: itemCubit.description,
                            maxLines: 4,
                            isdescraption: true,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.h20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LightColors.orangeColor,
                          foregroundColor: LightColors.primaryColor,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            AppSizes.h42,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r12),
                          ),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (isUpdate == true) {
                              await itemCubit.handelUpdateItem(data);
                            }
                            await itemCubit.handelAddItem();
                          }
                        },
                        child: Text(
                          isUpdate == true ? "Save Changes" : "ADD ITEM",
                          style: TextStyle(fontSize: AppSizes.sp18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
