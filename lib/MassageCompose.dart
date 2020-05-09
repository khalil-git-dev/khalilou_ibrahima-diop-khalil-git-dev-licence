import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creer un nouveau message"),
        
      ),
      body: Container(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Nouveau Message",
            style: Theme.of(context).textTheme.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text("love"),
                  onPressed: () {
                    Navigator.pop(context, "Love you");
                  }),
                  RaisedButton(
                  child: Text("merci"),
                  onPressed: () {
                    Navigator.pop(context, " mercie pour tous");
                  },
                )
              ],
              
            )
          ],
        ),
      ),
      
    );
  }
}