
import 'package:flutter/material.dart';
import 'package:movie_app/models/MovieModel.dart';
import 'package:movie_app/utils/movieparser.dart';

class Movieprovider with ChangeNotifier {
List<Moviemodel> _movieList= [];

  // Method to load movies from JSON file
Future<void> loadMovies(BuildContext context) async{
  try{
    final jsonString = await DefaultAssetBundle.of(context).loadString('assests/data/films.json');
final movies = Movieparser.parse(jsonString);
 _movieList = movies;
 notifyListeners();
  }
  catch(e)
  {
     print("Error Loading movies: $e");
  }
}


List<Moviemodel> get movielist => _movieList;

// List<String> loadMovies(){
//   return _movieList;
// }


}