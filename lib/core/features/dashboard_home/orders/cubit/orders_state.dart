// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_cubit.dart';

@immutable
class OrdersState {
  final List<OrderModel> orders;
  final RequestStatus status;
  final String? errorMessage;
  OrdersState({
    this.errorMessage,
    this.orders = const [],
    this.status = RequestStatus.initial,
  });

  OrdersState copyWith({
    List<OrderModel>? orders,
    RequestStatus? status,
    String? errorMessage,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
