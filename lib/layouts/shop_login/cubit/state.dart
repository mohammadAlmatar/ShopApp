import 'package:shopapp/network/models/Shop_loging_model.dart';

abstract class ShopLoginState{}
class ShopLoginInisialState extends ShopLoginState{}

class ShopLoginLoadingState extends ShopLoginState{}

class ShopLoginSucssesState extends ShopLoginState{
  final loginmodel;

  ShopLoginSucssesState(this.loginmodel);
}

class ShopLoginErrorState extends ShopLoginState{
  final ShopLoginModel error;

  ShopLoginErrorState(this.error);
}

