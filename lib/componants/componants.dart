import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/cubit/cubit.dart';

import '../layouts/show_item/showItem.dart';
import '../network/models/searchh_model.dart';

dynamic getData({
  required String key,
}) async {
  SharedPreferences? sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.get(key);
}

Future<bool> saveData({
  required String key,
  required dynamic value,
}) async {
  SharedPreferences? sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();

  if (value is String) return await sharedPreferences.setString(key, value);
  if (value is int) return await sharedPreferences.setInt(key, value);
  if (value is bool) return await sharedPreferences.setBool(key, value);
  return await sharedPreferences.setDouble(key, value);
}

void NavigetTo({
  required context,
  required widget,
}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void NavigateAndKill({
  required context,
  required widget,
}) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void toast({
  required String msg,
  required ToastState state,
}) {
  Fluttertoast.showToast(
    msg: msg,
    webPosition: ",lhgljflutl",
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    backgroundColor: choseColorToast(state),
    toastLength: Toast.LENGTH_SHORT,
  );
}

enum ToastState { SUCCESS, ERROR, WRINING }
Color choseColorToast(state) {
  late Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WRINING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget defaultTextFormField({
  required controller,
  required TextInputType keyboard,
  //required String validator,
  Icon? prefixIcon,
  Icon? suffixIcon,
  String? hintText,
  Function onTap()?,
  bool readonly = false,
}) =>
    TextFormField(
      controller: controller,
      readOnly: readonly,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          )),
      //validator: validator,
      keyboardType: keyboard,
      onTap: () {},
    );

Widget ListItem(Product model, context, {isDark = false}) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDark ? Colors.white : Colors.white,
            ),
          ),
          Image(
              height: 150,
              width: 120,
              fit: BoxFit.contain,
              image: NetworkImage(model.image!)),
          Positioned(
            height: 130,
            top: 20,
            left: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.black : Colors.black),
                ),
                const SizedBox(
                  height: 53,
                ),
                Row(
                  children: [
                    Text(
                      '${model.price}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10, color: Colors.blue),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model.oldPrice != null)
                      Text(
                        '${model.oldPrice}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                    const SizedBox(
                      width: 25,
                    ),
                    IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id!);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color:
                              ShopCubit.get(context).favorites[model.id] == true
                                  ? Colors.red
                                  : Colors.grey,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

Widget FavoritesItemUi(context, Product model) => InkWell(
      onTap: () {
        NavigetTo(context: context, widget: ShowItem(model: model));
      },
      child: Container(
        height: 150,
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 255, 255, 254),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Image(
              fit: BoxFit.cover,
              height: 150,
              width: 100,
              image: NetworkImage(model.image!),
            ),

            const SizedBox(
              width: 20,
            ),

            // ignore: sized_box_for_whitespace

            Container(
              width: MediaQuery.of(context).size.width - 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // ignore: prefer_const_literals_to_create_immutables

                children: [
                  // ignore: prefer_const_constructors

                  Text(
                    model.name!,

                    overflow: TextOverflow.ellipsis,

                    maxLines: 2,

                    // ignore: prefer_const_constructors

                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),

                  // ignore: prefer_const_constructors

                  Text(
                    '\$ ${model.price}',

                    overflow: TextOverflow.ellipsis,

                    maxLines: 2,

                    // ignore: prefer_const_constructors

                    style: TextStyle(
                        color: colorItem,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              // ignore: prefer_const_literals_to_create_immutables

              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: mainColor,
                  ),
                ),
                Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    ShopCubit.get(context).changeFavorites(model.id!);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: ShopCubit.get(context).favorites[model.id] == true
                        ? mainColor
                        : Colors.grey,
                    size: 25,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
