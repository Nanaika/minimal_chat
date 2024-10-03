import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.message,
      required this.timestamp});

  Map<String, dynamic> toJson() {
    return {
      MessageFields.senderId.name: senderId,
      MessageFields.senderEmail.name: senderEmail,
      MessageFields.receiverId.name: receiverId,
      MessageFields.message.name: message,
      MessageFields.timestamp.name: timestamp,
    };
  }
}

enum MessageFields { senderId, senderEmail, receiverId, message, timestamp }
