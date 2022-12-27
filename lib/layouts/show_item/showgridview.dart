import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/componants/constants.dart';
import 'package:shopapp/componants/controllers/homecontroller.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/network/models/home_mofel.dart';
import 'package:readmore/readmore.dart';

import '../../cubit/states.dart';

class ShowGridView extends StatelessWidget {
  final HomeProducts model;
  ShowGridView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            model.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 3.5),
                  Positioned(
                    top: 10,
                    left: MediaQuery.of(context).size.width - 50,
                    child: IconButton(
                      onPressed: () {
                        ShopCubit.get(context).changeFavorites(model.id);
                      },
                      icon: Icon(
                        Icons.favorite_sharp,
                        color:
                            ShopCubit.get(context).favorites[model.id] == true
                                ? Colors.red
                                : Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: colorHome,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Text(
                              '${model.name}',
                              maxLines: 7,
                              style: const TextStyle(
                                overflow: TextOverflow.clip,
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('\$${model.price}',
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: colorItem,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              ' ABOUT IT...',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ReadMoreText(
                              '${model.description}',
                              trimLines: 4,
                              colorClickableText: priceColor,
                              trimMode: TrimMode.Line,
                              style: const TextStyle(color: Colors.grey),
                              trimCollapsedText: 'Show more',
                              lessStyle: TextStyle(color: colorItem),
                              trimExpandedText: 'Show less',
                              moreStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  height: 2,
                                  color: colorItem),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: double.infinity,
                              height: 75,

                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 2, color: colorItem),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              ShopCubit.get(context)
                                                  .changeCart(model.id);
                                            },
                                            icon: Icon(
                                              Icons.local_grocery_store_sharp,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 75,
                                      width: MediaQuery.of(context).size.width -
                                          130,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Buy now...',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'Good Fonts'),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Colors.white,
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Colors.white60,
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color: Colors.white24,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: colorItem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
//                           ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
