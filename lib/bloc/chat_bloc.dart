import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/collection_type.dart';
import 'package:minimal_chat_app/bloc/model/message.dart';
import 'package:minimal_chat_app/bloc/search_user_bloc.dart';

const chatRoomIdSeparator = '_';

class ChatBloc extends Cubit<ChatStatus> {
  ChatBloc() : super(ChatInit());

  final _db = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverEmail, String receiverId, String message) async {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final currentUserEmail = FirebaseAuth.instance.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();

    final senderMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail!,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    final ids = [currentUserId, receiverId];
    ids.sort();

    final chatRoomId = ids.join();

    await _db
        .collection(CollectionType.chatrooms.name)
        .doc(chatRoomId)
        .collection(CollectionType.messages.name)
        .add(senderMessage.toJson());

    final chatroom = await _db
        .collection(CollectionType.users.name)
        .doc(currentUserId)
        .collection(CollectionType.chatrooms.name)
        .doc(chatRoomId)
        .get(options);
    if (!chatroom.exists) {
      await _db
          .collection(CollectionType.users.name)
          .doc(currentUserId)
          .collection(CollectionType.chatrooms.name)
          .doc(chatRoomId)
          .set({'chatRoomId': chatRoomId, 'receiverId': receiverId, 'receiverEmail' : receiverEmail});
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
      String senderId, receiverId) {
    final ids = [senderId, receiverId];
    ids.sort();
    final chatroomId = ids.join();
    return _db
        .collection(CollectionType.chatrooms.name)
        .doc(chatroomId)
        .collection(CollectionType.messages.name)
        .orderBy(MessageFields.timestamp.name, descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatRooms() {
    return _db
        .collection(CollectionType.users.name)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(CollectionType.chatrooms.name)
        .snapshots();
  }
}

sealed class ChatStatus {}

class ChatInit extends ChatStatus {}
