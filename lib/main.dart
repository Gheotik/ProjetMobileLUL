import 'package:flutter/material.dart';
import 'package:untitled/dataapi.dart';
import '';
import 'handicape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pokemon> pokemonList = <Pokemon>[];

  int _selectedItem = 0;

  void remplirPokemonList() async{
    pokemonList = await fetchPokemon();
    setState(() {

    });

  }

  List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    handicap(),
  ];

  void _onChoseAppBar(int index){
    setState(() {
      _selectedItem = index;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("APPLI SUPER TROP BIEN (venez jdr)"),
        backgroundColor: Colors.cyan,
      ),
      body: GridView.builder(
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wheelchair_pickup),
            label: "handicapé",
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.female),
            label: "Femèle",
            backgroundColor: Colors.orange,
          )
        ],
        currentIndex: _selectedItem,
        onTap: _onChoseAppBar,
      ),
    );
  }
}

