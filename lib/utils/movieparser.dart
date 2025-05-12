import 'dart:convert';


import 'package:movie_app/models/MovieModel.dart'; // Ensure this is the correct path to the Moviemodel class

class Movieparser {

static List<Moviemodel>parse(String jsonString){
  final List<dynamic> parsed = json.decode(jsonString);
  // print(parsed);
  return parsed.map((json) => Moviemodel.fromJson(json)).toList();
}


}