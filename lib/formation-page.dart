import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormationPage extends StatefulWidget {

  dynamic departement;

  FormationPage(this.departement);

  @override
  _FormationPageState createState() => _FormationPageState();
}

class _FormationPageState extends State<FormationPage> {
  List<dynamic> listFormations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formations de ${widget.departement['Nom']}'),
      ),
          body: Center(
            child: (this.listFormations==null)?CircularProgressIndicator():

              ListView.builder(
                  itemCount: (this.listFormations==null)?0:this.listFormations.length,
                  itemBuilder: (context,index){
                    return Card(
                      color: Colors.green,
                        child: RaisedButton(
                        child: Text(this.listFormations[index]['Nom']),

                        )
                    );
                  })
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
    String url = "http://192.168.42.12:1105/Departement/formations/${widget.departement['Id']}";
    http.get(url).then((resp) {
      setState((){
        this.listFormations=json.decode(resp.body)['Formations'];
      });
    }).catchError((err){
      print(err);
    });
  }
}
