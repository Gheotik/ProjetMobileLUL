import 'package:flutter/material.dart';
import 'package:untitled/Home.dart';
import 'package:untitled/dataapi.dart';
import '';
import 'GwenPage.dart';
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

  int _selectedItem = 0;


  List<Widget> _widgetOptions = <Widget>[
    Home(),
    handicap(),
    GwenPage(),
  ];

  void _onChoseAppBar(int index){
    setState(() {
      _selectedItem = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APPLI SUPER TROP BIEN (venez jdr)"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedItem),
      ),
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

