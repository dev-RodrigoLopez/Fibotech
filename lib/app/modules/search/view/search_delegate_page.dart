import 'package:fibotech/app/modules/home/widgets/card_weather_city.dart';
import 'package:fibotech/core/values/const_page_names.dart';
import 'package:fibotech/data/model/city_model.dart';
import 'package:fibotech/data/provider/search/search_rest_provider.dart';
import 'package:flutter/material.dart';


class WeatherSearchDelegate extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.white10,
       textTheme: const TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white10,
      )
    );
  }

  @override
    String get searchFieldLabel => 'Search City ';

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: const Icon( Icons.clear), 
        onPressed: (){
          query = '';
        })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon( Icons.arrow_back ), 
      onPressed: (){
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if ( query.isEmpty ){

      return emptyWeather();
    }

    return weatherCard( context );

  }

  Widget emptyWeather(){
    return const SizedBox(
      child: Center(
        child: Icon( Icons.cloud_off_outlined , color: Colors.black38, size: 200, ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if( query.isEmpty ){
      return emptyWeather();
    }

    return weatherCard( context );
    
  }

  Widget weatherCard( BuildContext context ){

    return FutureBuilder(
      // future: pokemonProvider.searchPokemon( query.toLowerCase() ),
      future : SearchRestProvider().getLatLogByCity(city: query.toLowerCase()),
      builder: ( _, AsyncSnapshot snapshot){

        if( !snapshot.hasData ) return  emptyWeather();
        
        List<CityModel> lCitys = [];

        snapshot.data!.fold(
          (error){},
          ( lCityModel){
            lCitys = lCityModel;
          }
        );


        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6 ,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: lCitys.length,
              itemBuilder: ((context, index) {
                
                return Padding(
                  padding: const EdgeInsets.symmetric( vertical: 10 ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.12 ,
                    decoration: BoxDecoration(
                      // color: Colors.black87,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: GestureDetector(
                      onTap: () async{
                        await Navigator.pushNamed(
                          context,
                          PageNames.detail,
                          arguments: lCitys[index].weatherModelRest
                        );
                        
                      },
                      child: CardWeatherCity( weatherModel: lCitys[index].weatherModelRest! )
                    ),
                  ),
                );

              })
            ),
          ),
        );

      },
    );
  }

  
}


