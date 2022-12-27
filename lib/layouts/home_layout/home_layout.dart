import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shopapp/componants/colors.dart';

import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/states.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
            bottomNavigationBar: SalomonBottomBar(
              duration: const Duration(microseconds: 200),
              selectedItemColor: colorItem,
              currentIndex: cubit.curentindex,
              onTap: (index) {
                cubit.ChangeNavBar(index, context);
              },
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: colorItem,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.favorite_border),
                  title: Text("Likes"),
                  selectedColor: colorItem,
                ),

                SalomonBottomBarItem(
                  icon: Icon(Icons.local_grocery_store_outlined),
                  title: Text("Cart"),
                  selectedColor: colorItem,
                ),

                /// Search

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: colorItem,
                ),
              ],
            ),
            body: cubit.screen[cubit.curentindex]);
      },
    );
  }
}



/*
*/ 
