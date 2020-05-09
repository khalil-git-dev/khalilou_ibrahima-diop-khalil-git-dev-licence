import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MassageCompose.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          child: Icon(Icons.add),
          // une fois appuyer sur le button de creation 
          onPressed: () async {
          // pour naviger vers un autre page il prend 2 parametres
            String intention = await Navigator.push(context, 
              MaterialPageRoute(
                builder: (BuildContext context) =>
                //REDIRECTION VERS LA PAGE de creation de nuveau message
                  MessageCompose(), 
                  
              ));
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("le message est $intention"),
                backgroundColor: Colors.green,
              ));
          },
        
    );
  }
}