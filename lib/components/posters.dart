import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Posters extends StatefulWidget {
  final String? id;
  const Posters({Key? key, this.id}) : super(key: key);

  @override
  _PostersState createState() => _PostersState();
}

class _PostersState extends State<Posters> {
  List<dynamic> posterList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }
  // Requisição das strings de endereço para os posters do filme
  Future getData() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/${widget.id}?api_key=acd2834a5e053a947ed184cacbfba58b&language=pt-br&append_to_response=images,credits&include_image_language=en,pt-br");
    var response = await http.get(url);
    List<dynamic> list = jsonDecode(response.body)["images"]["posters"];
    setState(() {
      posterList = [...list];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 450,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posterList.length,
        itemBuilder: (context, index) {
          if (posterList.isEmpty) {
            return const Text("lista vazia");
          } else {
            final poster = posterList[index];
            return Padding(
              padding: const EdgeInsets.only(right: 2),

              // Concatenando a requisição com a URL padrão de imagens para acessar os posters
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${poster["file_path"]}',
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}
