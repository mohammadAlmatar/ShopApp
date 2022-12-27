// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/componants/componanszz.dart';
import 'package:shopapp/componants/constants.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/states.dart';
import 'package:shopapp/layouts/cart/cart.dart';
import 'package:shopapp/layouts/searchh/search.dart';
import 'package:shopapp/layouts/show_item/showgridview.dart';
import 'package:shopapp/network/models/cartMaodel.dart';
import 'package:shopapp/network/models/home_mofel.dart';

import '../../network/models/categories_model.dart';

class NewHome extends StatelessWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null &&
              ShopCubit.get(context).catModel != null,
          builder: (context) => Scaffold(
            backgroundColor: colorHome,
            body: ProductItems(
              context,
              ShopCubit.get(context).homeModel!,
              ShopCubit.get(context).catModel!,
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: colorItem,
            ),
          ),
        );
      },
    );
  }

  Widget ProductItems(
          context, HomeModel homeModel, Categories_model categories_model) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5.5,
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${ShopCubit.get(context).profile.data!.image}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi  ${ShopCubit.get(context).profile.data!.name}',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                        fontFamily: 'Food Fonts',
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Let\'s get some product !!',
                      style: TextStyle(
                        color: Color(0xff304250),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Good Fonts',
                      ),
                    ),
                  ],
                ),
                // ignore: prefer_const_constructors
                Spacer(),
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, CartScreen());
                      },
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        size: 30,
                        color: Color(0xff304250),
                      ),
                    ),
                    if (ShopCubit.get(context)
                        .cartModel
                        .data!
                        .cartItems!
                        .isNotEmpty)
                      Positioned(
                        right: 7,
                        top: 4,
                        child: CircleAvatar(
                          backgroundColor: colorItem,
                          radius: 8,
                          child: Text(
                            '${ShopCubit.get(context).cartModel.data!.cartItems!.length}',
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchQ(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search Item!!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => CategoriesItems(
                    context,
                    categories_model.data.data[index],
                    index == 0 ? true : false),
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
                itemCount: categories_model.data.data.length,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Popular Product...',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Good',
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 220,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => ProductItemList(
                  context,
                  homeModel.data.products[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 18,
                ),
                itemCount: homeModel.data.products.length,
              ),
            ),
          ),
        ],
      );
  Widget CategoriesItems(context, Data model, isclick) => Container(
        height: 100,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isclick ? colorItem : Colors.white,
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image: DecorationImage(
                    image: NetworkImage(model.image!),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                model.name!,
                style: TextStyle(
                  color: isclick ? Colors.white : colorItem,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      );
  Widget ProductItemList(
    context,
    HomeProducts homeModel,
  ) =>
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: panelTransition,
              reverseTransitionDuration: panelTransition,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FadeTransition(
                opacity: animation,
                child: ShowGridView(model: homeModel),
              ),
            ),
          );
        },
        child: Container(
          height: 220,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          homeModel.image,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      ShopCubit.get(context).changeFavorites(homeModel.id);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color:
                          ShopCubit.get(context).favorites[homeModel.id] == true
                              ? Colors.red
                              : Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  homeModel.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colorItemSecond,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '\$ ${homeModel.price}',
                    style: TextStyle(
                      color: colorItem,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        ShopCubit.get(context).changeCart(homeModel.id);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorItem,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
