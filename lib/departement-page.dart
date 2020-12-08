import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'formation-page.dart';

class DepartementPage extends StatefulWidget {
  @override
  _DepartementPageState createState() => _DepartementPageState();
}

class _DepartementPageState extends State<DepartementPage> {

  List<dynamic> listDepartements;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departements"),
      ),
      body: Center(
          child: this.listDepartements==null?CircularProgressIndicator():
          ListView.builder(
              itemCount: (this.listDepartements==null)?0:this.listDepartements.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.teal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text(this.listDepartements[index]['Nom']),
                      onPressed: (){
                          Navigator.push(context, 
                              MaterialPageRoute(
                                  builder: (conext) => new FormationPage(listDepartements[index]) ));
                      },
                    ),
                  ),
                );
              }
          )
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDepartements();
  }

  void loadDepartements(){
    String url="http://192.168.42.12:1105/Departement/getAllDepartement";
    http.get(url)
        .then((resp){
      setState((){
        this.listDepartements=json.decode(resp.body)['Departements'];
      });

    }).catchError((err){
      print(err);
    });
  }
}
