import 'package:flutter/material.dart';
import 'package:pharmacie_mobile/departement-page.dart';
import 'package:pharmacie_mobile/setting-page.dart';
import 'MenuItem.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.teal
    )
  ),

    home: MyApp(),
));

class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final menus = [
    {'title':'Departement', 'icon':Icon(Icons.room),'page':DepartementPage()},
    //{'title':'Formation', 'icon':Icon(Icons.school),'page':FormationPage()},
    {'title':'Setting', 'icon':Icon(Icons.settings),'page':SettingPage()},
    {'title':'Contact', 'icon':Icon(Icons.contact_mail),'page':SettingPage()},
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("CFP-GETECH"),),
      body: Center(child: Text("Bienvenue à CFP-GETECH"),),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Center(
              child: CircleAvatar(backgroundImage: AssetImage("./images/cheik.png"),
              radius: 40,
              ),
            ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal,Colors.teal]
                )
              ),
            ),

            ...this.menus.map((item){
              return new Column(
              children: <Widget>[
                  Divider(
                  color: Colors.lightGreen,
                  ),
                  MenuItem(item['title'],item['icon'],(context){
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => item['page']));
                            })
                ],
              );
            })

          ],
        ),
      ),
    );
  }
}


