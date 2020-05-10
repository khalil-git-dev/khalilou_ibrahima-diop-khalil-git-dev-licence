import 'package:myflutter/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ComposeButton.dart';
import 'MessageDetail.dart';


class MessageList extends StatefulWidget {
  final String title;
  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList>  {
    Future<List<Message>> future;
    List<Message> messages;
     

    void initState() {
     // loadMessageList();
      super.initState();
      fetch();
    }
    void fetch() async {
      future = Message.browse();
      messages = await future;
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          // represent la class parent ==> (MessageList)
          title: Text(widget.title),
          actions: <Widget>[
            //Un button de Rafrechicheur de page manuel
            IconButton(icon: Icon(Icons.refresh), 
            onPressed:() async {
             var  _message = await Message.browse();

              setState((){
                messages = _message;
              });
            },)
          ],
        ),
        body: FutureBuilder(
          future: future,

          builder: (BuildContext context, AsyncSnapshot snapshot) {
            /** 
             * État actuel de connexion au calcul asynchrone.
             * On a different possibilite SNAPSHOT 
             * mainetenant on traite les possibilites
             */
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:  // en cours
                return Center(child: CircularProgressIndicator());
              case  ConnectionState.done: // une fois les donnees present
                // on recuper d'abbord les donnees 
                var messages = snapshot.data;
                // s'il ya une erreur 
                if(snapshot.hasError) return Text("On a une erreur ${snapshot.error}");
                
                return ListView.separated(  
                  itemCount: messages.length ,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index){
                    Message message = messages[index];
                    return ListTile(
                      title: Text(message.title),
                      isThreeLine: true,
                      leading: CircleAvatar(
                        child: Text('KH'),
                      ),
                      subtitle: Text(
                        message.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // ici c'est l'actio a faire si on tappe sur un message donner
                      onTap: () {
                        // on navige vers une autre page namme  
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (BuildContext context){
                            //redirection vers la page de datil avec les arguments titre et contunue pour l'affichage
                            return MessageDetail(message.title, message.body);
                          })
                        );
                      },
                    );
                  },
                );
            }
          },

        ),
          // on creer un button flottante
        floatingActionButton: ComposeButton(messages)
            
    );
  }
}
