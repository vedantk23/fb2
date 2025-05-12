

class Moviemodel {

final String title;
final String genre;
final String director;
final String actors;
final String releaseYear;
final String runtime;
final String rated;
final String writer;
final String boxOffice;
final String budget;
final List<String>images;

Moviemodel({
  required this.title,
  required this.genre,
  required this.director,
  required this.actors,
  required this.releaseYear,
  required this.runtime,
  required this.rated,
  required this.writer,
  required this.boxOffice,
  required this.budget,
  required this.images
});


factory Moviemodel.fromJson(Map<String,dynamic>json){
return Moviemodel(
title: json['Title'] as String ,
genre: json['Genre'] as String,
director: json['Director'] as String,
actors: json['Actors'] as String,
releaseYear: json['ReleaseYear'] as String,
runtime: json['Runtime'] as String, 
rated: json['Rated'] as String,
writer: json['Writer'] as String,
boxOffice: json['BoxOffice'] as String,
 budget: json['Budget'] as String,
 images: List<String>.from(json['Images']),
);



}




}








