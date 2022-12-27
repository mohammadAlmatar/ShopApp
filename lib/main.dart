import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/constants.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/states.dart';
import 'package:shopapp/layouts/home_layout/home_layout.dart';
import 'package:shopapp/layouts/onboarding/onbording.dart';
import 'package:shopapp/layouts/shop_login/login.dart';
import 'package:shopapp/layouts/shop_signup/cubit/cubit.dart';
import 'package:shopapp/layouts/start_screen/statr_screen.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/shared/cache_helper.dart';
import 'componants/diohelper.dart';
import 'layouts/searchh/cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(() async {
    await DioHelper.init();
    await CacheHelper.init();
    bool? onBoarding = await CacheHelper.getData(key: 'onBoarding');
    token = await CacheHelper.getData(key: 'token');

    if (onBoarding != null) {
      if (token != null)
        startWidget = HomeLayoutScreen();
      else
        startWidget = Login();
    } else
      startWidget = OnBording();
    runApp(MyApp(
      startWidget: startWidget,
    ));
  });
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ShopCubit()
              ..getHome()
              ..getCategories()
              ..getFavorites()
              ..getProfile()
              ..getCart()),
        BlocProvider(
          create: (context) => SearchhCubit(),
        ),
        BlocProvider(
          create: (context) => ShopSignupCubit(),
        ),
      ],
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themData,
            darkTheme: darktheme,
            themeMode: ShopCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
