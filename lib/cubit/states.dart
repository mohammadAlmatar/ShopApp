abstract class ShopState {}

class ShopInitialState extends ShopState {}

class ShopBottomNavBarState extends ShopState {}

class ShopLoadingState extends ShopState {}

class ShopSuccessState extends ShopState {}

class ShopErrorState extends ShopState {
  final error;

  ShopErrorState(this.error);
}

class ShopCategoriesLoadingState extends ShopState {}

class ShopCategoriesSuccessState extends ShopState {}

class ShopCategoriesErrorState extends ShopState {
  final error;

  ShopCategoriesErrorState(this.error);
}

class ShopFavoritesLoadingState extends ShopState {}

class ShopFavoritesSuccessState extends ShopState {}

class ShopFavoritesErrorState extends ShopState {
  final error;

  ShopFavoritesErrorState(this.error);
}

class ShopChangeFavoritesSuccessState extends ShopState {}

class ShopChangeFavorites extends ShopState {}

class ShopChangeFavoritesErrorState extends ShopState {
  final error;

  ShopChangeFavoritesErrorState(this.error);
}

class ShopChangeMode extends ShopState {}

class ProfileSucsses extends ShopState {}

class ProfileError extends ShopState {
  final Error;

  ProfileError(this.Error);
}

class UpdateProfileLoading extends ShopState {}

class UpdateProfileSucsses extends ShopState {}

class UpdateProfileError extends ShopState {
  final Error;

  UpdateProfileError(this.Error);
}

class ShopCartLoadingState extends ShopState {}

class ShopCartSuccessState extends ShopState {}

class ShopCartErrorState extends ShopState {
  final error;

  ShopCartErrorState(this.error);
}

class ShopChangeCartSuccessState extends ShopState {}

class ShopChangeCart extends ShopState {}

class ShopChangeCartErrorState extends ShopState {
  final error;

  ShopChangeCartErrorState(this.error);
}
