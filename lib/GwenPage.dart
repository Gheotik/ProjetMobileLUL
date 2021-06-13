import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GwenPage extends StatefulWidget {

  @override
  _GwenPageState createState() => _GwenPageState();
}

class _GwenPageState extends State<GwenPage> {
  int _counter = 10;
  String _phrase = "Clics avant explosion :";
  bool _likeBool = false;
  Icon _coeur = Icon(Icons.favorite_border, color: Colors.white);
  Color _liked_color = Colors.green;
  Icon _location = Icon(Icons.add_location);
  Icon _forward = Icon(Icons.forward);
  Icon _power = Icon(Icons.settings_power);
  Icon _pets = Icon(Icons.pets);
  Icon _visibility = Icon(Icons.visibility);

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Pop up lancé'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Vous avez activé le pop up correctement"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter > 1) {
        _counter--;
      } else if (_counter == 1) {
        _phrase = "BOOM";
        _counter = 0;
      }
    });
  }

  void _reload() {
    setState(() {
      _phrase = "Restart....";
      sleep(Duration(seconds:1));
      _phrase = "Clics avant explosion :";
      _counter = 10;
    });
  }

  void _liked() {
    setState(() {
      if (_likeBool) {
        _likeBool = false;
        _coeur = Icon(Icons.favorite, color: Colors.white);
        _liked_color = Colors.red;
      } else {
        _likeBool = true;
        _coeur = Icon(Icons.favorite_border, color: Colors.white);
        _liked_color = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                child: Text("menu")),
            IconButton(onPressed: null, icon: _power),
            IconButton(onPressed: null, icon: _pets),
            IconButton(onPressed: null, icon: _visibility)
          ],
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("GwenPage"),
        actions: <Widget> [
          IconButton(onPressed: _liked, icon: _coeur)
        ],
        backgroundColor: _liked_color,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Entrez un texte',
                )
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildPopupDialog(context),
                  );
                },
                child: const Text('OK'))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: _liked_color,
        shape: CircularNotchedRectangle() ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(onPressed: null,
              icon: _location,
            ),
            IconButton(onPressed: null, icon: _forward)
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _liked,
        tooltip: 'Full of Love',
        child: _coeur,
        backgroundColor: _liked_color,
      ), floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }
}
