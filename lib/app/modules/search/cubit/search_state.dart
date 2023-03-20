part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.statuPage = SearchPageStatus.pure,
    this.lCityModel = const [],
  });

  final SearchPageStatus statuPage;
  final List<CityModel> lCityModel;

  SearchState copyWith({
    SearchPageStatus? statuPage,
    List<CityModel>? lCityModel,
  }) => SearchState(
    statuPage: statuPage ?? this.statuPage,
    lCityModel: lCityModel ?? this.lCityModel,
  );


  @override
  List<Object> get props => [
    statuPage,
    lCityModel
  ];
}

class SearchInitial extends SearchState {}
