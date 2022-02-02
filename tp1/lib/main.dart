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
          margin: marge,
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
    MediaTile(),
    MediaTile(),
    MediaTile(),
    MediaTile(),
  ],
  padding: const EdgeInsets.symmetric(horizontal: 8),
);

class MediaTile extends StatelessWidget{
  const MediaTile({Key? key}) : super(key: key);
  static const String title = "Title";
  static const String info = "info";
  static const String pathImage = "images/Teste.png";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          moreAbout(context);
          },
        child: const ListTile(
            title: Text(title),
            leading: Image(image: AssetImage(pathImage)),
          ),
      ),
    );
  }

  void moreAbout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Plus d'information"),
            ),
            body: Center(
              child: Container(
                child: pageInfo(title, pathImage, info),
                margin: marge,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget pageInfo(String title, String pathImage, String info){
    return Column(
      children: [
        Text(title),
        Image(image: AssetImage(pathImage)),
        Text(info)
      ]
    );
  }
}

const EdgeInsets marge = EdgeInsets.all(32);