import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/items/repo/item_repo.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit({required this.itemRepo}) : super(ItemState());
  final TextEditingController itemName = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  ItemRepo itemRepo;

  Future<bool> handelAddItem() async {
    if (isClosed) return false;
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      await itemRepo.addItem(
        name: state.itemName,
        price: state.itemPrice,
        description: state.descraption,
        images: state.imageList,
        category: state.category,
      );
    if (isClosed) return false;
      emit(state.copyWith(status: RequestStatus.loaded));
      return true;
    } catch (e) {
      emit(
        state.copyWith(status: RequestStatus.error, errormessage: e.toString()),
      );
    }
    return false;
   
  }

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        final List<File> images = List.from(state.imageList);
        images.add(File(pickedFile.path));
        emit(state.copyWith(imageList: images));
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void removeImage(int index) {
    final List<File> images = List.from(state.imageList);
    images.removeAt(index);
    emit(state.copyWith(imageList: images));
  }

  void handelisPickUp() {
    bool isPickUp = state.isPicUp;
    isPickUp = !isPickUp;
    emit(state.copyWith(isPicUp: isPickUp, isDelivery: false));
  }

  void handelisDelivery() {
    bool isDelivery = state.isDelivery;
    isDelivery = !isDelivery;
    emit(state.copyWith(isDelivery: isDelivery, isPicUp: false));
  }

  void updateField({String? name, String? price, String? description}) {
    double? parsedPrice;
    if (price != null) {
      parsedPrice = double.tryParse(price) ?? 0.0;
    }
    emit(
      state.copyWith(
        itemName: name ?? state.itemName,
        itemPrice: parsedPrice ?? state.itemPrice,
        descraption: description ?? state.descraption,
      ),
    );
  }
}
