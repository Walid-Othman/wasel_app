import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasel_app/core/config/request_status.dart';
import 'package:wasel_app/core/features/menu/model/ingredient_model.dart';
import 'package:wasel_app/core/features/menu/model/menu_model.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState());
  


  void fetchMenu() async {

    emit(state.copyWith(status: RequestStatus.loading));
    await Future.delayed(Duration(seconds: 1));
    if (isClosed) return;
    try {
      emit(
        state.copyWith(
          status: RequestStatus.loaded,
          menu: [
            MenuModel(
              id: 1,
              title: "Chicken Thai Biriyani",
              images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop",'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS8aIYezp0UCA5bvT7a0YowIprBxGr75UItM5sIDsX1clTURSNf_mx1fLs7lBV_'],
              price: 50,
              category: "Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
             
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
              images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop"],
              price: 30,
              category: " Dinner",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              
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
              images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop"],
              price: 40,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              
              ingredients: [],
            ),
            MenuModel(
              id: 4,
              title: "Pizza",
              images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop"],
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              
              ingredients: [],
            ),
            MenuModel(
              id: 5,
              title: "Pizza",
              images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop"],
              price: 50,
              category: " Breakfast",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
             
              ingredients: [],
            ),
            MenuModel(
              id: 6,
              title: "Pizza",
              images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop"],
              price: 50,
              category: " Dinner",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              
              ingredients: [],
            ),
            MenuModel(
              id: 7,
              title: "Pizza",
              images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop"],
              price: 50,
              category: " Dinner",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              
              ingredients: [],
            ),
            MenuModel(
              id: 8,
              title: "Pizza",
             images:[ "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000&auto=format&fit=crop"],
              price: 50,
              category: " Lunch",
              reviewCount: 20,
              rating: 4,
              descraption:
                  'Lorem ipsum dolor sit amet, consetdur Maton adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
              
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
