import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Pokemon {
  final String nom;
  final String url;


  Pokemon({
    required this.nom,
    required this.url,
  });


  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      nom : json['name'],
      url : json['url'],
    );
  }


}

Future<List<Pokemon>> fetchPokemon() async {
  List<Pokemon> mappedCity = [];
  final response =
  await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=100%27'));

  if (response.statusCode == 200) {
    var jsonList = jsonDecode(response.body);
    var finalJson = jsonList["results"];
    for (var result in finalJson) {
      mappedCity.add(Pokemon.fromJson(result));
    }
    return mappedCity;
  } else {
    throw Exception('Failed to load pokemon API');
  }

}
