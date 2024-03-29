import 'package:flutter/material.dart';
import 'package:kingsCup/cards.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Images',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

_launchURL(String url) async {
  String url1 = url;
  if (await canLaunch(url1)) {
    await launch(url1);
  } else {
    throw 'Could not launch $url1';
  }
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
          "https://media.giphy.com/media/3ov9jUCYetT3GVwcy4/giphy.gif",
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
          alignment: Alignment.center,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "KING'S CUP",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
              child: Row(
            children: <Widget>[],
          )),
          //BARRA DE NAVEGAÇÃO INFERIOR
          // bottomNavigationBar: BottomNavigationBar(
          //   color: Colors.white,
          //   onPressed: (){
          // })
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child:  IconButton(
                  icon: Icon(Icons.play_arrow),
                  
                  //color: Colors.red,
                  //iconSize: 100,
                  tooltip: "JOGAR",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cards()),
                    );
                  },
                ),
            onPressed: () {},
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 4.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(MdiIcons.githubCircle),
                  color: Colors.red,
                  //iconSize: 100,
                  tooltip: "Conheça os desenvolvedores",
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    _launchURL("http://github.com/gabrieloureiro");
                  },
                ),
                
               
                IconButton(
                  icon: Icon(Icons.share),
                  color: Colors.red,
                  //iconSize: 100,
                  tooltip: "Compartilhe o aplicativo",
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
