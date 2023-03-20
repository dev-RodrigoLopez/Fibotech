import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fibotech/data/enums.dart';
import 'package:fibotech/data/model/city_model.dart';
import 'package:fibotech/data/provider/search/search_rest_provider.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  void changeStatus(){
    emit(
      state.copyWith(
        statuPage: SearchPageStatus.loading,
      ),
    );
  }

  Future<void> searchCity( String city ) async{
    changeStatus();
    final response = await SearchRestProvider().getLatLogByCity( city: city );

    await response.fold(
      (error){
        emit(
          state.copyWith(
            statuPage: SearchPageStatus.notSuccess,
          ),
        );
      }, 
      (weather) async {

        if( weather.isNotEmpty ){
          emit(
            state.copyWith(
              lCityModel: weather,
              statuPage: SearchPageStatus.success,
            ),
          );
        } else { 
          emit(
            state.copyWith(
              statuPage: SearchPageStatus.empty,
            ),
          );
        }

      }
    );

  }

}
