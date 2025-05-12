import 'package:flutter/material.dart';
import 'package:movie_app/Pages/movie_details.dart';

import 'package:movie_app/providers/movieProvider.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(ChangeNotifierProvider(create : (context)=> Movieprovider(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Movie(),
    );
  }
}

class Movie extends StatefulWidget {
  
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  void initState() {
    Provider.of<Movieprovider>(context,listen:false).loadMovies(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<Movieprovider>(context).movielist;
    return Scaffold(
      appBar: AppBar(
       title: const Text('Movie'),
      ),
      body: ListView.builder(itemCount: movies.length, itemBuilder:(context,index){
        // final movie = movies[index];
        return Card(
          child: ExpansionTile(
            title: Text(movies[index].title),
            subtitle: Text(movies[index].genre),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(movies[index].images[0]),
            ),
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left:60),
                child: Column(
                  children: [
                    RichText(text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text:"The Movie Release Year is: ",
                          style: TextStyle(
                           
                            fontSize: 10,
                            fontFamily:'Roboto',
                          )
                          ),
                          TextSpan(
                            text: movies[index].releaseYear,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            )
                          )
                         
                      ] 
                  



                      
                    )),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetails()));
                    }, child: Text("Read More"),)
                   
                  ],

                ),
              )
            ],
           
          )
        );
      }
      )

      );
  }
}