import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen.dart';
import 'drawerController.dart';

class MenuPage extends DrawerContent {
  MenuPage({Key key, this.title});
  final String title;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.dehaze),
          onPressed: () => {widget.onMenuPressed()},
        ),
        title: Text('Hidden Drawer'),
      ),
      body: Home(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  HiddenDrawerController _drawerController;
  @override
  void initState() {
    super.initState();
    _drawerController = HiddenDrawerController(
        initialPage: MenuPage(
          title: 'main',
        ),
        items: [
          DrawerItem(
            text: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.home, color: Colors.white),
            page: MenuPage(
              title: 'Home',
            ),
          ),
          DrawerItem(
            text: Text(
              'Gallery',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.photo_album, color: Colors.white),
            page: MenuPage(
              title: 'Gallery',
            ),
          ),
          DrawerItem(
            text: Text(
              'Favorites',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.favorite, color: Colors.white),
            page: MenuPage(
              title: 'Favorites',
            ),
          ),
          DrawerItem(
            text: Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.settings, color: Colors.white),
            page: MenuPage(
              title: 'Settings',
            ),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiddenDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.topLeft,
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.black.withOpacity(0.1), width: 1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              width: MediaQuery.of(context).size.width * 0.4,
              child: ClipOval(
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Hallo Chims',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 0),
              child: Text(
                'teach-media.net',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            )
          ]),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFC5185),
                Color(0xFF6B5072).withOpacity(0.8),
                Color(0xFF3F3D56)
              ]),
        ),
      ),
    );
  }
}
