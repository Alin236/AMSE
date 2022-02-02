import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de média',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedPage = 0;
  final List<Widget> _pageOptions = <Widget>[
    mediaPage,
    const Text(
      'Text3',
    ),
    const Text(
      'Text4',
    ),
    Text(
      'Text5',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text1'),
      ),
      body: Center(
        child: Container(
          child: _pageOptions.elementAt(_selectedPage),
          margin: EdgeInsets.all(32),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Média',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
            backgroundColor: Colors.grey,
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

final mediaPage = ListView(
  children: const <Widget> [
    MediaTile(),
    MediaTile(),
    MediaTile(),
    MediaTile(),
    MediaTile(),
    MediaTile(),
  ],
  padding: const EdgeInsets.symmetric(horizontal: 8),
);

class MediaTile extends StatelessWidget{
  const MediaTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
          },
        child: const ListTile(
            title: Text('Texta'),
            leading: Icon(Icons.hourglass_empty),
          ),
      ),
    );
  }
}