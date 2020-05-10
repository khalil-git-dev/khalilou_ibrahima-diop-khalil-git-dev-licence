import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MassageCompose.dart';
import 'Message.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;
  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          child: Icon(Icons.add),
          // une fois appuyer sur le button de creation 
          onPressed: () async {
          //  Recuperation des donnees depuis 
            Message message = await Navigator.push(context, 
              MaterialPageRoute(
                builder: (BuildContext context) =>
                //REDIRECTION VERS LA PAGE de creation de nuveau message
                  MessageCompose(), 
                  
              ),
            );
            if(message != null){
                /** une fois le message conient quelque chose 
                 * ON AJOUT LE NOUVEAU MESSAGE CONCU VIA LE BUTTON DANS LE TABLEAU DE MESSAGE
                 */
              messages.add(message);
               Scaffold.of(context).showSnackBar(
               SnackBar(content: Text("Un nouveau message envoye "),
               backgroundColor: Colors.green,
              ));
            }
             
          },
        
    );
  }
}