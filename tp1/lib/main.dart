import 'package:flutter/material.dart';

const EdgeInsets marge = EdgeInsets.all(16);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Gestion de média',
        home: DefaultTabController(
          length: 4,
          child: NavBar(),
        ));
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
    homePage, //La page d'accueil
    mediaPage, //La page de gestion des médias
    favorisPage, //La page de favoris
    aboutPage, //La page d'information
  ];

  //Permet de clicker sur la NavBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGM'),
        //Définition du TabBar pour filtrer les médias
        bottom: [1, 2].contains(_selectedPage)
            ? const TabBar(tabs: [
                Tab(text: 'Tous'),
                Tab(text: 'Jeux'),
                Tab(text: 'Films'),
                Tab(text: 'Réseaux'),
              ])
            : null,
      ),
      body: Center(
        child: Container(
          //Selon l'item sélectionner dans la NavigationBar, on affiche la bonne page
          child: _pageOptions.elementAt(_selectedPage),
          margin: marge,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
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
            label: 'Information',
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

//=================Pour la page d'accueil=========================

//La page d'accueil
final homePage = Card(
  child: Container(
    alignment: Alignment.center,
    child: Column(
      children: const [
        Text("AGM", textScaleFactor: 4),
        Text("L'application de gestion de média")
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ),
  ),
);

//===============Pour la page média========================

//----data :-----

const undertale = MediaTile(
  title: "Undertale",
  info:
      "UNDERTALE! Le jeux RPG où vous n'avez pas besoin de tuer qui que ce soit.",
  pathImage: "images/undertale.jpeg",
);

const oriAndTheBlindForest = MediaTile(
  title: "Ori and the Blind Forest",
  info:
      '"Ori and the Blind Forest" relate l\'histoire d\'une jeune créature orpheline à la destinée héroïque, au travers d\'un jeu de plateforme et d\'action aux graphismes époustouflants, développé pour PC par Moon Studios.',
  pathImage: "images/ori_and_the_blind_forest.jpg",
);

const hollowKnight = MediaTile(
  title: "Hollow Knight",
  info:
      "Choisissez votre destin dans Hollow Knight ! Une aventure épique et pleine d’action, qui vous plongera dans un vaste royaume en ruine peuplé d’insectes et de héros. Dans un monde en 2D classique, dessiné à la main.",
  pathImage: "images/hollow_knight.jpg",
);

const avengersEndgame = MediaTile(
  title: "Avengers Endgame",
  info:
      "Thanos ayant anéanti la moitié de l'univers, les Avengers restants resserrent les rangs dans ce vingt-deuxième film des Studios Marvel, grande conclusion d'un des chapitres de l'Univers Cinématographique Marvel.",
  pathImage: "images/avengers_endgame.jpg",
);

const spiderManNoWayHome = MediaTile(
  title: "Spider-Man No Way Home",
  info:
      "Pour la première fois dans son histoire cinématographique, Spider-Man, le héros sympa du quartier est démasqué et ne peut désormais plus séparer sa vie normale de ses lourdes responsabilités de super-héros. Quand il demande de l'aide à Doctor Strange, les enjeux deviennent encore plus dangereux, le forçant à découvrir ce qu'être Spider-Man signifie véritablement.",
  pathImage: "images/spider-man_no_way_home.jpg",
);

const facebook = MediaTile(
  title: "Facebook",
  info:
      "Facebook est un réseau social en ligne appartenant à Meta. Il permet à ses utilisateurs de publier des images, des photos, des vidéos, des fichiers et documents, d'échanger des messages, joindre et créer des groupes et d'utiliser une variété d'applications sur une variété d'appareils.",
  pathImage: "images/facebook.jpg",
);

const discord = MediaTile(
  title: "Discord",
  info:
      "Discord est un logiciel propriétaire gratuit de VoIP et de messagerie instantanée. Il fonctionne sur les systèmes d’exploitation Windows, macOS, Linux, Android, iOS ainsi que sur les navigateurs web. La plateforme comptabilise le 21 juillet 2019 plus de 250 millions d'utilisateurs. En 2019, l’entreprise emploie 165 salariés à San Francisco et est valorisée à 3,5 milliards de dollars.",
  pathImage: "images/discord.png",
);

const youtube = MediaTile(
  title: "Youtube",
  info:
      "YouTube est un site web d’hébergement de vidéos et un média social sur lequel les utilisateurs peuvent envoyer, regarder, commenter, évaluer et partager des vidéos en streaming. Il a été créé en février 2005 par Steve Chen, Chad Hurley et Jawed Karim, trois anciens employés de PayPal, et racheté par Google en octobre 2006 pour 1,65 milliard de dollars.",
  pathImage: "images/youtube.png",
);

const twitter = MediaTile(
  title: "Twitter",
  info:
      "Twitter est un réseau social de microblogage géré par l'entreprise Twitter Inc. Il permet à un utilisateur d’envoyer gratuitement des micromessages, appelés tweets ou gazouillis, sur internet, par messagerie instantanée ou par SMS. Ces messages sont limités à 280 caractères.",
  pathImage: "images/twitter.jpg",
);

const linkedIn = MediaTile(
  title: "LinkedIn",
  info:
      "LinkedIn est un réseau social professionnel en ligne créé en 2002 à Mountain View en Californie. L'entreprise est valorisée à 20 milliards de dollars en 2015. Le 13 juin 2016, Microsoft annonce le rachat du réseau social pour un montant de 26,2 milliards de dollars américains soit 23,4 milliards d'euros.",
  pathImage: "images/linkedin.png",
);

//------------------------

//Liste des médias filtré par leur type
const jeux = [undertale, oriAndTheBlindForest, hollowKnight];
const films = [avengersEndgame, spiderManNoWayHome];
const reseaux = [facebook, discord, youtube, twitter, linkedIn];

//La page de gestion des médias
//Le TabBarView permet le filtrage des médias
var mediaPage = TabBarView(children: [
  MediaView(mediaTileList: jeux + films + reseaux),
  const MediaView(mediaTileList: jeux),
  const MediaView(mediaTileList: films),
  const MediaView(mediaTileList: reseaux),
]);

//Class permettant d'afficher une liste de média donné en argument
class MediaView extends StatelessWidget {
  const MediaView({Key? key, required this.mediaTileList}) : super(key: key);
  final List<MediaTile> mediaTileList;
  static const padding = EdgeInsets.symmetric(horizontal: 8);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: mediaTileList,
      padding: padding,
    );
  }
}

//Class affichant le média
class MediaTile extends StatefulWidget {
  const MediaTile(
      {Key? key,
      required this.title,
      required this.info,
      required this.pathImage})
      : super(key: key);
  final String title;
  final String info;
  final String pathImage;

  @override
  State<MediaTile> createState() => _MediaTileState();
}

class _MediaTileState extends State<MediaTile> {
  @override
  Widget build(BuildContext context) {
    bool saved = savedList.contains(widget);
    return Card(
      child: InkWell(
        splashColor: Colors.blue,
        //Permet d'afficher plus d'information sur le média
        onTap: () {
          moreAbout(context);
        },
        child: ListTile(
          title: Text(widget.title),
          leading: Image(image: AssetImage(widget.pathImage), width: 80),
          //L'IconButton permet d'ajouter ou retirer des médias des favoris
          trailing: IconButton(
            icon: Icon(saved ? Icons.favorite : Icons.favorite_border),
            color: saved ? Colors.red : null,
            onPressed: () {
              setState(() {
                //Le média est sauvegardé ou retirer de la liste savedList et de l'une des 3 liste permettant le filtre des favoris
                if (!saved) {
                  savedList.add(widget);
                  jeux.contains(widget) ? savedJeux.add(widget) : null;
                  films.contains(widget) ? savedFilms.add(widget) : null;
                  reseaux.contains(widget) ? savedReseau.add(widget) : null;
                } else {
                  savedList.remove(widget);
                  savedJeux.remove(widget);
                  savedFilms.remove(widget);
                  savedReseau.remove(widget);
                }
              });
            },
          ),
        ),
      ),
    );
  }

  //Permet d'afficher plus d'information sur le média
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
                child: Card(
                  child: Container(
                    child:
                        pageInfo(widget.title, widget.pathImage, widget.info),
                    margin: const EdgeInsets.all(4),
                  ),
                ),
                margin: marge,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget pageInfo(String title, String pathImage, String info) {
    return Column(children: [
      Text(title, textScaleFactor: 2),
      Image(image: AssetImage(pathImage), height: 256),
      Text(info)
    ]);
  }
}

//=================Pour la page favoris========================

//Ces listes permettent de garder en mémoire les favoris et de les filtrer
final savedList = <MediaTile>[];
final savedJeux = <MediaTile>[];
final savedFilms = <MediaTile>[];
final savedReseau = <MediaTile>[];

//La page de favoris
var favorisPage = TabBarView(children: [
  MediaView(mediaTileList: savedList),
  MediaView(mediaTileList: savedJeux),
  MediaView(mediaTileList: savedFilms),
  MediaView(mediaTileList: savedReseau),
]);

//=================Pour la page d'information==================

//La page d'information
final aboutPage = Card(
  child: Container(
    alignment: Alignment.center,
    child: Column(
      children: const [
        Text("AGM", textScaleFactor: 4),
        Text("Créer par : Nilavan DEVA"),
        Text("Version : 2.2"),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ),
  ),
);
