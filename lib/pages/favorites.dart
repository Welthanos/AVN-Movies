import 'package:avn_movies/components/favorites_page_placeholder.dart';
import 'package:avn_movies/ui/movie_app_icon_icons.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 0, 160),
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: Color.fromARGB(255, 192, 198, 255),
          ),
        ),

        // Removendo seta de voltar da AppBar
        automaticallyImplyLeading: false,
      ),

      // Corpo da página de favoritos
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 1.0),
            end: Alignment(1.0, -1.0),
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 175, 175, 175),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [

              const SizedBox(height: 50),

              Row(
                children: const [
                  SizedBox(width: 5),
                  Icon(
                    MovieAppIcon.heart,
                    size: 20,
                    color: Color.fromARGB(255, 11, 0, 160),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Favoritados",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 11, 0, 160),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Cards dos filmes favoritados
              SizedBox(
                height: 510,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FavoritesPagePlaceholder(),
                    FavoritesPagePlaceholder(),
                    FavoritesPagePlaceholder(),
                    FavoritesPagePlaceholder(),
                    FavoritesPagePlaceholder(),
                    FavoritesPagePlaceholder(),
                    FavoritesPagePlaceholder(),
                    FavoritesPagePlaceholder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
