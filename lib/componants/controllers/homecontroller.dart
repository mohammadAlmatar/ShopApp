import 'package:flutter/cupertino.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  dynamic homestate = HomeState.normal;

  void ChangeHomeState(HomeState state) {
    homestate = state;
    notifyListeners();
  }
}
