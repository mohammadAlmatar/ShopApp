import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/diohelper.dart';
import 'package:shopapp/cubit/states.dart';
import 'package:shopapp/layouts/cart/cart.dart';
import 'package:shopapp/layouts/categories/categories_screen.dart';
import 'package:shopapp/layouts/favorites/favorites_screen.dart';

import 'package:shopapp/layouts/home_layout/new_home.dart';

import 'package:shopapp/layouts/profile/profile.dart';
import 'package:shopapp/network/models/cartMaodel.dart';
import 'package:shopapp/network/models/changeCartModle%20.dart';
import 'package:shopapp/network/models/changeFavoritesModle.dart';
import 'package:shopapp/network/models/favorites_model.dart';
import 'package:shopapp/network/models/home_mofel.dart';
import 'package:shopapp/componants/componants.dart';
import 'package:shopapp/layouts/productes/productes_screen.dart';
import 'package:shopapp/layouts/setting/setting_screen.dart';
import 'package:shopapp/network/models/categories_model.dart';
import 'package:shopapp/network/models/profile.dart';

import '../network/end_points.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  bool readonly = true;
  List<Widget> item = const [
    Icon(
      Icons.home,
    ),
    Icon(
      Icons.category,
    ),
    Icon(
      Icons.polymer_rounded,
    ),
    Icon(
      Icons.favorite,
    ),
    Icon(
      Icons.settings,
    ),
  ];
  List<Widget> screen = [
    NewHome(),
    Favorites(),
    CartScreen(),
    ProfilePage(),
  ];
  var curentindex = 0;
  HomeModel? homeModel;
  Categories_model? catModel;
  late FavoritesModel favoritesModel;
  late Cart cartModel;
  Map<int, bool> favorites = {};
  Map<int, bool> cartList = {};
  var activeIndex = 0;
  void ChangeNavBar(index, context) {
    curentindex = index;
    emit(ShopBottomNavBarState());
  }

  void getHome() async {
    emit(ShopLoadingState());
    await DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromjson(value.data);
      print(homeModel?.data.products[0].image);
      homeModel?.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });

      emit(ShopSuccessState());
    }).catchError((error) {
      emit(ShopErrorState(error));

      print(error.toString());
    });
  }

  void getCategories() async {
    emit(ShopLoadingState());
    await DioHelper.getData(
      url: CATEGORIES,
    ).then((value) {
      catModel = Categories_model.fromJson(value.data);

      emit(ShopCategoriesSuccessState());
    }).catchError((error) {
      emit(ShopCategoriesErrorState(error));

      print(error.toString());
    });
  }

  void getFavorites() async {
    emit(ShopFavoritesLoadingState());
    await DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(ShopFavoritesSuccessState());
    }).catchError((error) {
      emit(ShopFavoritesErrorState(error));

      print(error.toString());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId) {
    favorites[productId] = !(favorites[productId] ?? null)!;
    emit(ShopChangeFavorites());
    DioHelper.postData(
      url: FAVORITES,
      token: token,
      data: {'product_id': productId},
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if (changeFavoritesModel?.status == false) {
        favorites[productId] = !(favorites[productId] ?? null)!;
        toast(state: ToastState.ERROR, msg: '${changeFavoritesModel?.message}');
      } else {
        getFavorites();
      }
      emit(ShopChangeFavoritesSuccessState());
    }).catchError((error) {
      favorites[productId] = !(favorites[productId] ?? null)!;

      emit(ShopChangeFavoritesErrorState(error));
    });
  }

  ChangeCartModel? changeCartModel;

  void changeCart(int productId, {bool incarted = true}) {
    cartList[productId] = incarted;

    emit(ShopChangeCart());

    DioHelper.postData(
      url: CART,
      token: token,
      data: {'product_id': productId},
    ).then((value) {
      changeCartModel = ChangeCartModel.fromJson(value.data);
      print(value.data);
      if (changeCartModel?.status == false) {
        cartList[productId] = !(cartList[productId] ?? null)!;
        toast(state: ToastState.ERROR, msg: '${changeCartModel?.message}');
      } else {
        getCart();
      }
      emit(ShopChangeCartSuccessState());
    }).catchError((error) {
      cartList[productId] = !(cartList[productId] ?? null)!;
      emit(ShopChangeCartErrorState(error));
    });
  }

  void getCart() async {
    emit(ShopCartLoadingState());
    await DioHelper.getData(
      url: CART,
      token: token,
    ).then((value) {
      cartModel = Cart.fromJson(value.data);
      print(cartModel.data!.cartItems![0].product!.name);
      print('object');
      emit(ShopCartSuccessState());
    }).catchError((error) {
      emit(ShopCartErrorState(error));

      print(error.toString());
    });
  }

  bool isDark = false;
  ChangeMode() {
    isDark = !isDark;
    emit(ShopChangeMode());
  }

  late Profile profile;
  void getProfile() async {
    await DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      profile = Profile.fromJson(value.data);

      emit(ProfileSucsses());
    }).catchError((error) {
      emit(ProfileError(error));

      print(error.toString());
    });
  }

  void updateProfile({
    required String name,
    required String email,
    required String phone,
    required String points,
  }) async {
    emit(UpdateProfileLoading());
    await DioHelper.putData(
      url: UPDATEPROFILE,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'points': points,
      },
      token: token,
    ).then((value) {
      emit(UpdateProfileSucsses());
      toast(msg: '${profile.message}', state: ToastState.SUCCESS);
      profile = Profile.fromJson(value.data);
    }).catchError((onError) {
      emit(UpdateProfileError(onError));
      print(onError.toString());
    });
  }
}
