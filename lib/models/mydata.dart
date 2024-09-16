import 'package:cloud_firestore/cloud_firestore.dart';

class Mydata {
  final String quote;
  final String author;
  final DateTime? date;

  Mydata({required this.quote, required this.author, this.date});

  factory Mydata.fromFirestore(Map<String, dynamic> map) {
    return Mydata(
      quote: map['quote'] ?? '',
      author: map['author'] ?? '',
      date: map['date'] != null ? (map['date'] as Timestamp).toDate() : null,
    );
  }

  factory Mydata.fromJson(Map<String, dynamic> json) {
    return Mydata(
      quote: json['quote'],
      author: json['author'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quote': quote,
      'author': author,
      'date': date?.toIso8601String()
    };
  }
}