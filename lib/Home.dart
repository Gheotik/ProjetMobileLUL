import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dataapi.dart';

class Home extends StatefulWidget{


  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>{

  List<Pokemon> pokemonList = <Pokemon>[];


  void remplirPokemonList() async{
    pokemonList = await fetchPokemon();
    setState(() {

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    remplirPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final item = pokemonList[index];
                return Dismissible(
                  key: Key(item.nom),
                  background: Container(
                    child: Icon(
                      Icons.delete,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.cyan,
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      pokemonList.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Pokemon ${item.nom} supprimé !')));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        '${item.nom}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontSize: 20),
                      ),
                      subtitle: Image.network(
                          "https://img.pokemondb.net/artwork/"+item.nom+".jpg"
                      ),

                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.cyan,
                                title: Text(
                                  'Nom du pokemon : ${item.nom}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                //content: item.nom,
                              );
                            });
                      },
                    ),
                  ),
                );
              }),

        )
      ],

    );
  }

}