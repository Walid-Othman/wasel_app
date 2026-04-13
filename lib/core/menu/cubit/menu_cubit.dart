import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/menu/model/ingredient_model.dart';
import 'package:wasel_app/core/menu/model/menu_model.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState());
  void fetchMenu() async {
    emit(state.copyWith(status: RequestStatus.loading));
    await Future.delayed(Duration(seconds: 1));
    try {
      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          menu: [
            MenuModel(
              id: 1,
              title: "Chicken Thai Biriyani",
              urlImage: "",
              price: 50,
              category: "Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
              ],
            ),
            MenuModel(
              id: 2,
              title: "Chicken Bhuna",
              urlImage: "",
              price: 30,
              category: " Dinner",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
                IngredientModel(name: 'Salt', itemImage: ""),
              ],
            ),
            MenuModel(
              id: 3,
              title: "Mazalichiken Halim",
              urlImage: "",
              price: 40,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [],
            ),
            MenuModel(
              id: 4,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [],
            ),
            MenuModel(
              id: 5,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [],
            ),
            MenuModel(
              id: 6,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Dinner",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [],
            ),
            MenuModel(
              id: 7,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Dinner",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [],
            ),
            MenuModel(
              id: 8,
              title: "Pizza",
              urlImage: "",
              price: 50,
              category: " Lunch",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              foodImages: ["", "", ""],
              ingredients: [],
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
