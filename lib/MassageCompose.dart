import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Message.dart';

class MessageCompose extends StatelessWidget {
  String to ="";
  String title ="";
  String body = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creer un nouveau message"),
        
      ),
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title:  TextField(
                // Recuperation des valeur saisie dans ce chaps
                onChanged: (value) {
                  // affection de la valeur recuperer
                  to = value;
                },
                  decoration: InputDecoration(
                // prefixIcon: Icon(Icons.add),
                labelText: 'TO',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              ),
            ),
            ListTile(
              title:  TextField(
                onChanged: (value) {
                  title = value;
                },
              decoration: InputDecoration(
                labelText: 'TITLE',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
               maxLength: 9,
              ),
            
              
            ), 
            Divider(),
            ListTile(
              title: TextField(
                onChanged: (value) {
                  body = value;
                },
              decoration: InputDecoration(
                  labelText: 'BODY',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold)),
               maxLength: 50,
            ),
            
            ),
            ListTile(
              title: RaisedButton(
                child: Text("ENVOYER"),
                onPressed: () {
                  // creation d'un objst de type Message
                  Message message = Message(title, body);

                  Navigator.pop(context, message);
                },
              ),
            ),
          ],
        ),
      ) 
    );
  }
}

// Text("Creaton d'un nouveau Message",
//             style: Theme.of(context).textTheme.title),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 RaisedButton(
//                   child: Text("love"),
//                   onPressed: () {
//                     Navigator.pop(context, "Love you");
//                   }),
//                   RaisedButton(
//                   child: Text("merci"),
//                   onPressed: () {
//                     Navigator.pop(context, " mercie pour tous");
//                   },
//                 )
//               ],
              
//             )