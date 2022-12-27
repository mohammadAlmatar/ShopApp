import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/layouts/shop_login/cubit/state.dart';
import 'package:shopapp/network/models/Shop_loging_model.dart';
import 'package:shopapp/network/end_points.dart';

import '../../../componants/componants.dart';
import '../../../componants/diohelper.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInisialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  var loginmodel;
  var signupmodel;

  void userLogin({
    required String email,
    required String password,
  }) {
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      emit(ShopLoginLoadingState());
      loginmodel = ShopLoginModel.fromjson(value.data);
      emit(ShopLoginSucssesState(loginmodel));
      print(loginmodel.message);
    }).catchError((error) {
      emit(ShopLoginErrorState(error));
      print(error.toString());
      toast(
        msg: error.toString(),
        state: ToastState.ERROR,
      );
    });
  }
}
