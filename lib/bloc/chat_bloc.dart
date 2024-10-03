import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_chat_app/bloc/collection_type.dart';


class ChatBloc extends Cubit<ChatStatus> {
  ChatBloc() : super(InitStatus()) {
    test();

  }
  final _fireStore = FirebaseFirestore.instance;

  ChatStatus chatStatus = InitStatus();

  void setState(ChatStatus status) {
    chatStatus = status;
    emit(chatStatus);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> test() {





    return _fireStore.collection(CollectionType.users.name).snapshots();




    // try {
    //   QuerySnapshot querySnapshot = await _fireStore
    //       .collection('test')
    //       .get(const GetOptions(source: Source.server));  // Принудительно запрос с сервера
    //
    //   if (querySnapshot.docs.isEmpty) {
    //     print('No documents found.');
    //   } else {
    //     print('Data: ${querySnapshot.docs}');
    //   }
    // } on FirebaseException catch (e) {
    //   if (e.code == 'unavailable') {
    //     print('!!--------------------------No internet connection or Firestore service is unavailable.');
    //   } else {
    //     print('Firestore error: $e');
    //   }
    // } catch (e) {
    //   print('General error: $e');
    // }



    // try {
    //   await _fireStore.runTransaction((transaction) async {
    //     // Выполняем запрос внутри транзакции
    //     DocumentSnapshot snapshot = await transaction.get(_fireStore.collection('test').doc('someDocument'));
    //
    //
    //
    //     // Обработка данных
    //     if (snapshot.exists) {
    //       print('Document data: ${snapshot.data()}');
    //     } else {
    //       print('No document found.');
    //     }
    //   });
    // } on FirebaseException catch (e) {
    //   if (e.code == 'unavailable') {
    //     print('!!!!----------------------  ${e.message} code ----${e.code}');
    //   } else {
    //     print('Firestore error: $e');
    //   }
    // } catch (e) {
    //   print('General error: $e');
    // }
  }
}





sealed class ChatStatus {}

class InitStatus extends ChatStatus{}
class ChatError extends ChatStatus{}