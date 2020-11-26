import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormationPage extends StatefulWidget {
  @override
  _FormationPageState createState() => _FormationPageState();
}

class _FormationPageState extends State<FormationPage> {

  List<dynamic> listFormations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formations"),
      ),
      body: Center(
          child: this.listFormations==null?CircularProgressIndicator():
          ListView.builder(
              itemCount: (this.listFormations==null)?0:this.listFormations.length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.green,
                  child: RaisedButton(
                    child: Text(this.listFormations[index]['nom']),
                    onPressed: (){

                    },
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
    loadFormations();
  }

  void loadFormations(){
    String url="http://192.168.1.7:1105/Departement/getAllDepartement";
    http.get(url)
        .then((resp){
      setState((){
        this.listFormations=json.decode(resp.body)['Departements'];
      });

    }).catchError((err){
      print(err);
    });
  }
}