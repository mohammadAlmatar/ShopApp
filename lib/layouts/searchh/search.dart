import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/layouts/searchh/cubit.dart';
import 'package:shopapp/layouts/searchh/state.dart';

import '../../componants/componants.dart';

class SearchQ extends StatelessWidget {
  const SearchQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<SearchhCubit, SearchhState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
              body: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      cursorColor: colorItem,
                      toolbarOptions: ToolbarOptions(
                        copy: true,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'add to search',
                        prefixIcon: Icon(Icons.search_sharp),
                      ),
                      //controller: searchController,
                      onFieldSubmitted: (String value) {
                        SearchhCubit.get(context).Searchh(value);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (state is SearchhLoadingState)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: const LinearProgressIndicator(),
                  ),
                if (state is SearchhSuccessState)
                  ConditionalBuilder(
                      condition: SearchhCubit.get(context)
                          .searchhModel
                          .data!
                          .data!
                          .isNotEmpty,
                      builder: (context) => Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) =>
                                    FavoritesItemUi(
                                      context,
                                      SearchhCubit.get(context)
                                          .searchhModel
                                          .data!
                                          .data![index],
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                                itemCount: SearchhCubit.get(context)
                                    .searchhModel
                                    .data!
                                    .data!
                                    .length),
                          ),
                      fallback: (context) => const Center(
                            child: Icon(Icons.hourglass_empty_outlined),
                          ))
              ]));
        });
  }
}
