// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'item_cubit.dart';

@immutable
class ItemState {
  final List<MenuModel> items;
  final RequestStatus status;
  final List<String> imageList;
  final List<String> oldImages;
  final String details;
  final String description;
  final String category;
  final bool isPicUp;
  final bool isDelivery;
  final String itemName;
  final double itemPrice;
  final String? errormessage;
  ItemState({
    this.status = RequestStatus.initial,
    this.imageList = const [],
    this.oldImages = const [],
    this.items = const [],
    this.details = '',
    this.description = '',
    this.category = "",
    this.isPicUp = true,
    this.isDelivery = false,
    this.itemName = "",
    this.itemPrice = 0,
    this.errormessage,
  });

  ItemState copyWith({
    RequestStatus? status,
    List<String>? imageList,
    List<String>? oldImages,
    List<MenuModel>? menuModel,
    String? details,
    String? descraption,
    String? category,
    bool? isPicUp,
    bool? isDelivery,
    String? itemName,
    double? itemPrice,
    String? errormessage,
  }) {
    return ItemState(
      status: status ?? this.status,
      imageList: imageList ?? this.imageList,
      oldImages: oldImages ?? this.oldImages,
      details: details ?? this.details,
      description: descraption ?? this.description,
      category: category ?? this.category,
      isPicUp: isPicUp ?? this.isPicUp,
      isDelivery: isDelivery ?? this.isDelivery,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      errormessage: errormessage ?? this.errormessage,
      items: menuModel ?? this.items,
    );
  }
}
