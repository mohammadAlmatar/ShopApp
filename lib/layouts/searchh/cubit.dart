import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/diohelper.dart';
import 'package:shopapp/layouts/searchh/state.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/models/searchh_model.dart';

class SearchhCubit extends Cubit<SearchhState> {
  SearchhCubit() : super(SearchInitialState());

  static SearchhCubit get(context) => BlocProvider.of(context);

  late SearchhModel searchhModel;

  void Searchh(String text) {
    emit(SearchhLoadingState());
    DioHelper.postData(
            url: SEARCH,
            data: {
              'text': text,
            },
            token:
                'RCrazbE4ZnggH2by5qRfQZ1QAtnL7tLoPyIrKENMvOjPkFneJ0aL24OsDUxRQgXIgcMIk3')
        .then((value) {
      searchhModel = SearchhModel.fromJson(value.data);

      print('success search');
      print(searchhModel.data!.data![0].name);
      emit(SearchhSuccessState());
    }).catchError((error) {
      print('search error ');
      emit(SearchhErrorState());
    });
  }
}
