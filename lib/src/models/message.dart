import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String name;
  final String description;
  final DateTime date;
  Message({
    required this.name,
    required this.date,
    required this.description,
  });

  //!: FromJson constructor
  factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
        name: json['name'] as String,
        date: DateTime.parse(json['date'] as String),
        description: json['description'] as String,
      );

  //!: toJson method
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date.toString(),
        'name': name,
        'description': description,
      };

  //!: fromSnapshot constructor
  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    final message = Message.fromJson(snapshot.data() as Map<String, dynamic>);
    return message;
  }
}
