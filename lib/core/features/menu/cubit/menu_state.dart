part of 'menu_cubit.dart';

@immutable
class MenuState {
  final RequestStatus status;
  final List<MenuModel> menu;
  final String? errorMessage;

  MenuState({
    this.status = RequestStatus.initial,
    this.menu = const [],
    this.errorMessage,
  });

  MenuState copyWith({
    RequestStatus? status,
    List<MenuModel>? menu,
    String? errorMessage,
  }) {
    return MenuState(
      status: status ?? this.status,
      menu: menu ?? this.menu,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
