import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()

class Message {
  final String title;
  final String body;

  Message(this.title, this.body);
  /*  la dinamisation de la structure de donnees 
      pour evider de repeter a chaque fois le prorietes de la structure 
      se qu'on appelle ( SERIALIZATION )
    */
  factory Message.formJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

    /**
     * cette method est mis en place pour c'est comme de dire ==> Message.browse
     */
    static Future<List<Message>> browse() async{
      /**
       * preparation de la response HTTP pour les donnes venant du server
       */
      http.Response response = 
          await http.get('http://www.mocky.io/v2/5eb69ca53100000d00c89f78'); // ce lien nous viens du site Mocky

          await Future.delayed(Duration(seconds: 3));
      String content = response.body;
      List collection = json.decode(content);
      List<Message> _messages = 
          collection.map((json) => Message.formJson(json)).toList();
    // a la fin on retourne d=les donnees qu'on a eu on utilise plus le setStart(){}
     return _messages;
    }
    
}
