// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'item_cubit.dart';

@immutable
class ItemState {
  final RequestStatus status;
  final List<File> imageList;
  final String details;
  final String descraption;
  final String category;
  final bool isPicUp;
  final bool isDelivery;
  final String itemName;
  final double itemPrice;
  final String? errormessage;
  ItemState({
    this.status = RequestStatus.initial,
    this.imageList = const [],
    this.details = '',
    this.descraption = '',
    this.category = "",
    this.isPicUp = true,
    this.isDelivery = false,
    this.itemName = "",
    this.itemPrice = 0,
    this.errormessage,
  });

  ItemState copyWith({
    RequestStatus? status,
    List<File>? imageList,
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
      details: details ?? this.details,
      descraption: descraption ?? this.descraption,
      category: category ?? this.category,
      isPicUp: isPicUp ?? this.isPicUp,
      isDelivery: isDelivery ?? this.isDelivery,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      errormessage: errormessage ?? this.errormessage,
    );
  }
}
