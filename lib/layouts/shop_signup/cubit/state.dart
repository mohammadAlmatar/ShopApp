import 'package:shopapp/network/models/Shop_loging_model.dart';

abstract class ShopSignupState{}


class ShopSignupInitialState extends ShopSignupState{}

class ShopSignupLoadingState extends ShopSignupState{}

class ShopSignupSuccessState extends ShopSignupState{
  final signupmodel;

  ShopSignupSuccessState( this.signupmodel);
}

class ShopSignupErrorState extends ShopSignupState{
  final error;

  ShopSignupErrorState(this.error);
}