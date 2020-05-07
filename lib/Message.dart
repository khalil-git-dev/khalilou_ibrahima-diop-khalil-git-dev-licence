class Message {
  final String title;
  final String body;

  Message(this.title, this.body);

  Message.formJson(Map<String, dynamic> json): title = json['title'], body = json['body'];
}