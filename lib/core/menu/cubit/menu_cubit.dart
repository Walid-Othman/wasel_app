import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/menu/model/menu_model.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState());
  void fetchMenu() async {
     emit(state.copyWith(status: RequestStatus.loading));
    await Future.delayed(Duration(seconds: 5));
    try {
      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          menu: [
            MenuModel(
              id: 1,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: "Breakfast",
              reviewCount: 20,
              rating: 4,
            ),
            MenuModel(
              id: 2,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
            ),
            MenuModel(
              id: 3,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
            ),
            MenuModel(
              id: 4,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
            ),
            MenuModel(
              id: 5,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
            ),
            MenuModel(
              id: 6,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
            ),
            MenuModel(
              id: 7,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
            ),
            MenuModel(
              id: 8,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
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
