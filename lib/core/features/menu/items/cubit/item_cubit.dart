import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/menu/items/repo/item_repo.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit({required this.itemRepo}) : super(ItemState());

  final TextEditingController itemName = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  ItemRepo itemRepo;

  Future<void> handelUpdateItem(MenuModel item) async {
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      final List<String> images = [...state.imageList, ...state.oldImages];

      await itemRepo.updateItem(
        item.id,
        name: state.itemName,
        price: state.itemPrice,
        description: state.description,
        images: images,
        category: state.category,
      );

      emit(state.copyWith(status: RequestStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(status: RequestStatus.error, errormessage: e.toString()),
      );
    }
  }

  Future<void> fetchItem() async {
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      final List<MenuModel> results = await itemRepo.getAllItems();
      emit(state.copyWith(status: RequestStatus.loaded, menuModel: results));
    } catch (e) {
      emit(
        state.copyWith(status: RequestStatus.error, errormessage: e.toString()),
      );
    }
  }

  Future<void> handelDelete(MenuModel item) async {
    emit(state.copyWith(status: RequestStatus.loading));
    await Future.delayed(Duration(seconds: 3));
    try {
      await itemRepo.deleteItem(item.id);
      emit(state.copyWith(status: RequestStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(status: RequestStatus.error, errormessage: e.toString()),
      );
    }
  }

  Future<void> handelAddItem() async {
    emit(state.copyWith(status: RequestStatus.loading));
    try {
      await itemRepo.addItem(
        name: state.itemName,
        price: state.itemPrice,
        description: state.description,
        images: state.imageList,
        category: state.category,
      );
      emit(state.copyWith(status: RequestStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.error,
          errormessage: 'Faid to add item',
        ),
      );
    }
  }

  void setItemDataForEdit(MenuModel item) {
    itemName.text = item.title;
    description.text = item.descraption;
    price.text = item.price.toString();

    List<String> newOldImages = [];
    if (item.images.isNotEmpty) {
      newOldImages = [...item.images];
    }
    emit(state.copyWith(oldImages: newOldImages));
  }

  void clearAllFields() {
    itemName.clear();
    description.clear();
    price.clear();
    print("affter clear: ${state.imageList.length}");

    if (!isClosed) {
      emit(
        ItemState(
          status: RequestStatus.initial,
          imageList: List<String>.from([]),
          itemName: "",
          itemPrice: 0,
        ),
      );
    }
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        if (isClosed) return;
        final List<String> images = List.from(state.imageList);
        images.add(pickedFile.path);
        emit(state.copyWith(imageList: images));
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void removeOldImage(int index) {
    final List<String> images = List.from(state.oldImages);
    images.removeAt(index);
    if (!isClosed) {
      emit(state.copyWith(oldImages: images));
    }
  }

  void removeImage(int index) {
    final List<String> images = List.from(state.imageList);
    images.removeAt(index);
    if (!isClosed) {
      emit(state.copyWith(imageList: images));
    }
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
    if (!isClosed) {
      emit(
        state.copyWith(
          itemName: name ?? state.itemName,
          itemPrice: parsedPrice ?? state.itemPrice,
          descraption: description ?? state.description,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    itemName.dispose();
    price.dispose();
    description.dispose();
    return super.close();
  }
}
