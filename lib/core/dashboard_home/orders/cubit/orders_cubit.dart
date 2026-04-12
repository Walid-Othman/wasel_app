import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/dashboard_home/orders/order_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersState());
  Future<void> fetchOrders() async {
    emit(state.copyWith(status: RequestStatus.loading));
   await Future.delayed(Duration(seconds: 3));
    try {
      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          orders: [
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
            OrderModel(
              id: '1234545',
              title: "Chicken Thai Biriyani",
              type: "Breakfast",
              urlImage: '',
              price: 20,
            ),
          ],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: RequestStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
