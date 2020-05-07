import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MessageList extends StatefulWidget {
  final String title;
  const MessageList({Key key, this.title}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList>  {
    var messages = const [];

    Future loadMessageList() async {
      print(messages);
      String content = await rootBundle.loadString('data/message.json');
      List collection = json.decode(content);
      //print(collection);
      setState(() {
        messages = collection ;
      });
    }

    void initState() {
      loadMessageList();
      super.initState();
    }
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          // represent la class parent ==> (MessageList)
          title: Text(widget.title),
        ),
        body: ListView.separated(
          itemCount: messages.length ,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (BuildContext context, int index){
            var message = messages[index];
            return ListTile(
              title: Text(message["title"]),
              isThreeLine: true,
              leading: CircleAvatar(
                child: Text('KH'),
              ),
              subtitle: Text(
                message["body"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        )
    );
  }
}
