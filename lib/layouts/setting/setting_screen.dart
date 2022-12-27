
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/states.dart';

class Setting extends StatelessWidget {
  const Setting ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        return  Center(
                   child: IconButton(
                        onPressed: ()
                         {
                              ShopCubit.get(context).ChangeMode();
                          },
                        icon: Icon(ShopCubit.get(context).isDark?Icons.sunny : Icons.mode_night_outlined)),
        );
      },
    );
  }}