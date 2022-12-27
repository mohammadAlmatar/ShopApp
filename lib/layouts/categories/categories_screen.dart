import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/states.dart';
import 'package:shopapp/network/models/categories_model.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = ShopCubit.get(context);
        // Categories_model categories_model = cubit.catModel;
        return Scaffold(
          body: ConditionalBuilder(
            condition: ShopCubit.get(context).catModel != null,
            builder: (context) => ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => CategoryItem(
                    ShopCubit.get(context).catModel!.data.data[index], context),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: ShopCubit.get(context).catModel!.data.data.length),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

Widget CategoryItem(Data model, context) => Row(
      children: [
        Image(
          height: 150,
          width: 120,
          image: NetworkImage('${model.image}'),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            '${model.name}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios_rounded)),
      ],
    );
